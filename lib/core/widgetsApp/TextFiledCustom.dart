import 'package:flutter/material.dart';
import '../constants/constantsColor.dart';

Widget TextFiledCustom(Color?textFiedColor ,int maxLines, TextEditingController controller){
  return TextFormField(
    maxLines: maxLines,
    style: const TextStyle(color:brown),
    onSaved: (value){
      controller.text=value!;
    },
    controller: controller,
    decoration: InputDecoration(
      filled: true,
      fillColor: textFiedColor,
      enabledBorder:OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: brown,width: 1.4)
      ),
      focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: brown,width: 1.4)
      ),
    ),
  );}

