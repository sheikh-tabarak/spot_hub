// ignore_for_file: file_names, non_constant_identifier_names, unnecessary_new

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spot_hub/configurations/AppColors.dart';
import 'package:spot_hub/configurations/BigText.dart';
import 'package:spot_hub/configurations/Dimensions.dart';
import 'package:spot_hub/configurations/SmallText.dart';
import 'package:spot_hub/models/BusinessModels/Product.dart';
import 'package:spot_hub/models/Global/ProductsData.dart';
import 'package:spot_hub/screens/Loading.dart';
import 'package:spot_hub/screens/UserLogin/SearchFrame/SearchPage.dart';
import 'package:spot_hub/screens/UserLogin/User/ScrollableProductDetailPage.dart';
import 'package:spot_hub/widgets/others/PrimayButton.dart';
import 'package:spot_hub/widgets/others/RatingSlider.dart';
import 'package:spot_hub/widgets/others/UnderConstruction.dart';

class AddReview extends StatefulWidget {
  final Product ProductToReview;
  bool isSelected;
  AddReview({super.key, required this.ProductToReview, this.isSelected = true});

  @override
  State<AddReview> createState() => _AddReviewState();
}

class _AddReviewState extends State<AddReview> {
  double _TasteStars = 0;
  double _ServingStars = 0;
  double _PresentationStars = 0;
  bool isLoading = false;
  double _TotalStarts = 0;

  //List<String> products = [];

  // late String SelectedProduct;
  //= products[1];

  @override
  void initState() {
    super.initState();

    // products.clear();

    // for (var i = 0; i < DummyProducts.length; i++) {
    //   products.add(DummyProducts[i].title);
    // }
    // SelectedProduct = products[1];
  }

  TextEditingController reviewController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return isLoading == true
        ? Loading(message: "Publishing your review")
        : Scaffold(
            appBar: AppBar(
                backgroundColor: AppColors.PrimaryColor,
                title: BigText(
                  text: "Post Review",
                  color: Colors.white,
                )),
            body: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () => {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SearchPage(
                                    searchTitle: "",
                                    isSelection: true,
                                  )))
                    },
                    child: Container(
                        // padding: const EdgeInsets.only(
                        //     left: 20, right: 20, bottom: 10, top: 10),
                        // margin: const EdgeInsets.all(20),
                        margin:
                            const EdgeInsets.only(top: 20, left: 20, right: 20),
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          border: Border.all(
                              width: 1,
                              color: const Color.fromARGB(255, 213, 213, 213)),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(5)),
                        ),
                        child: widget.isSelected == false
                            ? Container(
                                height: 30,
                                alignment: Alignment.center,
                                child: SmallText(
                                  text: "Select the product to review",
                                  color: AppColors.PrimaryColor,
                                ),
                              )
                            : ListTile(
                                leading: Container(
                                  width: 50,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        width: 1,
                                        color: const Color.fromARGB(
                                            255, 213, 213, 213)),
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(50)),
                                    image: DecorationImage(
                                        image: NetworkImage(
                                            widget.ProductToReview.image),
                                        fit: BoxFit.cover),
                                  ),
                                ),
                                title: Padding(
                                  padding: const EdgeInsets.only(bottom: 3),
                                  child: SmallText(
                                      size: 14,
                                      color: Colors.black,
                                      text: widget.ProductToReview.title),
                                ),
                                subtitle: Row(
                                  children: [
                                    Stack(
                                      children: [
                                        Wrap(
                                          children: List.generate(
                                              1,
                                              //OverallRating.floor()
                                              (index) => Icon(
                                                    Icons.star,
                                                    color:
                                                        AppColors.PrimaryColor,
                                                    size: 20,
                                                  )),
                                        ),
                                        // Wrap(
                                        //   children: List.generate(
                                        //       widget.ProductToReview.rating.floor(),
                                        //       (index) => Icon(
                                        //             Icons.star,
                                        //             color: AppColors.PrimaryColor,
                                        //             size: 20,
                                        //           )),
                                        // ),
                                      ],
                                    ),
                                    SizedBox(
                                      width: Dimensions.height10,
                                    ),
                                    SmallText(
                                        text: widget.ProductToReview.rating
                                            .toString()),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    SmallText(text: '| '),
                                    SmallText(
                                        text: widget.ProductToReview.reviews
                                            .toString()),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    SmallText(text: 'Reviews'),
                                  ],
                                ),
                                // SmallText(
                                //     size: 11,
                                //     color: const Color.fromARGB(255, 163, 163, 163),
                                //     text: widget.ProductToReview.description),
                                trailing: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SmallText(
                                      text: widget.ProductToReview.Price
                                          .toString(),
                                      color: AppColors.PrimaryColor,
                                      weight: FontWeight.w800,
                                    ),
                                  ],
                                ),
                              )),
                  ),
                  Container(
                    padding: const EdgeInsets.only(
                        left: 20, right: 20, bottom: 10, top: 10),
                    margin: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                        border: Border.all(
                            width: 1,
                            color: const Color.fromARGB(255, 213, 213, 213))),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            BigText(
                              text: "Write a review",
                              color: AppColors.PrimaryColor,
                            ),
                          ],
                        ),
                        TextField(
                          controller: reviewController,
                          keyboardType: TextInputType.multiline,
                          minLines: 1,
                          maxLines: 6,
                          cursorColor: AppColors.PrimaryColor,
                          onChanged: (value) => {},
                          decoration: const InputDecoration(
                            hintStyle: TextStyle(
                                fontFamily: 'Poppins',
                                color: Color.fromARGB(255, 180, 180, 180)),
                            hintText:
                                "Doesn’t look like much when you walk past, but I was practically dying of hunger so I popped in. The definition of a hole-in-the-wall. I got the regular hamburger and wow…  there are no words. A classic burger done right. Crisp bun, juicy patty, stuffed with all the essentials (ketchup, shredded lettuce, tomato, and pickles). There’s about a million options available between the menu board and wall full of specials, so it can get a little overwhelming, but you really can’t go wrong. Not much else to say besides go see for yourself! You won’t be disappointed.",
                          ),
                        ),
                        RatingSlider(
                          selectedStars: _TasteStars,
                          RecordRating: (selectedStars) {
                            _TasteStars = selectedStars;
                            setState(() {
                              _TotalStarts = ((_PresentationStars + 1) +
                                      (_ServingStars + 1) +
                                      (_TasteStars + 1)) /
                                  3;
                            });

                            //  print("Rating 1: $selectedStars");
                          },
                          title: "Taste:",
                        ),
                        RatingSlider(
                          selectedStars: _ServingStars,
                          RecordRating: (selectedStars) {
                            _ServingStars = selectedStars;
                            setState(() {
                              _TotalStarts = ((_PresentationStars + 1) +
                                      (_ServingStars + 1) +
                                      (_TasteStars + 1)) /
                                  3;
                            });

                            // print("Rating 2: $selectedStars");
                          },
                          title: "Serving:",
                        ),
                        RatingSlider(
                          selectedStars: _PresentationStars,
                          RecordRating: (selectedStars) => {
                            print(
                                "$_PresentationStars <- presentation | selected -> $selectedStars"),
                            _PresentationStars = selectedStars,
                            setState(() {
                              _TotalStarts = ((_PresentationStars + 1) +
                                      (_ServingStars + 1) +
                                      (_TasteStars + 1)) /
                                  3;
                            }),
                            print("Rating 3: $selectedStars")
                          },
                          title: "Presentation:",
                        ),
                        SizedBox(
                          height: Dimensions.height10,
                        ),

                        SmallText(text: "${_TotalStarts.toPrecision(2)}"),
                        SizedBox(
                          height: Dimensions.height5,
                        ),
                        PrimaryButton(
                            TapAction: () async {
                              setState(() {
                                isLoading = true;
                              });

                              await PublishNewReview(
                                  widget.ProductToReview.BussinessId,
                                  widget.ProductToReview.Id,
                                  reviewController.text,
                                  _TotalStarts.toPrecision(2));

                              setState(() {
                                isLoading = false;
                              });

                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          ScrollableProductDetailPage(
                                            SelectedProduct:
                                                widget.ProductToReview,
                                            isLoggedin: true,
                                          )));

                              // showDialog(
                              //     context: context,
                              //     builder: (context) => UnderConstruction(
                              //           message:
                              //               "Review Module is Under Consturuction yet",
                              //         ));
                            },
                            text: "Publish Review",
                            color: AppColors.PrimaryColor,
                            icon: Icons.published_with_changes),
                        //  RatingBar.builder(itemBuilder: , onRatingUpdate: (value)=>{
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
  }
}
