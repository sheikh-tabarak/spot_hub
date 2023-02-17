// ignore_for_file: must_be_immutable, file_names

import 'package:flutter/material.dart';
class SmallText extends StatelessWidget {
  //const BigText({super.key});

  final Color? color;
  final String text;
  double size;
  FontWeight weight;
  double height;
  bool iscentre;

  SmallText(
      {Key? key,
      this.color= const Color.fromARGB(255, 104, 104, 104),
      required this.text,
      this.size = 12,
      this.weight=FontWeight.w400,
     // this.overFlow = TextOverflow.ellipsis, 
      this.height=1.2,
      this.iscentre=false,
      })
      : super(key: key);

  @override

  Widget build(BuildContext context) {
    return Text(text,
    textAlign: iscentre==true?TextAlign.center:TextAlign.left,
     //   overflow: overFlow,
        style: TextStyle( 
            fontFamily: 'Poppins',
      //    fontSize: Dimensions.font12,
          color: color,
          fontWeight: weight==FontWeight.w400?FontWeight.w400:weight,
          height: height,
        //  FontWeight:Weight,
        ));
  
  }
}
