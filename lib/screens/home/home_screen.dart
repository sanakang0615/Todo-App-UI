import 'dart:convert';
import 'dart:io';

import 'package:UnivTodo/data/db.dart';
import 'package:UnivTodo/screens/home/components/calendar.dart';
import 'package:UnivTodo/screens/home/components/todo.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:UnivTodo/constants/constants.dart';
import 'package:UnivTodo/screens/home/components/courses.dart';
import 'package:UnivTodo/screens/home/components/custom_app_bar.dart';
import 'package:UnivTodo/screens/home/components/search_bar.dart';
import 'package:UnivTodo/screens/home/components/profile.dart';
import 'package:UnivTodo/screens/home/components/diff_styles.dart';
import 'package:UnivTodo/screens/home/components/profile_page.dart';
import 'package:toast/toast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:UnivTodo/screens/login/login_screen.dart';
import 'package:UnivTodo/data/db.dart';

class Post {
  final int statusCode;
  final String responseMessage;
  final int data;

  Post({this.statusCode, this.responseMessage, this.data});

  // factory 생성자. Post 타입의 인스턴스를 반환
  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
        statusCode: json['statusCode'],
        responseMessage: json['responseMessage'],
        data: json['data']);
  }
}


class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  SharedPreferences user_info;
  int selsctedIconIndex = 2;
  int _token;

  _loadToken() async {
    user_info = await SharedPreferences.getInstance();
    print(user_info.get("accessToken"));
    print("토큰입니다,");
    // setState(() {
    //   _token = (_prefs.getInt('counter') ?? -1);
    // });
    return getUserId(user_info.get("accessToken"));
  }


  getUserId(AccessToken) async {
    SharedPreferences user_info = await SharedPreferences.getInstance();
    var result = await http.get(Uri.parse('http://192.249.18.137/user/get-id'),
        headers: { HttpHeaders.authorizationHeader: "Bearer " + AccessToken.toString()}
    );
    print(result.body.toString());
    Post res = Post.fromJson(json.decode(result.body));

    if (result.statusCode == 200) {
      print(res.data.toString());
      if (res.data != null) {
        final int id = res.data;
        user_info.setInt("id", id);
        print(id);
      }
    }
  }


  @override
  Widget build(BuildContext context) {

    getUserId(_loadToken());

    return Scaffold(
      backgroundColor: Colors.white,
      extendBody: true,
      body: Padding(
        padding: EdgeInsets.only(top:appPadding * 2),

        child: Column(
          children: [
            CustomAppBar(),
            Todo(),
            Courses(),
          ],
        ),
      ),
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.transparent,
        index: selsctedIconIndex,
        buttonBackgroundColor: Colors.blueGrey,
        height: 60.0,
        color: white,
        onTap: (index) {
          setState(() {
            selsctedIconIndex = index;
          });
        },
        animationDuration: Duration(
          milliseconds: 200,
        ),
        items: <Widget>[
          Icon(Icons.play_arrow_outlined, size: 30,color: selsctedIconIndex == 0 ? white : black,),
          InkWell(
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Home(),
                ),
              ),
              child: Icon(
                Icons.search, size: 30,color: selsctedIconIndex == 1 ? white : black,
              )
          ),
          InkWell(
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => HomeScreen(),
                ),
              ),
              child: Icon(Icons.home_outlined, size: 30,color: selsctedIconIndex == 2 ? white : black,)
          ),
          InkWell(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DynamicEvent(),
              ),
            ),
            child: Icon(
                Icons.checklist,
                size: 30,
                color: selsctedIconIndex == 3 ? white : black
            ),
          ),
          InkWell(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Pf(),
              ),
            ),
            child: Icon(Icons.person_outline, size: 30,color: selsctedIconIndex == 4 ? white : black,),
          ),

        ],
      ),
    );
  }
}

