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
  const PrimaryButton(
      {super.key,
      required this.TapAction,
      required this.text,
      required this.color, required this.icon});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => TapAction(),
      child: Container(
        width: double.maxFinite,
        alignment: Alignment.center,
        // padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(30),
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

    // ElevatedButton(

    //   style: ButtonStyle(
    //     minimumSize:  MaterialStateProperty.all(Size.fromHeight(50)),
    //     backgroundColor: MaterialStateProperty.all(AppColors.PrimaryColor),
    //     //: BorderRadius.circular(30)
    //   ),
    //   onPressed: null, child: Text('Login'));
  }
}
