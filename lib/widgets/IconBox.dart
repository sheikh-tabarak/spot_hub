// ignore_for_file: non_constant_identifier_names, file_names

import 'package:flutter/material.dart';

import 'package:spot_hub/configurations/AppColors.dart';
import 'package:spot_hub/configurations/SmallText.dart';

class IconBox extends StatefulWidget {
  final IconData mainIcon;
  final String Text;
  final Function OnClickFuntion;
   bool isSelected;

   IconBox({
    Key? key,
    required this.mainIcon,
    required this.Text,
    required this.OnClickFuntion,
    this.isSelected=false,
  }) : super(key: key);

  @override
  State<IconBox> createState() => _IconBoxState();
}

class _IconBoxState extends State<IconBox> {
  //bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => { 
         widget.OnClickFuntion(),
        setState(() {
          if (widget.isSelected == true) {
            widget.isSelected = false;
          } else {
            widget.isSelected = true;
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
                  widget.isSelected == false ? Colors.white : AppColors.PrimaryColor,
              borderRadius: BorderRadius.circular(10)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                widget.mainIcon,
                color:
                    widget.isSelected == false ? AppColors.PrimaryColor : Colors.white,
              ),
              const SizedBox(
                height: 10,
              ),
              SmallText(
                text: widget.Text,
                color:
                    widget.isSelected == false ? AppColors.PrimaryColor : Colors.white,
              )
            ],
          )),
    );
  }
}
