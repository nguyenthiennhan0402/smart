import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:smart/controller/auth_controller.dart';

import 'package:smart/list.dart';
import 'package:smart/views/auth_screen/signup_screen.dart';
import 'package:smart/widgets_common/applogo_widget.dart';
import 'package:smart/widgets_common/bg_widget.dart';
import 'package:smart/widgets_common/our_button.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../widgets_common/custom_textField.dart';
import '../home_sreen/home.dart';


class LoginScreen extends StatelessWidget {
  TextEditingController txtcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(AuthController());
    return bgWidget(Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Column(
          children: [
          SizedBox(height: 60,),
          applogoWidget(),
          SizedBox(height: 10),
            Text(
              "Log in to SMart",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18),
            ),
            SizedBox(
              height: 5,
            ),
            Obx(() =>
               Column(
                children: <Widget>[
                  customTextField("Email", "abc@gmail.com", controller.emailController, false),
                  SizedBox(height: 5),
                  customTextField("Password", "*****", controller.passwordController, true),
                  SizedBox(
                    height: 5,
                  ),
                  Align(
                    child: TextButton(
                        onPressed: () {
                        }, child: Text("Forget Password")),
                    alignment: Alignment.centerRight,
                  ),
                  SizedBox(height: 5,),
                  //login btn
                  controller.isloading.value ? const CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation(Colors.red),
                  ) : ourButton(() async{
                    await controller.loginMethod(context: context).then((value) => {
                        if(value != null){
                          VxToast.show(context, msg: "Logged in"),
                          Get.offAll(()=> const Home()),
                        }
                    });

                  },Color.fromRGBO(230, 46, 4, 1), Colors.white,"Log in").box.width(context.screenWidth - 50).make(),
                  SizedBox(height: 5,),
                  Text("or create a new account"),
                  SizedBox(height: 10,),
                  ourButton((){
                    Get.to(()=> SignUp());
                  },Color(0xffFEEAD1),Colors.red,"Sign up").box.width(context.screenWidth - 50).make(),
                  SizedBox(height: 5),
                  Text("Log in with"),
                  SizedBox(height: 5,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(3, (index) => Padding(
                      padding: EdgeInsets.all(8.0),
                      child: CircleAvatar(
                        backgroundColor: Color.fromRGBO(239, 239, 239, 1),
                        radius: 25,
                        child: Image.asset(
                            socialIconList[index],
                        width: 30),

                      ),
                    )),
                  )
                ],
              )
                  .box
                  .white
                  .rounded
                  .padding(EdgeInsets.all(16))
                  .width(context.screenWidth - 70)
                  .shadowSm
                  .make(),
            ),

          ],
        ),
      ),
    ));
  }
}
