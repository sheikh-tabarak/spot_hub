// ignore_for_file: non_constant_identifier_names, file_names

import 'package:flutter/material.dart';
import 'package:spot_hub/configurations/AppColors.dart';
import 'package:spot_hub/configurations/Dimensions.dart';
import 'package:spot_hub/configurations/SmallText.dart';

class PrimaryButton extends StatelessWidget {
  final Function TapAction;
  final String text;
  final Color color;
  final IconData icon;
  final double ButtonRadius;
  const PrimaryButton(
      {super.key,
      required this.TapAction,
      required this.text,
      required this.color, 
      required this.icon,
      this.ButtonRadius=10
      });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => TapAction(),
      child: Container(
        width: double.maxFinite,
    //    height:double.nan,

        alignment: Alignment.center,
        // padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(ButtonRadius),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: Colors.white,),
            SizedBox(width: Dimensions.height10,),
            SmallText(
              text: text,
              color: AppColors.textColor,
            ),
          ],
        ),
      ),
    );

  }
}
