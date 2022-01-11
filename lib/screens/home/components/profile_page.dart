import 'dart:convert';
import 'dart:io';
import 'package:UnivTodo/data/db.dart';

import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:UnivTodo/constants/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

String name = '';
String email = '';
List organizations = [];
List followers = [];
List follows = [];

SharedPreferences user_info;

_loadId() async {
  user_info = await SharedPreferences.getInstance();
  print(user_info.get("id"));
  print("토큰입니다,");
  final int userId = user_info.get("id");
  return getProfile(user_info.get("accessToken"));
}

getProfile(AccessToken) async {
  SharedPreferences user_info = await SharedPreferences.getInstance();
  var result = await http.get(Uri.parse('http://192.249.18.137/user/info'),
      headers: { HttpHeaders.authorizationHeader: "Bearer " + AccessToken.toString()}
  );

  UserInfo res = UserInfo.fromJson(json.decode(result.body));
  UserInfoData resdata = UserInfoData.fromJson(res.data);

  if (result.statusCode == 200) {
    print(resdata.name);
    if (resdata != null) {
      name = resdata.name.toString();
      email = resdata.email.toString();
      //followers = resdata.followers;
      //follows = resdata.follows;
      organizations = resdata.organizations;

      print(name);
      print(email);

    }
  }
}


class ProfilePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    _loadId();

    Size size = MediaQuery.of(context).size;

    return  Padding(
      padding: EdgeInsets.only(left: 20.0,right: 10.0, top: 20.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(appPadding / 5),
                child:Container(
                  width: 300,
                  height: 200,
                  decoration: new BoxDecoration(
                    color: Colors.blueGrey.withOpacity(0.5),
                    shape: BoxShape.circle,
                  ),
                  child: Image.asset('assets/images/profile.png',
                      width: 300, height:200
                  )),

                ),
              SizedBox(
                height: size.height * 0.045,
              ),
              Text(
                name,
                style: TextStyle(color: black, fontWeight: FontWeight.w500,fontSize: 28),
              ),
              SizedBox(
                height: size.height * 0.045,
              ),
              Text(
                ' KAIST',
                style: TextStyle(color: black, fontWeight: FontWeight.w400,fontSize: 20),
              ),

              SizedBox(
                height: size.height * 0.043,
              ),
              Text(
                email,
                style: TextStyle(color: black, fontWeight: FontWeight.w400,fontSize: 20),
              ),
              SizedBox(
                height: size.height * 0.045,
              ),
              Text(
                ' 20',
                style: TextStyle(color: black, fontWeight: FontWeight.w400,fontSize: 20),
              ),
              SizedBox(
                height: size.height * 0.045,
              ),
              Text(
                ' 30',
                style: TextStyle(color: black, fontWeight: FontWeight.w400,fontSize: 20),
              ),

            ],
          ),


      ]),);
  }
}

