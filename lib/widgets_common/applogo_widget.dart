import 'package:flutter/cupertino.dart';
import 'package:velocity_x/velocity_x.dart';

Widget applogoWidget(){
  return Image.asset("assets/icons/app_logo.png").box.white.size(66, 66)
      .padding(EdgeInsets.all(8)).rounded.make();
}