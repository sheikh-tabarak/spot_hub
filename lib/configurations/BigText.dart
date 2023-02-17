// ignore_for_file: must_be_immutable, file_names

import 'package:flutter/material.dart';

import 'Dimensions.dart';

class BigText extends StatelessWidget {
  //const BigText({super.key});

  final Color? color;
  final String text;
  double size;
 // TextOverflow overFlow;
  bool isCentre;

  BigText(
      {Key? key,
      this.color= const Color.fromARGB(255, 0, 0, 0),
      required this.text,
      this.size=0,
     // this.overFlow = TextOverflow.ellipsis,
      this.isCentre=false,
      })
      : super(key: key);

  @override

  Widget build(BuildContext context) {
    return Text(text,
    textAlign: TextAlign.left,

       // overflow: overFlow,
        style: TextStyle(
            fontFamily: 'Poppins',
          fontSize: size==0?Dimensions.font20:size,
          color: color,
          fontWeight: FontWeight.w500,
        ));
  }
}
