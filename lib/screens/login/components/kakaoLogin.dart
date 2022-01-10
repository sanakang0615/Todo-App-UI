import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_auth/flutter_web_auth.dart';
import 'package:kakao_flutter_sdk/all.dart';
import 'package:uuid/uuid.dart';


class KakaoLoginPage extends StatefulWidget {
  @override
  _KakaoLoginPageState createState() => _KakaoLoginPageState();
}

class _KakaoLoginPageState extends State<KakaoLoginPage> {
  Future<void> _loginButtonPressed() async {
    String authCode = await AuthCodeClient.instance.request();
    print(authCode);


    final clientState = Uuid().v4();
    final url = Uri.https('kauth.kakao.com', '/oauth/authorize', {
      'response_type': 'code',
      'client_id': '745ffe68d06ddbf22efb96dc9fc84f47',
      'redirect_uri': 'http://192.249.18.137:80/user/kakao',
      'state': clientState,
    });

    final result = await FlutterWebAuth.authenticate(
        url: url.toString(), callbackUrlScheme: "webauthcallback");

    final body = Uri.parse(result).queryParameters;
    print(body);
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
                color: Colors.yellow.withOpacity(0.9),
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