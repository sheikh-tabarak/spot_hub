// ignore_for_file: non_constant_identifier_names, file_names

import 'package:flutter/material.dart';
import 'package:spot_hub/configurations/AppColors.dart';
import 'package:spot_hub/configurations/BigText.dart';
import 'package:spot_hub/configurations/Dimensions.dart';
import 'package:spot_hub/configurations/SmallText.dart';
import 'package:spot_hub/widgets/product_widgets/DataBar.dart';
import 'package:spot_hub/widgets/product_widgets/StarsCard.dart';

class ProductTitleSection extends StatefulWidget {
  final String text;
  final double Price;
  final String City;
  final int NoofReviews;
  final double OverallRating;
  final Function ClickedFavorite;

  final Icon favoriteIcon;

  const ProductTitleSection(
      {super.key,
      required this.text,
      required this.City,
      required this.NoofReviews,
      required this.OverallRating,
      required this.Price,
      required this.ClickedFavorite,
      required this.favoriteIcon});

  @override
  State<ProductTitleSection> createState() => _ProductTitleSectionState();
}

class _ProductTitleSectionState extends State<ProductTitleSection> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            BigText(text: widget.text),
            AnimatedContainer(
              duration: Duration(seconds: 1),
              child: IconButton(
                  onPressed: () {
                    widget.ClickedFavorite();
                  },
                  icon: widget.favoriteIcon),
            ),
          ],
        ),
        // SizedBox(height: Dimensions.height5),

        SizedBox(height: Dimensions.height5),
        Row(
          children: [
            SmallText(
              text: '\$${widget.Price}',
              color: AppColors.PrimaryColor,
              size: Dimensions.font15,
            ),
            // const SizedBox(width: 5,),
            SmallText(text: "  •  "),
            //  const SizedBox(width: 5,),
            Icon(
              Icons.pin_drop,
              color: AppColors.PrimaryColor,
              size: 15,
            ),
            SizedBox(
              width: Dimensions.width5,
            ),
            SmallText(text: widget.City)
          ],
        ),
        SizedBox(
          height: Dimensions.height10,
        ),
        Row(
          children: [
            SmallText(text: "${widget.OverallRating.toString()} Stars "),
            Wrap(
              children: List.generate(
                  1,
                  //OverallRating.floor()
                  (index) => Icon(
                        Icons.star,
                        color: AppColors.PrimaryColor,
                        size: 17,
                      )),
            ),
            SizedBox(
              width: Dimensions.height5,
            ),
            //  SmallText(text: widget.OverallRating.toString()),
            const SizedBox(
              width: 5,
            ),
            //  SmallText(text: ' Stars '),
            SmallText(text: "(${widget.NoofReviews} Reviews)"),
          ],
        ),
      ],
    );
  }
}
