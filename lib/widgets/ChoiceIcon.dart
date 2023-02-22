import 'package:flutter/material.dart';

class ChoiceIcon extends StatelessWidget {
  final ImageProvider iconImage;
  final String icontitle;
  

  ChoiceIcon({
    Key? key,
    required this.iconImage,
    required this.icontitle,
    
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      
      child: Column(
        children:  [
          Image(
            image:iconImage,
            width: 30,
            height: 30,
          ),
          Text(icontitle)
        ],
      ),
    );
  }
}
