// ignore_for_file: non_constant_identifier_names, file_names

import 'package:flutter/material.dart';
import 'package:spot_hub/configurations/AppColors.dart';
import 'package:spot_hub/configurations/BigText.dart';
import 'package:spot_hub/configurations/Dimensions.dart';
import 'package:spot_hub/configurations/SmallText.dart';

class ReviewWidget extends StatelessWidget {
  //final imgurl;
  final String Name;
  final String TimeStamp;
  final String Review;
  final double stars;

  const ReviewWidget(
      {super.key,
      // required this.imgurl,
      required this.Name,
      required this.Review,
      required this.stars,
      required this.TimeStamp});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(Dimensions.height15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ListTile(
          //   leading: BigText(text: stars.toString()),
          //   trailing: Column(
          //     children: [
          //       Icon(Icons.star,
          //           size: Dimensions.font15, color: AppColors.PrimaryColor),
          //       SizedBox(
          //         height: Dimensions.width5,
          //       ),
          //       SmallText(
          //           text: stars.toString(),
          //           color: AppColors.PrimaryColor,
          //           size: Dimensions.font15),
          //     ],
          //   ),
          //   title: BigText(text: Name),
          //   subtitle: Column(
          //     children: [
          //       SmallText(
          //         iscentre: false,
          //         text: TimeStamp,
          //         size: 10,
          //       ),
          //       SizedBox(
          //         height: 5,
          //       ),
          //     ],
          //   ),
          // ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                BigText(text: Name),
                SmallText(text: TimeStamp),
              ]),
              Column(
                children: [
                  Row(
                    children: [
                      Icon(Icons.star,
                          size: Dimensions.font15,
                          color: AppColors.PrimaryColor),
                      SizedBox(
                        width: Dimensions.width5,
                      ),
                      SmallText(
                          text: stars.toString(),
                          color: AppColors.PrimaryColor,
                          size: Dimensions.font15),
                    ],
                  )
                ],
              )
            ],
          ),

          SizedBox(
            height: Dimensions.height10,
          ),
          SmallText(text: Review),
          SizedBox(
            height: Dimensions.height15,
          ),
          const Divider(
            height: 1,
            thickness: 1,
            //      indent:1,
            // endIndent: 0,
            color: Color.fromARGB(255, 221, 221, 221),
          ),
        ],
      ),
    );
  }
}
