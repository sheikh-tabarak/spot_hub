// ignore_for_file: non_constant_identifier_names, file_names

import 'package:flutter/material.dart';
import 'package:spot_hub/configurations/AppColors.dart';
import 'package:spot_hub/configurations/SmallText.dart';

class IconBox extends StatefulWidget {
  final IconData mainIcon;
  final String Text;
  const IconBox({
    super.key,
    required this.mainIcon,
    required this.Text,
  });

  @override
  State<IconBox> createState() => _IconBoxState();
}

class _IconBoxState extends State<IconBox> {
  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => {
        setState(() {
          if (isSelected == true) {
            isSelected = false;
          } else {
            isSelected = true;
          }
        })
      },
      child: Container(
          alignment: Alignment.center,
          height: 120,
          width: 120,
          padding: const EdgeInsets.all(10),
          margin: const EdgeInsets.all(10),
          decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 3,
                  blurRadius: 4,
                  offset: const Offset(0, 0), // changes position of shadow
                ),
              ],
             
              color:
                  isSelected == false ? Colors.white : AppColors.PrimaryColor,
              borderRadius: BorderRadius.circular(10)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                widget.mainIcon,
                color:
                    isSelected == false ? AppColors.PrimaryColor : Colors.white,
              ),
              const SizedBox(
                height: 10,
              ),
              SmallText(
                text: widget.Text,
                color:
                    isSelected == false ? AppColors.PrimaryColor : Colors.white,
              )
            ],
          )),
    );
  }
}
