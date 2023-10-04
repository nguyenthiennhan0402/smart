import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:smart/consts/firebase_consts.dart';
import 'package:velocity_x/velocity_x.dart';

class AuthController extends GetxController{
  var isloading = false.obs;

  //textcontroller
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  //login method
  Future<UserCredential?>loginMethod({email, password, context}) async{
      UserCredential? userCredential;
      try{
        userCredential = await auth.signInWithEmailAndPassword(email: emailController.text, password: passwordController.text);
      } on FirebaseAuthException catch (e){
        VxToast.show(context, msg: e.toString());
      }
      return userCredential;
  }
  //signup method
  Future<UserCredential?>signupMethod({email, password, context}) async{
    UserCredential? userCredential;
    try{
      userCredential = await auth.createUserWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e){
      VxToast.show(context, msg: e.toString());
    }
    return userCredential;
  }

  //storing data method
  storeUserData({name, password, email}) async {
    DocumentReference store = firestore.collection(usersCollection).doc(currentUsr?.uid);
    store.set(
      {
        'name' : name,
        'password': password,
        'email': email,
        'imageUrl':'',
        'id':currentUsr!.uid
      }
    );
  }

  //signout method
  signoutMethod(context) async{
    try{
      await auth.signOut();
    }catch(e){
      VxToast.show(context, msg: e.toString());
    }
  }

}