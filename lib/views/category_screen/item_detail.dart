import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smart/list.dart';
import 'package:smart/widgets_common/our_button.dart';
import 'package:velocity_x/velocity_x.dart';

class ItemDetails extends StatelessWidget {
  final String? title;

  const ItemDetails({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: title?.text
            .color(Color.fromRGBO(62, 68, 71, 1))
            .fontWeight(FontWeight.bold)
            .make(),
        shadowColor: Colors.transparent,
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.share,
                color: Color.fromRGBO(62, 68, 71, 1),
              )),
          IconButton(
              onPressed: () {},
              icon: Icon(Icons.favorite_outline,
                  color: Color.fromRGBO(62, 68, 71, 1))),
        ],
      ),
      body: Column(
        children: [
          Expanded(
              child: Container(
            padding: EdgeInsets.all(8),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  VxSwiper.builder(
                      autoPlay: true,
                      height: 350,
                      itemCount: 3,
                      aspectRatio: 16 / 9,
                      itemBuilder: ((context, index) {
                        return Image.asset(
                          imgFc5,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        );
                      })),
                  SizedBox(
                    height: 10,
                  ),
                  title
                      .toString()
                      .text
                      .color(Colors.black)
                      .size(16)
                      .fontWeight(FontWeight.bold)
                      .make(),
                  SizedBox(
                    height: 10,
                  ),
                  VxRating(
                    onRatingUpdate: (value) {},
                    normalColor: Color.fromRGBO(209, 209, 209, 1),
                    selectionColor: Color.fromRGBO(255, 168, 0, 1),
                    count: 5,
                    size: 25,
                    stepInt: true,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  "\$ 30,000"
                      .text
                      .color(Colors.red)
                      .fontWeight(FontWeight.bold)
                      .size(18)
                      .make(),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Expanded(
                          child: Column(
                        children: [
                          "Seller"
                              .text
                              .white
                              .fontWeight(FontWeight.bold)
                              .make(),
                          SizedBox(
                            height: 5,
                          ),
                          "In House Brands"
                              .text
                              .fontWeight(FontWeight.bold)
                              .color(Color.fromRGBO(62, 68, 71, 1))
                              .size(16)
                              .make()
                        ],
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                      )),
                      CircleAvatar(
                        backgroundColor: Colors.white,
                        child: Icon(
                          Icons.message_rounded,
                          color: Color.fromRGBO(62, 68, 71, 1),
                        ),
                      )
                    ],
                  )
                      .box
                      .height(60)
                      .padding(EdgeInsets.symmetric(horizontal: 16))
                      .color(Color.fromRGBO(209, 209, 209, 1))
                      .make(),
                  SizedBox(
                    height: 20,
                  ),
                  Column(
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            width: 100,
                            child: "Color:"
                                .text
                                .color(Color.fromRGBO(209, 209, 209, 1))
                                .make(),
                          ),
                          Row(
                            children: List.generate(
                                3,
                                (index) => VxBox()
                                    .size(40, 40)
                                    .roundedFull
                                    .color(Vx.randomPrimaryColor)
                                    .margin(EdgeInsets.symmetric(horizontal: 4))
                                    .make()),
                          )
                        ],
                      ).box.padding(EdgeInsets.all(8)).make(),

                      //quality row
                      Row(
                        children: [
                          SizedBox(
                            width: 100,
                            child: "Quantity:"
                                .text
                                .color(Color.fromRGBO(209, 209, 209, 1))
                                .make(),
                          ),
                          Row(
                            children: [
                              IconButton(
                                  onPressed: () {}, icon: Icon(Icons.remove)),
                              "0"
                                  .text
                                  .size(16)
                                  .color(Color.fromRGBO(62, 68, 71, 1))
                                  .fontWeight(FontWeight.bold)
                                  .make(),
                              IconButton(
                                  onPressed: () {}, icon: Icon(Icons.add)),
                              SizedBox(
                                width: 10,
                              ),
                              "(10 available)"
                                  .text
                                  .color(Color.fromRGBO(209, 209, 209, 1))
                                  .make()
                            ],
                          ),
                        ],
                      ).box.padding(EdgeInsets.all(8)).make(),

                      //total row
                      Row(
                        children: [
                          SizedBox(
                            width: 100,
                            child: "Total:"
                                .text
                                .color(Color.fromRGBO(209, 209, 209, 1))
                                .make(),
                          ),
                          "\$0.00"
                              .text
                              .color(Colors.red)
                              .size(16)
                              .fontWeight(FontWeight.bold)
                              .make(),
                        ],
                      ).box.padding(EdgeInsets.all(8)).make(),
                    ],
                  ).box.white.shadowSm.make(),


                  //description section
                  SizedBox(height: 10,),
                  "Description".text.color(Color.fromRGBO(62, 68, 71, 1)).fontWeight(FontWeight.bold).make(),
                  SizedBox(height: 10,),
                  "This is a dummy item and dummy description here..".text.color(Color.fromRGBO(62, 68, 71, 1)).make(),

                  ListView(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    children: List.generate(itemDetailButtonsList.length, (index) => ListTile(
                      title: "${itemDetailButtonsList[index]}".text.color(Color.fromRGBO(62, 68, 71, 1)).semiBold.make(),
                      trailing: Icon(Icons.arrow_forward),
                    )),
                  ),

                  //products may like section
                  SizedBox(height: 20,),
                  "Products you may also like".text.size(16).fontWeight(FontWeight.bold).make(),

                  SizedBox(height: 10,),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: List.generate(
                          6,
                              (index) => Column(
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
                              .padding(EdgeInsets.all(8))
                              .make()),
                    ),
                  )
                ],
              ),
            ),
          )),
          SizedBox(
            height: 60,
            width: double.infinity,
            child: ourButton(
                () {}, Colors.red.shade600, Colors.white, "Add to cart"),
          )
        ],
      ),
    );
  }
}
