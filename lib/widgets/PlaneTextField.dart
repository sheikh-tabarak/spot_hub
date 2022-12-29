// ignore_for_file: file_names, must_be_immutable

import 'package:flutter/material.dart';
import '../configurations/AppColors.dart';

class PlaneTextField extends StatelessWidget {
  final String placeholder;
  final IconData icon;
  TextEditingController controller = TextEditingController();
  PlaneTextField(
      {super.key,
      required this.placeholder,
      required this.controller,
      required this.icon});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: TextField(
        controller: controller,
        cursorColor: AppColors.PrimaryColor,
        decoration: InputDecoration(
          fillColor: Colors.white,
          prefixIcon: Icon(
            icon,
            color: AppColors.PrimaryColor,
          ),
          hintText: placeholder,
          contentPadding: const EdgeInsets.all(15),
          filled: true,
          hoverColor: AppColors.PrimaryColor,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 1, color: AppColors.PrimaryColor),
            borderRadius: BorderRadius.circular(30),
          ),
        ),
      ),
    );
  }
}
