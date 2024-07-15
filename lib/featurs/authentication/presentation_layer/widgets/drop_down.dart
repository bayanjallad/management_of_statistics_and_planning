import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import '../../../../core/constants/constantsColor.dart';

Widget DropDown(String text,TextEditingController controller,List items){
  return  DropdownButtonFormField2(
      decoration: InputDecoration(filled: true,
        fillColor: lightYellow,
        enabledBorder:OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: darkBlue,width: 1.4)
        ),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: darkBlue,width: 1.4)
        ),
        isDense: true,
        contentPadding: EdgeInsets.zero,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
      isExpanded: true,
      hint:  Text(
        text,
        style: TextStyle(fontSize: 14,color: darkBlue),
      ),
      items: items
          .map((item) => DropdownMenuItem<String>(
        value: item,
        child: Text(
          item,
          style: const TextStyle(
            fontSize: 14,
              color: darkBlue
          ),
        ),
      )).toList(),
        onChanged: (value) {
          //Do something when selected item is changed.
        },
      onSaved: (value) {
        controller.text = value!;
        },
      buttonStyleData: const ButtonStyleData(
        height: 56,
        padding: EdgeInsets.only(left: 20, right: 10),

      ),
      iconStyleData: const IconStyleData(
        icon: Icon(
          Icons.arrow_drop_down,
          color: darkBlue,
        ),
        iconSize: 30,
      ),
      dropdownStyleData: DropdownStyleData(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
  );
}