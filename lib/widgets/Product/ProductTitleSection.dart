// ignore_for_file: file_names, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:spot_hub/configurations/BigText.dart';
import 'package:spot_hub/configurations/SmallText.dart';
import '../../configurations/AppColors.dart';
import '../../configurations/Dimensions.dart';

class ProductTitleSection extends StatelessWidget {
  final String text;
  final double Price;
  final int NoofReviews;
  final double OverallRating;
  final Function ClickedFavorite;

  final Icon favoriteIcon;

  const ProductTitleSection(
      {super.key,
      required this.text,
      required this.NoofReviews,
      required this.OverallRating,
      required this.Price,
      required this.ClickedFavorite,
      required this.favoriteIcon});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            BigText(text: text),
            AnimatedContainer(
              duration: Duration(seconds: 1),
              child: IconButton(
                  onPressed: () {
                    ClickedFavorite();
                  },
                  icon: favoriteIcon),
            ),
          ],
        ),
        SizedBox(height: Dimensions.height5),
        SmallText(
          text: '\$$Price',
          color: AppColors.PrimaryColor,
          size: Dimensions.font15,
        ),
        SizedBox(height: Dimensions.height5),
        Row(
          children: [
            Wrap(
              children: List.generate(
                  5,
                  //OverallRating.floor()
                 (index) => Icon(
                        Icons.star,
                        color: AppColors.PrimaryColor,
                        size: Dimensions.icon15,
                      )),
            ),
            SizedBox(
              width: Dimensions.height5,
            ),
            SmallText(text: OverallRating.toStringAsFixed(2)),
            const SizedBox(
              width: 5,
            ),
            SmallText(text: '( '),
            SmallText(text: NoofReviews.toString()),
            const SizedBox(
              width: 5,
            ),
            SmallText(text: 'Reviews )'),
          ],
        ),
        SizedBox(height: Dimensions.height5),
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          // IconAndTextWidget(
          //     icon: Icons.fastfood,
          //     IconColor: AppColors.yellowColor,
          //     text: 'Fast Food',
          //     color: Colors.grey),
          // IconAndTextWidget(
          //     icon: Icons.location_pin,
          //     IconColor: AppColors.mainColor,
          //     text: 'Gujranwala.',
          //     color: Colors.grey),
          // IconAndTextWidget(
          //     icon: Icons.punch_clock,
          //     IconColor: AppColors.iconColor2,
          //     text: '32 min',
          //     color: Colors.grey),
        ]),
      ],
    );
  }
}
