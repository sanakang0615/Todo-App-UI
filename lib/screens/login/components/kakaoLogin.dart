import 'dart:convert';
import 'dart:io';
import 'package:UnivTodo/data/db.dart';
import 'package:UnivTodo/screens/login/login_screen.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kakao_flutter_sdk/all.dart';
import 'package:kakao_flutter_sdk/auth.dart';
import 'package:http/http.dart' as http;
import 'package:toast/toast.dart';
import 'package:UnivTodo/screens/home/home_screen.dart';
import 'package:UnivTodo/screens/login/login_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Post {
  final int statusCode;
  final String responseMessage;
  final String data;

  Post({this.statusCode, this.responseMessage, this.data});

  // factory 생성자. Post 타입의 인스턴스를 반환
  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
        statusCode: json['statusCode'],
        responseMessage: json['responseMessage'],
        data: json['data']);
  }
}


Future<Auth> kakaoAuth(kakaoId, BuildContext c) async {
  SharedPreferences user_info = await SharedPreferences.getInstance();
  print(kakaoId);
  var result = await http.post(Uri.parse('http://192.249.18.137/user/kakao/sign-in'),
      headers: { HttpHeaders.contentTypeHeader: 'application/json'},
      body: jsonEncode({
        'kakaoId': kakaoId,
      })
  );
  print(result.toString());
  print(result.statusCode);
  Auth a = Auth.fromJson(json.decode(result.body));
  AuthData adata = AuthData.fromJson(a.data);

  if (a.statusCode == 200) {
    Toast.show(a.responseMessage, c);

    user_info.setString("accessToken", adata.accessToken);
    user_info.setString("refreshToken", adata.refreshToken);

    Navigator.push(
      c,
      MaterialPageRoute(builder: (context) => HomeScreen()),
    );
  }

    else {
      Toast.show(a.responseMessage, c);
      Navigator.push(
        c,
        MaterialPageRoute(builder: (context) => LoginScreen()),
      );
    }

}

requestMe(kakaoAccessToken, BuildContext c) async {
  String tk = kakaoAccessToken.toString();
  String v = jsonEncode(kakaoAccessToken);

  var result = await http.get(Uri.parse('https://kapi.kakao.com/v2/user/me'),
      headers: { HttpHeaders.authorizationHeader: 'Bearer ' + tk.substring(17,tk.indexOf('"', 18))});
  String bd = result.body.toString();
  String bdd = bd.substring(6, bd.indexOf('"', 7)-1);
  print(bdd);

  return kakaoAuth(int.parse(bdd), c);
}



_issueAccessToken(String authCode, BuildContext c) async {
  try {
    var token = await AuthApi.instance.issueAccessToken(authCode);
    print(token);
    return requestMe(token, c);

  } catch (e) {
    print("error on issuing access token: $e");
  }
}


class KakaoLoginPage extends StatefulWidget {
  @override
  _KakaoLoginPageState createState() => _KakaoLoginPageState();

}


class _KakaoLoginPageState extends State<KakaoLoginPage> {

  String atk;

  _loginButtonPressed() async {
    try {
      String authCode = await AuthCodeClient.instance.request();
      print(authCode);
      atk = await _issueAccessToken(authCode, context);
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        minimum: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              width: MediaQuery
                  .of(context)
                  .size
                  .width,
              child: CupertinoButton(
                onPressed: _loginButtonPressed,
                color: Colors.yellow,
                child: Text(
                  '카카오 로그인',
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.black87,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<Post> fetchPost() async {
    var response =
    await http.post(
        Uri.parse('http://192.249.18.137/kakao/sign-in'),
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'kakaoId': atk,
        })
    );
    print(response.toString());
  }
}


