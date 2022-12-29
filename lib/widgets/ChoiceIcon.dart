import 'package:flutter/material.dart';

class ChoiceIcon extends StatelessWidget {
  final ImageProvider iconImage;
  final String icontitle;

  ChoiceIcon({super.key, required this.iconImage, required this.icontitle});

  @override
  Widget build(BuildContext context) {
    return Column(
      children:  [
        Image(
          image:iconImage,
          width: 30,
          height: 30,
        ),
        Text(icontitle)
      ],
    );
  }
}
