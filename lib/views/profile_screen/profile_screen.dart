import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smart/list.dart';
import 'package:smart/views/profile_screen/components/detail_card.dart';
import 'package:smart/widgets_common/bg_widget.dart';
import 'package:velocity_x/velocity_x.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return bgWidget(
       Scaffold(
         body: SafeArea(
           child: Column(
             children: [
               //edit profile button
               const Align(alignment: Alignment.topRight,child: Icon(Icons.edit, color: Colors.white,)).onTap(() { }),
               Row(
                 children: [
                   Image.asset("assets/images/profile_image_joya_ahsan.jpg", width: 100,fit: BoxFit.cover,).box.roundedFull.clip(Clip.antiAlias).make(),
                   Expanded(child: Column(
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children: [
                       "Dummy User".text.fontWeight(FontWeight.bold).white.make(),
                       SizedBox(height: 5,),
                       "Customer@example.com".text.white.make(),
                     ],
                   )),
                   OutlinedButton(
                       style: OutlinedButton.styleFrom(
                         side: BorderSide(color: Colors.white)
                       ),
                       onPressed: (){},
                       child:"Log out".text.fontWeight(FontWeight.bold).white.make())
                 ],
               ),

               SizedBox(height: 20,),
               Row(
                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                 children: [
                   detailsCard(count: "00".toString(),title: "in your cart", width: context.screenWidth/3.4),
                   detailsCard(count: "00".toString(),title: "in your cart", width: context.screenWidth/3.4),
                   detailsCard(count: "00".toString(),title: "in your cart", width: context.screenWidth/3.4),
                 ],
               ),

               //button section
               ListView.separated(
                 shrinkWrap: true,
                   itemBuilder: (BuildContext context,index){
                     return ListTile(
                       leading: Image.asset(
                         profileButtonIcon[index],
                         width: 22,
                       ),
                       title: profileButtonList[index].text.color( Color.fromRGBO(62, 68, 71, 1)).fontWeight(FontWeight.bold).make(),
                     );
                   },
                   separatorBuilder: (context, index){
                     return const Divider(color: Color.fromRGBO(239, 239, 239, 1));
                   },
                   itemCount: profileButtonList.length)
                   .box.padding(EdgeInsets.symmetric(horizontal: 16))
                   .white
                   .rounded
                   .margin(EdgeInsets.all(12))
                   .shadowSm
                   .make()
                   .box
                   .color(Colors.red)
                   .make()
             ],
           ),
         ),
       )
    );
  }
}
