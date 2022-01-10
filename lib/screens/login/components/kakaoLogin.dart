import 'dart:convert';
import 'dart:io';
import 'package:UnivTodo/data/db.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kakao_flutter_sdk/all.dart';
import 'package:kakao_flutter_sdk/auth.dart';
import 'package:http/http.dart' as http;



requestMe(kakaoAccessToken) async {
  print(kakaoAccessToken.toString());
  String v = jsonEncode(kakaoAccessToken);
  // var result = await http.get(Uri.parse('https://kapi.kakao.com/v2/user/me'),
  //   headers: { HttpHeaders.authorizationHeader: 'Bearer ' + kakaoAccessToken["access_token"]});
  // print(result.statusCode);
  int result = 0;
  return result;
}

_issueAccessToken(String authCode) async {
  try {
    var token = await AuthApi.instance.issueAccessToken(authCode);
    //print(token);
    requestMe(token);

  } catch (e) {
    print("error on issuing access token: $e");
  }
}

class KakaoLoginPage extends StatefulWidget {
  @override
  _KakaoLoginPageState createState() => _KakaoLoginPageState();
}

class _KakaoLoginPageState extends State<KakaoLoginPage> {
  Future<void> _loginButtonPressed() async {
    try {
      String authCode = await AuthCodeClient.instance.request();
      //print(authCode);
      await _issueAccessToken(authCode);
    } catch(e){
      //print(e);
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
              width: MediaQuery.of(context).size.width,
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
}