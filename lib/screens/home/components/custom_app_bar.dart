import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:UnivTodo/constants/constants.dart';

class CustomAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;

    return  Padding(
      padding: EdgeInsets.only(left: 20.0,right: 10.0, top: 20.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(appPadding / 8),
                child: Container(
                  decoration: new BoxDecoration(
                    color: Colors.blueGrey,
                    shape: BoxShape.circle,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(appPadding / 20),
                    child: Container(
                      decoration: new BoxDecoration(
                        color: white,
                        shape: BoxShape.circle,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(appPadding / 8),
                        child: Center(
                          child: CircleAvatar(
                            backgroundImage: AssetImage(
                              'assets/images/profile.png',
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),

              Column(
                children: [
                  Text(
                    ' Sana Kang',
                    style: TextStyle(color: black, fontWeight: FontWeight.w600,fontSize: 16),
                  ),

                ],
              )

            ],
          ),

          Row(
            children: [
              TextButton.icon(
                onPressed: () { },
                icon: Icon(Icons.add, size: 12),
                label: Text("학교 인증하기"),
              ),
              Stack(
                children: [

                  Icon(
                    Icons.notifications_none_rounded,
                    size: 30.0,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: blueGrey.withOpacity(0.9),
                        borderRadius: BorderRadius.circular(30.0)
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Text('0',style: TextStyle(color: white,fontSize: 8),),
                    ),
                  )
                ],
              ),
              Transform(
                transform: Matrix4.rotationY(math.pi),
                alignment: Alignment.center,
                child: Icon(
                  Icons.sort_rounded,
                  size: 30.0,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

