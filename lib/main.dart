import 'package:UnivTodo/screens/login/components/kakaoLogin.dart';
import 'package:flutter/material.dart';
import 'package:UnivTodo/screens/login/login_screen.dart';
import 'package:kakao_flutter_sdk/all.dart';

void main() {
  KakaoContext.clientId = '	54d1ac747f51dee29eb7f1735f0486c7';
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Univ Todo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: LoginScreen()
        //KakaoLoginPage(),
      //LoginScreen(),
    );
  }
}
