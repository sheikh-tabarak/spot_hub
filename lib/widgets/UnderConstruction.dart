// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:spot_hub/configurations/AppColors.dart';
import 'package:spot_hub/configurations/BigText.dart';
import 'package:spot_hub/configurations/Dimensions.dart';
import 'package:spot_hub/configurations/SmallText.dart';

class UnderConstruction extends StatelessWidget {
  final String message;
  const UnderConstruction({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(0, 0, 0, 0),
        body: Center(
          child: Container(
            padding: EdgeInsets.all(Dimensions.height15),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              color: Colors.white,
            ),
            margin: const EdgeInsets.all(20),
            height: 220,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.construction,
                  color: AppColors.PrimaryColor,
                  size: 50,
                ),
                SizedBox(
                  height: Dimensions.height10,
                ),
                BigText(text: "Under Development"),
                SizedBox(
                  height: Dimensions.height5,
                ),
                Text(
                  message,
                  textAlign: TextAlign.center,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: SmallText(
                          text: "I've Understand",
                          color: AppColors.PrimaryColor,
                        ))
                  ],
                )
              ],
            ),
          ),
        ));
  }
}
