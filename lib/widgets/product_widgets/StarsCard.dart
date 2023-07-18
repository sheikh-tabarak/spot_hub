import 'package:flutter/material.dart';
import 'package:spot_hub/configurations/AppColors.dart';
import 'package:spot_hub/configurations/BigText.dart';
import 'package:spot_hub/configurations/Dimensions.dart';
import 'package:spot_hub/configurations/SmallText.dart';
import 'package:spot_hub/models/BusinessModels/Product.dart';

class StarsCard extends StatefulWidget {
  final double totalrating;
  final int count;

  StarsCard({super.key, required this.totalrating, required this.count});

  @override
  State<StarsCard> createState() => _StarsCardState();
}

class _StarsCardState extends State<StarsCard> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 20, left: 20),
      padding: const EdgeInsets.all(20),
      decoration: const BoxDecoration(
          color: Color.fromARGB(255, 230, 228, 224),
          borderRadius: BorderRadius.all(Radius.circular(10))),
      alignment: Alignment.center,
      child: Column(
        // crossAxisAlignment: CrossAxisAlignment.center,
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BigText(
            text: widget.totalrating.toString(),
            color: AppColors.PrimaryColor,
            size: 40,
          ),
          Stack(
            children: [
              Wrap(
                children: List.generate(
                    5,
                    //OverallRating.floor()
                    (index) => const Icon(
                          Icons.star,
                          color: Color.fromARGB(255, 255, 214, 151),
                          size: 20,
                        )),
              ),
              Wrap(
                children: List.generate(
                    widget.totalrating.ceil(),
                    //OverallRating.floor()
                    (index) => Icon(
                          Icons.star,
                          color: AppColors.PrimaryColor,
                          size: 20,
                        )),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          SmallText(
            text: "${widget.count} Total Reviews",
          )
        ],
      ),
    );
  }
}
