import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart/consts/firebase_consts.dart';
import 'package:smart/controller/auth_controller.dart';
import 'package:smart/list.dart';
import 'package:smart/views/home_sreen/home.dart';
import 'package:smart/widgets_common/applogo_widget.dart';
import 'package:smart/widgets_common/bg_widget.dart';
import 'package:smart/widgets_common/our_button.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../widgets_common/custom_textField.dart';

class SignUp extends StatefulWidget {
  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool? ischeck = false;
  TextEditingController txtcontroller = TextEditingController();
  var controller = Get.put(AuthController());
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var passwordRetypeController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return bgWidget(Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: SingleChildScrollView(child: Column(
          children: [
            SizedBox(height: 15,),
            applogoWidget(),
            SizedBox(height: 10),
            Text(
              "Sign Up to SMart",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18),
            ),
            SizedBox(height: 5),
            Column(
              children: <Widget>[
                customTextField("Name", "John", nameController,false),
                SizedBox(height: 5),
                customTextField("Email", "abc@gmail.com", emailController,false),
                SizedBox(height: 5),
                customTextField("Password", "*****", passwordController,true),
                SizedBox(height: 5),
                customTextField("Retype Password", "*****", passwordRetypeController,true),
                Align(
                  child: TextButton(
                      onPressed: () {}, child: Text("Forget Password")),
                  alignment: Alignment.centerRight,
                ),
                Row(
                  children: [
                    Checkbox(checkColor: Colors.red,value: ischeck, onChanged: (newValue){
                      setState(() {
                        ischeck = newValue;
                      });
                    }),
                    Expanded(
                      child: RichText(text: TextSpan(
                          children: [
                            TextSpan(text: "I agree to the ", style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.bold
                            )),
                            TextSpan(text: "Privacy Policy", style: TextStyle(
                                color: Colors.red,
                                fontWeight: FontWeight.bold
                            )),
                            TextSpan(text: " &", style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.bold
                            )),
                            TextSpan(text: "Terms and Conditions", style: TextStyle(
                                color: Colors.red,
                                fontWeight: FontWeight.bold
                            )),
                          ]
                      )
                      ),
                    )
                  ],
                ),
                ourButton(()  async {
                  if(ischeck != false){
                    try{
                        await controller.signupMethod(context: context,email: emailController.text,password: passwordController.text).then((value){
                          return controller.storeUserData(
                            email: emailController.text,
                            password: passwordController.text,
                            name: nameController.text
                          );
                        }).then((value){
                          VxToast.show(context, msg: "Logged in successfull");
                          Get.offAll(()=>Home());
                        });
                    }catch(e){
                        auth.signOut();
                        VxToast.show(context, msg: e.toString());
                    }
                  }
                },ischeck == true? Color.fromRGBO(230, 46, 4, 1) : Colors.grey,Colors.white,"Sign up").box.width(context.screenWidth - 50).make(),
                SizedBox(height: 5,),
                RichText(text: const TextSpan(
                  children: [
                    TextSpan(
                        text: "Already have an account?",
                        style: TextStyle(fontWeight: FontWeight.w500,
                            color: Colors.grey, fontSize: 13)
                    ),
                    TextSpan(
                        text: " Login",
                        style: TextStyle(fontWeight: FontWeight.bold,
                            color: Colors.red, fontSize: 13)
                    ),
                  ]
                )
                ).onTap(() {Get.back();})
              ],
            )
                .box
                .white
                .rounded
                .padding(EdgeInsets.all(16))
                .width(context.screenWidth - 70)
                .shadowSm
                .make(),
          ],
        )),
      ),
    ));
  }
}
