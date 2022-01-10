import 'package:flutter/material.dart';
import 'package:UnivTodo/constants/constants.dart';
import 'package:UnivTodo/screens/login/components/curve_clipper.dart';



class BackgroundImage2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;

    return ClipPath(
      clipper: CurveClipper(),
      child: Container(
        height: size.height * 0.55,
        color: blueGrey.withOpacity(0.7),
        child: Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: appPadding / 2,
              vertical: appPadding * 3),
          child: Center(
            child: Image(
              image: AssetImage('assets/images/hello.png'),
              height: 330,
              width: 328,
              fit: BoxFit.cover,

            ),
          ),
        ),
      ),
    );
  }
}
