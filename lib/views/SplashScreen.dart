import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smart/widgets_common/applogo_widget.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:get/get.dart';

import 'auth_screen/login_screen.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  //method change screen
  changeScreen(){
    Future.delayed(Duration(seconds: 3),(){
     Get.to(()=> LoginScreen());
    });
  }
  @override
  void initState() {
    // TODO: implement initState
    changeScreen();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(230, 46, 4, 1),
      body: Center(
        child: Column(
          children: <Widget>[
            Align(
                alignment: Alignment.topLeft,
                child: Image.asset(
                  "assets/icons/splash_login_registration_background_image.png",
                  width: 300,
                )),
            20.heightBox,
            applogoWidget(),
            SizedBox(height: 10),
            Text(
              "SMart",
              style: TextStyle(
                  fontFamily: "sans_regular",
                  fontSize: 22,
                  color: Colors.white,
                  fontWeight: FontWeight.w600),
            ),
            SizedBox(height: 5),
            Text(
              "Version 1.0.0",
              style: TextStyle(
                  fontFamily: "sans_semibold",
                  fontWeight: FontWeight.normal,
                  color: Colors.white),
            ),
            Spacer(),
            Text(
              "@Nhun Devs",
              style: TextStyle(
                  fontFamily: "sans_semibold",
                  fontWeight: FontWeight.normal,
                  color: Colors.white),
            ),
            SizedBox(height: 30,)
          ],
        ),
      ),
    );
  }
}
