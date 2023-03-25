import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:test/shahyan/card.dart';

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var TrailersMovie;
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 5, 5, 5),
     body: Center(
       child: ListView(
        scrollDirection: Axis.horizontal,
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        padding: EdgeInsets.symmetric(vertical: 10.0),
        children: [
        CardUI(image: "assets/images/0.png",images: "assets/images/00.png",
         text:"Dungeons & Dragons:Honor Among Thieves"),
          CardUI(image: "assets/images/1.png", images: "assets/images/00.png",text: "hi",),
          CardUI(image: "assets/images/2.png", images: "assets/images/00.png",text: "djf",),
          CardUI(image: "assets/images/3.png" ,images: "assets/images/00.png",text: "dhiw",),
       


          ]),),


    );
  }
}