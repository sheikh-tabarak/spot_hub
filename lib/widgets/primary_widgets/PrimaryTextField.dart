import 'package:flutter/material.dart';
import 'package:spot_hub/configurations/AppColors.dart';

class PrimaryTextField extends StatelessWidget {
  const PrimaryTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TextField(
        autofocus: false,
        decoration: InputDecoration(
          hintText: 'youremail@email.com',
          prefixIcon: Container(
              padding: const EdgeInsets.all(12), child: const Icon(Icons.email)
              //SvgPicture.asset('assets/icons/Message.svg', color: AppColors.PrimaryColor),
              ),
          contentPadding:
              const EdgeInsets.symmetric(vertical: 10, horizontal: 14),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.PrimaryColor, width: 1),
            borderRadius: BorderRadius.circular(8),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.PrimaryColor, width: 1),
            borderRadius: BorderRadius.circular(8),
          ),
          fillColor: AppColors.PrimaryColor,
          filled: true,
        ),
      ),
    );
  }
}
