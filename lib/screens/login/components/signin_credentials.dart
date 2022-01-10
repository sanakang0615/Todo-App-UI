import 'package:UnivTodo/screens/login/components/kakaoLogin.dart';
import 'package:flutter/material.dart';
import 'package:UnivTodo/constants/constants.dart';
import 'package:UnivTodo/screens/home/home_screen.dart';
import 'package:kakao_flutter_sdk/all.dart';
import 'package:flutter_web_auth/flutter_web_auth.dart';

import 'package:UnivTodo/screens/login/components/kakaoLogin.dart';
import 'package:flutter/material.dart';
import 'package:UnivTodo/screens/login/login_screen.dart';
import 'package:kakao_flutter_sdk/all.dart';

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';

import 'dart:async'; // async/await 를 이용하기 위한 라이브러리이나 선언하지 않아도 이용가능
import 'dart:convert'; // json 데이터 변환용 라이브러리
import 'package:http/http.dart' as http; // Http 프로토콜을 이용하기 위한 패키지
import 'package:UnivTodo/data/db.dart';




class SigninCredentials extends StatelessWidget {
  Future<Post> post;

  SigninCredentials({Key key, @required this.post}) : super(key: key);

  TextEditingController new_emailController = TextEditingController();
  TextEditingController new_passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: appPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            ' Sign-in Page',
            style: TextStyle(
              fontSize: 24,
            ),
          ),
          SizedBox(
            height: size.height * 0.045,
          ),
          Material(
            elevation: 10.0,
            color: white,
            borderRadius: BorderRadius.circular(30.0),
            child: TextField(
              controller: new_emailController,
              decoration: InputDecoration(
                border:
                OutlineInputBorder(borderSide: BorderSide.none),
                contentPadding: EdgeInsets.symmetric(
                    vertical: appPadding * 0.75,
                    horizontal: appPadding),
                fillColor: white,
                hintText: 'Email',
                suffixIcon: Icon(
                  Icons.email_outlined,
                  size: 25.0,
                  color: black.withOpacity(0.4),
                ),
              ),
            ),
          ),
          SizedBox(
            height: size.height * 0.03,
          ),
          Material(
            elevation: 10.0,
            color: white,
            borderRadius: BorderRadius.circular(30.0),
            child: TextField(
              controller: new_passwordController,
              obscureText: true,
              decoration: InputDecoration(
                border:
                OutlineInputBorder(borderSide: BorderSide.none),
                contentPadding: EdgeInsets.symmetric(
                    vertical: appPadding * 0.75,
                    horizontal: appPadding),
                fillColor: Colors.white,
                hintText: 'Password',
                suffixIcon: Icon(
                  Icons.lock_outline,
                  size: 25.0,
                  color: black.withOpacity(0.4),
                ),
              ),
            ),
          ),

          SizedBox(
            height: size.height * 0.035,
          ),

          Align(
            alignment: Alignment.center,
            child: Center(
              child: InkWell(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HomeScreen(),
                    ),
                  ),
                  child: Material(
                      elevation: 10.0,
                      shadowColor: blueGrey.withOpacity(0.65),
                      color: blueGrey.withOpacity(0.65),
                      borderRadius: BorderRadius.circular(30.0),
                      child: Container(
                        width: size.width*0.42,
                        height: size.width * 0.12,
                        child: Center(
                          child: Text(
                            '가입하기',
                            style: TextStyle(
                              color: white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      )),
                ),
          ))
              ],



          )


    );
  }
}