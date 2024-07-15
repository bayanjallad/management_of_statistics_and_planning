import 'package:flutter/material.dart';
import '../constants/constantsColor.dart';

Widget ButtonCustom(double width, double height,Widget widget,Color buttonColor,Color textColor,Function()?function){
  return Align(
    alignment: Alignment.bottomCenter,
    child: Padding(
      padding: const EdgeInsets.only(top: 40),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(shadowColor: pink,
            backgroundColor: buttonColor,
            fixedSize: Size(width, height),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10))),
        onPressed: function,
        child: widget

      ),
    ),
  );
}

