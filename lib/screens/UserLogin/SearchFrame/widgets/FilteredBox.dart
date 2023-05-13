import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:spot_hub/configurations/AppColors.dart';
import 'package:spot_hub/configurations/SmallText.dart';

class FilteredBox extends StatelessWidget {
  final String text;
  final Function onCancel;
   FilteredBox({super.key, required this.text, required this.onCancel});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10, left: 10, bottom: 10),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: AppColors.PrimaryColor),
      child: Wrap(
        alignment: WrapAlignment.center,
        crossAxisAlignment: WrapCrossAlignment.center,
        children: [
          // Column(
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   children: [

          SmallText(
            text: text,
            color: Colors.white,
          ),
          //   ],
          //  ),
          SizedBox(
            width: 10,
          ),
          GestureDetector(
            onTap: ()=>onCancel("value"),
            child: Icon(
              Icons.cancel,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
