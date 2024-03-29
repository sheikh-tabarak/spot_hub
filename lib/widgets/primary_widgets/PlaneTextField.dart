// ignore_for_file: file_names, must_be_immutable

import 'package:flutter/material.dart';
import 'package:spot_hub/configurations/AppColors.dart';

class PlaneTextField extends StatelessWidget {
  bool isEnabled;
  bool isPassword;
  final String placeholder;
  final IconData icon;
  final Function onChange;
  TextEditingController controller = TextEditingController();
  PlaneTextField({
    super.key,
    this.isEnabled = true,
    this.isPassword = false,
    required this.placeholder,
    required this.controller,
    required this.icon,
    required this.onChange,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: TextField(
        enabled: isEnabled == true ? true : false,
        obscureText: isPassword == true ? true : false,
        controller: controller,
        onChanged: (value) => onChange(value),
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
            borderRadius: BorderRadius.circular(7),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 1, color: AppColors.PrimaryColor),
            borderRadius: BorderRadius.circular(7),
          ),
        ),
      ),
    );
  }
}
