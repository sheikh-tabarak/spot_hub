// ignore_for_file: file_names, must_be_immutable

import 'package:flutter/material.dart';
import 'package:spot_hub/configurations/AppColors.dart';

class BoxedTextField extends StatelessWidget {
  final String placeholder;
  final IconData icon;
  final TextEditingController controller;
  final Function TapAction;
  //final bool isRequired;
  bool isEmpty = false;
  int maxLines;
  ///final Function onChange;
  int multiline = 0;
  //TextEditingController controller = TextEditingController();
  BoxedTextField({
    super.key,
    required this.placeholder,
    required this.icon,
    required this.controller,
    required this.TapAction,
    this.maxLines=1
   // required this.isRequired,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.all(1),
        padding: const EdgeInsets.all(1),
        child: TextField(
          controller: controller,
          keyboardType: TextInputType.multiline,
          maxLines: maxLines,
          cursorColor: AppColors.PrimaryColor,
          onChanged: (value) => TapAction(value),
          decoration: InputDecoration(
              border: const OutlineInputBorder(),
              hintText: placeholder,
              prefixIcon: Icon(icon),
              fillColor: AppColors.lightBackgroundColor,
              prefixIconColor: AppColors.PrimaryColor,
              filled: true,
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                    width: 1, color: Color.fromARGB(255, 200, 200, 200)),
                borderRadius: BorderRadius.circular(5),
              ),
              //   hoverColor: AppColors.PrimaryColor,
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 1, color: AppColors.PrimaryColor),
                borderRadius: BorderRadius.circular(05),
              ),
              focusColor: AppColors.PrimaryColor),
        ));
  }
}
