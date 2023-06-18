// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:spot_hub/configurations/AppColors.dart';
import 'package:spot_hub/configurations/BigText.dart';
import 'package:spot_hub/models/BusinessModels/Bussiness.dart';

class MyBussinessProfile extends StatelessWidget {
  final Bussiness CurrentB;
  const MyBussinessProfile({super.key, required this.CurrentB});

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
                backgroundColor: Colors.white,
                foregroundImage: NetworkImage(CurrentB.BussinessImageUrl),
              )
            ],
          )
        ],
      ),
      SizedBox(
        height: 10,
      ),
      BigText(
        text: CurrentB.BussinessName,
        color: AppColors.PrimaryColor,
      ),
    ]);
  }
}
