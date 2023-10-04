import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:smart/views/category_screen/item_detail.dart';
import 'package:smart/widgets_common/bg_widget.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../list.dart';

class CategoryDetail extends StatelessWidget {
  final String? title;

  const CategoryDetail({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return bgWidget(Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        title: title!.text.fontWeight(FontWeight.bold).white.make(),
      ),
      body: Container(
        padding: EdgeInsets.all(12),
        child: Column(
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              physics: BouncingScrollPhysics(),
              child: Row(
                children: List.generate(
                    6,
                    (index) => "Baby Clothing"
                        .text
                        .size(12)
                        .fontWeight(FontWeight.bold)
                        .color(Colors.black)
                        .makeCentered()
                        .box
                        .white
                        .rounded
                        .size(150, 60)
                        .margin(EdgeInsets.symmetric(horizontal: 4))
                        .make()),
              ),
            ),

            //items container
            SizedBox(height: 20,),
            Expanded(child: GridView.builder(
              physics: BouncingScrollPhysics(),
              shrinkWrap: true,
                itemCount: 6,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisExtent: 250,
                    mainAxisSpacing: 8,
                    crossAxisSpacing: 8),
                itemBuilder: (context, index){
              return Column(
                crossAxisAlignment:
                CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    imgP1,
                    width: 150,
                    fit: BoxFit.cover,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Laptop 4GB",
                    style: TextStyle(
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    "\$600",
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.red,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              )
                  .box
                  .white
                  .margin(EdgeInsets.symmetric(
                  horizontal: 4))
                  .roundedSM
                  .shadowSm
                  .padding(EdgeInsets.all(8))
                  .make().onTap(() {
                    Get.to(()=>ItemDetails(title:"Dymmy Items",));
              });
            }))
          ],
        ),
      ),
    ));
  }
}
