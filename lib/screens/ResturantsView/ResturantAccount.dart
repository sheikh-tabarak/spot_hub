// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:spot_hub/configurations/BigText.dart';

class ResturantAccount extends StatelessWidget {
  const ResturantAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: BigText(text: 'This is Resturant Account',color: Colors.white,),
    );
  }
}