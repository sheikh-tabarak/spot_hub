import 'package:flutter/material.dart';
import 'package:spot_hub/configurations/AppColors.dart';
import 'package:spot_hub/configurations/BigText.dart';
import 'package:spot_hub/configurations/Dimensions.dart';

class RatingSlider extends StatefulWidget {
  final String title;
  final Function RecordRating;
  double selectedStars = 3;
  int count = 0;

  List<String> messages = ["Not Good", "Average", "OK", "Good", "Great"];

  RatingSlider(
      {super.key,
      required this.title,
      required this.RecordRating(double selectedStars)});

  @override
  State<RatingSlider> createState() => _RatingSliderState();
}

class _RatingSliderState extends State<RatingSlider> {
  @override
  Widget build(BuildContext context) {
    return Column(
      //  crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          height: Dimensions.height10,
        ),
        Row(
          children: [
            BigText(
              text: widget.title,
              size: 20,
              color: AppColors.PrimaryColor,
            ),
            Text(" ( ${widget.messages[widget.selectedStars.toInt()]} )"),
          ],
        ),
        SizedBox(
          height: Dimensions.height10,
        ),
        Container(
          //      alignment: Alignment.center,
          height: 55,
          child: Stack(children: [
            ListView.builder(
                itemCount: 5,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemBuilder: ((context, index) => GestureDetector(
                      onTap: () => {
                        setState(
                          () => {
                            widget.selectedStars = index.toDouble(),
                            widget.RecordRating(widget.selectedStars + 1),
                          },
                        )
                      },
                      child: Container(
                        width: 50,
                        height: 50,
                        padding: const EdgeInsets.all(5),
                        margin: const EdgeInsets.all(5),
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                          color: Colors.grey,
                        ),
                        child: (const Icon(
                          Icons.star,
                          color: Colors.white,
                        )),
                      ),
                    ))),
            ListView.builder(
                //     dragStartBehavior: DragStartBehavior.start,
                itemCount: widget.selectedStars.toInt() + 1,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemBuilder: ((context, index) => InkWell(
                      onTap: () => {
                        setState(
                          () => {
                            widget.selectedStars = index.toDouble(),
                            widget.RecordRating(widget.selectedStars + 1),
                          },
                        )
                      },
                      child: Container(
                        width: 50,
                        height: 50,
                        padding: const EdgeInsets.all(5),
                        margin: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            borderRadius: const BorderRadius.all(
                              Radius.circular(10),
                            ),
                            color: widget.selectedStars == 0
                                ? const Color.fromARGB(255, 255, 230, 0)
                                : widget.selectedStars == 1
                                    ? const Color.fromARGB(237, 255, 205, 4)
                                    : widget.selectedStars == 2
                                        ? const Color.fromARGB(255, 231, 173, 0)
                                        : widget.selectedStars == 3
                                            ? const Color.fromARGB(
                                                255, 252, 111, 17)
                                            : widget.selectedStars == 4
                                                ? const Color.fromARGB(
                                                    255, 254, 0, 0)
                                                : AppColors.PrimaryColor),
                        child: (const Icon(
                          Icons.star,
                          color: Colors.white,
                        )),
                      ),
                    ))),
          ]),

          //
        ),

        // Text(widget.messages[widget.selectedStars.toInt()])
      ],
    );
  }
}
