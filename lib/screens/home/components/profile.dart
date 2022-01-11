import 'dart:convert';
import 'dart:io';
import 'package:UnivTodo/data/db.dart';
import 'package:UnivTodo/screens/home/components/calendar.dart';
import 'package:UnivTodo/screens/home/components/todo.dart';
import 'package:UnivTodo/screens/home/home_screen.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:UnivTodo/constants/constants.dart';
import 'package:UnivTodo/screens/home/components/courses.dart';
import 'package:UnivTodo/screens/home/components/custom_app_bar.dart';
import 'package:UnivTodo/screens/home/components/search_bar.dart';
import 'package:UnivTodo/screens/home/components/profile_page.dart';
import 'package:UnivTodo/screens/home/components/profile.dart';
import 'package:UnivTodo/screens/home/components/diff_styles.dart';
import 'package:UnivTodo/screens/home/components/profile_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class Pf extends StatefulWidget {
  @override
  _PfState createState() => _PfState();
}

class _PfState extends State<Pf> {
  int selsctedIconIndex = 4;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.blueGrey,
        title: Text('📝 나의 프로필'),
      ),


      extendBody: true,
      body: Padding(
        padding: EdgeInsets.only(top:appPadding * 2),

        child: Column(
          children: [
            ProfilePage(),
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

