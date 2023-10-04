import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget ourButton(onPress,color, textColor,title){
  return ElevatedButton(
      onPressed:
        onPress,
      style: ElevatedButton.styleFrom(
        primary: color,
        padding: EdgeInsets.all(5),
      ),
      child: Text(title.toString(), style: TextStyle(color: textColor,fontWeight: FontWeight.bold),));
}