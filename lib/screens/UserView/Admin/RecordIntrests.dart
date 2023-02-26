// ignore_for_file: non_constant_identifier_names, file_names

import 'package:flutter/material.dart';
import 'package:spot_hub/widgets/others/IconBox.dart';

class RecordIntrests extends StatefulWidget {
  const RecordIntrests({super.key});

  @override
  State<RecordIntrests> createState() => _RecordIntrestsState();
}

class _RecordIntrestsState extends State<RecordIntrests> {

  bool State=false;

  bool fastFood = false;
  bool Chineese = false;

  selectIt(){
    setState(() {
      State=true;   
    });

  }
 

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Row(
           mainAxisAlignment: MainAxisAlignment.center,
          children:  [

            IconBox(
        // isSelected:State ,
          mainIcon: Icons.food_bank,
          Text: 'Traditional', OnClickFuntion: () {  },
        ),
        IconBox(
        //  isSelected: Chineese,
          mainIcon: Icons.restaurant_menu,
          Text: 'Chineese', OnClickFuntion: () {  },
        ),
          ],
        ),

        Row(
           mainAxisAlignment: MainAxisAlignment.center,
       
          children:  [
            IconBox(
        // isSelected:State ,
          mainIcon: Icons.restaurant,
          Text: 'Desi Food', OnClickFuntion: () {  },
        ),
        IconBox(
        // isSelected:State ,
          mainIcon: Icons.fastfood,
          Text: 'Fast Food', OnClickFuntion: () {  },
        ),
        
          ],
        )
        
      ],
    ));
  }
}
