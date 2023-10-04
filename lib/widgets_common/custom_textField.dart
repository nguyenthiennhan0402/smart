import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget customTextField(String? title, String? hint, controller, isPass) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Text(
        title.toString(),
        style: TextStyle(
          fontFamily: "sans_semibold",
          fontWeight: FontWeight.bold,
          fontSize: 14,
          color: Colors.red,
        ),
      ),
      SizedBox(height: 5,),
      TextFormField(
        obscureText: isPass,
        controller: controller,
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: TextStyle(color: Color.fromRGBO(105, 100, 100, 1.4)),
          isDense: true,
          fillColor: Color.fromRGBO(239, 239, 239, 1),
          filled: true,
          border: InputBorder.none,
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red),
          )
        ),
      ),
    ],
  );
}
