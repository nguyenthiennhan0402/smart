import 'package:flutter/cupertino.dart';
import 'package:velocity_x/velocity_x.dart';

Widget homeButton({width, height, icon, String? title, onpress}){
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Image.asset(icon, width: 26,),
      SizedBox(height: 5,),
      Text(title.toString(), style: TextStyle(fontFamily: "sans_semibold",color: Color.fromRGBO(62, 68, 71, 1)),)
    ],
  ).box.rounded.white.size(width, height).shadowSm.make();
}