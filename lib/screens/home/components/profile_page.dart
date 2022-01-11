import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:UnivTodo/constants/constants.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

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
                ' Sana Kang',
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
                ' email:',
                style: TextStyle(color: black, fontWeight: FontWeight.w400,fontSize: 20),
              ),
              SizedBox(
                height: size.height * 0.045,
              ),
              Text(
                ' Followers',
                style: TextStyle(color: black, fontWeight: FontWeight.w400,fontSize: 20),
              ),
              SizedBox(
                height: size.height * 0.045,
              ),
              Text(
                ' Follows',
                style: TextStyle(color: black, fontWeight: FontWeight.w400,fontSize: 20),
              ),

            ],
          ),


      ]),);
  }
}

