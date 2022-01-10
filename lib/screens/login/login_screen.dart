import 'package:UnivTodo/constants/constants.dart';
import 'package:UnivTodo/screens/login/components/signin_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:UnivTodo/screens/login/components/background_image_clipper.dart';
import 'package:UnivTodo/screens/login/components/circle_button.dart';
import 'package:UnivTodo/screens/login/components/login_credentials.dart';
import 'package:kakao_flutter_sdk/all.dart';
import 'package:UnivTodo/screens/login/components/kakaoLogin.dart';
import 'package:flutter_web_auth/flutter_web_auth.dart';

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:UnivTodo/data/db.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}


class _LoginScreenState extends State<LoginScreen> {
  Future myFuture;

  @override
  void initState() {
    // assign this variable your Future
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BackgroundImage(),
                LoginCredentials(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: size.height * 0.053,
                    ),
                    Text( '아직 계정이 없으신가요?',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black.withOpacity(0.68),
                      ),

                    ),
                    TextButton(
                        onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SigninScreen()
                          )
                        ),
                        child: Text("회원가입하기"),
                        style: TextButton.styleFrom(
                          textStyle: TextStyle(fontWeight: FontWeight.bold),
                        )

                    ),
                  ]
                ),
                SizedBox(
                  height: size.height * 0.0135,
                ),

                Container(
                    alignment: Alignment.center,
                    child: SizedBox(
                        height: 40.0,
                        width: 300.0,
                        child: TextButton.icon(

                            icon: Icon(Icons.favorite, size: 14),
                            label: Text("Univ TODO")
                        )
                    )
                )
              ],
            )
            //CircleButton()
          ],
        ),
      ),
    );
  }

}