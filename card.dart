import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class CardUI extends StatelessWidget {
  final String image;
  final String images;
  final String text;
  
  const CardUI({super.key,required this.image,required this.text,required this.images});

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      
      Container(child: SizedBox(width:410,height:200,child: Image(image: AssetImage(image)))),
      Positioned(bottom: 320, child: Container(width: 420,height: 100,color: Color.fromARGB(255, 22, 20, 20)),),
      Positioned(bottom: 340,right:10 ,child: Icon(Icons.arrow_forward_ios),),
      Positioned(bottom:390,left: 100,child: Text(text,
      style: TextStyle(color: Colors.white))),
      Positioned(bottom:340,left: 10,child:  Text("Browse trailers and videos" ,
      style:  TextStyle(fontSize: 15,fontWeight: FontWeight.w600,color: Colors.white),),),
      Positioned(bottom:370,child:SizedBox(width:100,height:130,child: Image(image: AssetImage(images))) )
     ,Positioned(bottom: 280,left: 10,child: Text("Featured today",
      style: TextStyle(color: Colors.yellow,fontSize: 24),),),
  
    ],
    
  

    );
  }
}