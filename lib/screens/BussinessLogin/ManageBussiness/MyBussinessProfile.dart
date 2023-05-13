// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:spot_hub/configurations/AppColors.dart';
import 'package:spot_hub/configurations/BigText.dart';

class MyBussinessProfile extends StatelessWidget {
  const MyBussinessProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 30),
            height: 230,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/banner01.png"),
                    fit: BoxFit.cover)),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                
                radius: 40,
                
                backgroundColor:AppColors.PrimaryColor,
                foregroundImage:
                    AssetImage("assets/images/tabarak.jpg"),
              )
            ],
          )
        ],
      ),
      SizedBox(height: 10,),
      BigText(
        text: 'Bussiness Name',
        color: AppColors.PrimaryColor,
      ),
    ]);
  }
}
