import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:spot_hub/configurations/AppColors.dart';
import 'package:spot_hub/configurations/BigText.dart';
import 'package:spot_hub/configurations/Dimensions.dart';
import 'package:spot_hub/configurations/SmallText.dart';
import 'package:spot_hub/screens/UserLogin/SearchFrame/MainSearch.dart';
import 'package:spot_hub/screens/UserLogin/SearchFrame/widgets/SelectionStripe.dart';
import 'package:spot_hub/widgets/others/PrimayButton.dart';

class FilterView extends StatefulWidget {
  final bool isLoggedIn;
  double Star_Rating;
  int Category;
  int reviewCount;

  FilterView({
    super.key,
    required this.isLoggedIn,
    this.Star_Rating = 0,
    this.Category = 0,
    this.reviewCount = 0,

    //required int StarRating
  });

  @override
  State<FilterView> createState() => _FilterViewState();
}

class _FilterViewState extends State<FilterView> {
  List<String> StarRating = ["Any", "★ 3.0+", "★ 4.0+", "★ 5.0+"];
  List<String> reviewCount = ["N/A", "10+", "50+", "100+"];
  List<String> _categoriesCount = [
    "Any",
    "Desi",
    "Fast Food",
    "Sea Food",
    "Chineese"
  ];
  RangeValues _currentRangeValues = RangeValues(40, 80);
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.all(Dimensions.height20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                BigText(
                  text: "Filters",
                ),
                IconButton(
                    onPressed: (() => Navigator.pop(context)),
                    icon: const Icon(Icons.close))
              ],
            ),
            SizedBox(
              height: Dimensions.height5,
            ),
            SmallText(
                text:
                    "Filter items using the below parameters in terms of location, price, etc"),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                    onPressed: () {
                      setState(() {
                        widget.Star_Rating = 0;
                        widget.reviewCount = 0;
                        widget.Category = 0;
                      });

                      Navigator.pop(context);
                    },
                    child: SmallText(
                      text: "Clear all Filters",
                      color: Color.fromARGB(255, 3, 70, 186),
                    )),
              ],
            ),
            BigText(
              size: 15,
              //   color: AppColors.PrimaryColor,
              text: "Rating",
            ),
            Container(
              height: 60,
              child: SelectionStripe(
                selectedItem: widget.Star_Rating.toInt(),
                getValue: (value) {
                  widget.Star_Rating = double.parse(value.toString());
                  print("it's new ${value + 1}");
                },
                items: StarRating,
              ),
            ),
            BigText(
              size: 15,
              // color: AppColors.PrimaryColor,
              text: "No. of Reviews",
            ),
            Container(
              height: 60,
              child: SelectionStripe(
                selectedItem: widget.reviewCount,
                getValue: (value) {
                  widget.reviewCount = value;
                  print("it's new ${value + 1}");
                },
                items: reviewCount,
              ),
            ),
            BigText(
              size: 15,
              // color: AppColors.PrimaryColor,
              text: "Category",
            ),
            Container(
              height: 60,
              child: SelectionStripe(
                selectedItem: widget.Category,
                getValue: (value) {
                  widget.Category = value;
                  //   print("it's new ${value + 1}");
                },
                items: _categoriesCount,
              ),
            ),
            // BigText(
            //   size: 15,
            //   // color: AppColors.PrimaryColor,
            //   text: "Price",
            // ),
            // RangeSlider(
            //   values: _currentRangeValues,
            //   max: 100,
            //   divisions: 5,
            //   labels: RangeLabels(
            //     _currentRangeValues.start.round().toString(),
            //     _currentRangeValues.end.round().toString(),
            //   ),
            //   onChanged: (RangeValues values) {
            //     setState(() => {
            //           _currentRangeValues = values,
            //           print("chng$_currentRangeValues")
            //         });
            //   },
            // ),
            PrimaryButton(
                TapAction: () {
                  //  Navigator.pop(context);
                  print("${widget.Star_Rating}<= for checking");
                  Navigator.pop(context);

                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => MainSearch(
                                isLoggedIn: widget.isLoggedIn,
                                reviewCount: widget.reviewCount,
                                StarRating: widget.Star_Rating,
                                Category: widget.Category,
                              )));
                },
                text: 'Apply Filters',
                color: AppColors.PrimaryColor,
                icon: Icons.format_align_center)
          ],
        ),
      ),
    );
    ;
  }
}
