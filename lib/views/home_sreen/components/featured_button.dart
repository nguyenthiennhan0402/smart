import 'package:flutter/cupertino.dart';
import 'package:velocity_x/velocity_x.dart';
const imgS1 = "assets/images/s1.jpg";
const imgS2 = "assets/images/s2.jpg";
const imgS3 = "assets/images/s3.jpg";
const imgS4 = "assets/images/s4.jpg";
const imgS5 = "assets/images/s5.jpg";
const imgS6 = "assets/images/s6.jpg";
const imgS7 = "assets/images/s7.jpg";
const imgS8 = "assets/images/s8.jpg";
const imgS9 = "assets/images/s9.jpg";
const imgS10 = "assets/images/s10.jpg";
const imgS11 = "assets/images/s11.jpg";
const imgS12 = "assets/images/s12.jpg";


Widget featuredButton({String? title, icon}){
  return Row(
    children: [
      Image.asset(icon,width: 60, fit: BoxFit.fill,),
      SizedBox(width: 10,),
      Text(title.toString(), style: TextStyle(fontFamily: "sans_semibold"),)
    ],
  ).box.width(200).margin(EdgeInsets.symmetric(horizontal: 4)).white. padding(EdgeInsets.all(4)).roundedSM.outerShadowSm.make();
}