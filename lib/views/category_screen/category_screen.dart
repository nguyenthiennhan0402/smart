import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:smart/list.dart';
import 'package:smart/views/category_screen/category_detail.dart';
import 'package:smart/widgets_common/bg_widget.dart';
import 'package:velocity_x/velocity_x.dart';
const categories = "Categories";
class CategoryScreen extends StatefulWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  @override
  Widget build(BuildContext context) {
    return bgWidget(
      Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          title: categories.text.white.fontFamily("sans_bold").make()
        ),
        body: Container(
          padding: EdgeInsets.all(12),
          child: GridView.builder(
            shrinkWrap: true,
              itemCount: 9,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3, mainAxisSpacing: 8,crossAxisSpacing: 8,mainAxisExtent: 200),
              itemBuilder: (context, index)  {
            return Column(
              children: [
                Image.asset(categoryImages[index],height: 120, width: 200, fit: BoxFit.cover),
                SizedBox(height: 10,),
                categoriesList[index].text.color(Color.fromRGBO(62, 68, 71, 1)).align(TextAlign.center).make(),
              ],
            ).box.white.rounded.clip(Clip.antiAlias).outerShadowSm.make().onTap(() { 
              Get.to(()=>CategoryDetail(title: categoriesList[index]));
            });
          }),
        ),
      ),
    );
  }
}
