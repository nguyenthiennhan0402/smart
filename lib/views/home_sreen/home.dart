import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart/controller/home_controller.dart';
import 'package:smart/views/cart_screen/cart_screen.dart';
import 'package:smart/views/category_screen/category_screen.dart';
import 'package:smart/views/home_sreen/home_screen.dart';
import 'package:smart/views/profile_screen/profile_screen.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<Home> {



  @override
  Widget build(BuildContext context) {
    var controller  =  Get.put(HomeController());

    var navbarItem = [
      BottomNavigationBarItem(icon: Image.asset("assets/icons/home.png", width: 26), label: "Home"),
      BottomNavigationBarItem(icon: Image.asset("assets/icons/categories.png", width: 26), label: "Categories"),
      BottomNavigationBarItem(icon: Image.asset("assets/icons/cart.png", width: 26), label: "Cart"),
      BottomNavigationBarItem(icon: Image.asset("assets/icons/profile.png", width: 26), label: "Account"),
    ];

    var navBody = [
      HomeScreen(),
      CategoryScreen(),
      CartScreen(),
      ProfileScreen()
    ];
    return Scaffold(
      body:Column(
        children: <Widget>[Obx(() => Expanded(child: navBody.elementAt(controller.currentNavIndex.value)))],
      ),
      bottomNavigationBar: Obx(
        () =>  BottomNavigationBar(
          currentIndex: controller.currentNavIndex.value,
          selectedItemColor: Colors.red,
          selectedLabelStyle: TextStyle(fontWeight: FontWeight.w600),
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
          items:navbarItem,
          onTap: (value){
            controller.currentNavIndex.value = value;
      },
        ),
      ),
    );
  }
}
