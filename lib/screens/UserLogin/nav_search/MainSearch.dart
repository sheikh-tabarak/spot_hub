import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:lottie/lottie.dart';
import 'package:spot_hub/configurations/AppColors.dart';
import 'package:spot_hub/configurations/BigText.dart';
import 'package:spot_hub/configurations/SmallText.dart';
import 'package:spot_hub/models/DummyData.dart';
import 'package:spot_hub/models/BusinessModels/Product.dart';
import 'package:spot_hub/models/Global/ProductsData.dart';
import 'package:spot_hub/widgets/default_widgets/Loading.dart';
import 'package:spot_hub/widgets/search_widgets/FilterView.dart';
import 'package:spot_hub/widgets/search_widgets/FilteredBox.dart';
import 'package:spot_hub/widgets/product_widgets/ProductCard.dart';

class MainSearch extends StatefulWidget {
  final bool isLoggedIn;
  String Results;
  double StarRating;
  int reviewCount;
  int Category;
  bool recommended;
  double PriceFilter;

  MainSearch(
      {super.key,
      this.Results = "",
      required this.isLoggedIn,
      this.StarRating = 0,
      this.Category = 0,
      this.reviewCount = 0,
      this.PriceFilter = 0,
      this.recommended = false});

  @override
  State<MainSearch> createState() => _MainSearchState();
}

class _MainSearchState extends State<MainSearch> {
  int _ProductCount = 0;
  int _sort = 0;
  var items = <String>[];
  TextEditingController SearchTextControl = new TextEditingController();
  List<int> filteredIndexes = <int>[];
  List<int> Previousindex = <int>[];

  // String _SearchedText

  @override
  void initState() {
    super.initState();
    SearchTextControl.text = widget.Results;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: SmallText(
          text: "Searching \"${SearchTextControl.text}\"",
          size: 12,
          color: Colors.white,
        ),
        backgroundColor: AppColors.PrimaryColor,
      ),
      body: SingleChildScrollView(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.all(10),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    onChanged: (value) {
                      setState(() {
                        widget.Results = value;
                      });
                    },
                    controller: SearchTextControl,
                    decoration: const InputDecoration(
                      hintText: "Search for products",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            bottomLeft: Radius.circular(10)),
                      ),
                    ),
                  ), // TextField widget
                ), // Expanded widget
                // SizedBox widget
                Container(
                  margin: EdgeInsets.zero,
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    color: AppColors.PrimaryColor,
                    borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(10),
                        bottomRight: Radius.circular(10)),
                  ),
                  child: IconButton(
                    //   color: AppColors.PrimaryColor,
                    icon: const Icon(
                      Icons.search,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      // Handle the search button press here
                    },
                  ),
                ), // IconButton widget
              ],
            ), // Row widget
          ),
          Container(
            //   padding: EdgeInsets.all(10),
            child: Wrap(
              alignment: WrapAlignment.start,
              children: [
                widget.recommended == false
                    ? const SizedBox()
                    : Container(
                        margin: const EdgeInsets.only(
                            top: 10, left: 10, bottom: 10),
                        padding: const EdgeInsets.all(10),
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
                              text: "Recommended",
                              color: Colors.white,
                            ),
                            //   ],
                            //  ),
                            const SizedBox(
                              width: 10,
                            ),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  widget.recommended = false;
                                });
                              },
                              child: const Icon(
                                Icons.cancel,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                widget.StarRating == 0
                    ? const SizedBox()
                    : Container(
                        margin: const EdgeInsets.only(
                            top: 10, left: 10, bottom: 10),
                        padding: const EdgeInsets.all(10),
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
                              text: "${widget.StarRating + 2}+ Rating",
                              color: Colors.white,
                            ),
                            //   ],
                            //  ),
                            const SizedBox(
                              width: 10,
                            ),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  widget.StarRating = 0;
                                });
                              },
                              child: const Icon(
                                Icons.cancel,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                widget.reviewCount == 0
                    ? const SizedBox()
                    : Container(
                        margin: const EdgeInsets.only(
                            top: 10, left: 10, bottom: 10),
                        padding: const EdgeInsets.all(10),
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
                              text: widget.reviewCount == 1
                                  ? "10+ Reviews"
                                  : widget.reviewCount == 2
                                      ? "50+ Reviews"
                                      : widget.reviewCount == 3
                                          ? "100+ Reviews"
                                          : "",
                              color: Colors.white,
                            ),
                            //   ],
                            //  ),
                            const SizedBox(
                              width: 10,
                            ),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  widget.reviewCount = 0;
                                });
                              },
                              child: const Icon(
                                Icons.cancel,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                widget.Category == 0
                    ? const SizedBox()
                    : Container(
                        margin: const EdgeInsets.only(
                            top: 10, left: 10, bottom: 10),
                        padding: const EdgeInsets.all(10),
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
                              text: widget.Category == 0
                                  ? "N/A"
                                  : widget.Category == 1
                                      ? "Desi"
                                      : widget.Category == 2
                                          ? "Fast Food"
                                          : widget.Category == 3
                                              ? "Sea Food"
                                              : widget.Category == 4
                                                  ? "Chineese"
                                                  : "",
                              color: Colors.white,
                            ),
                            //   ],
                            //  ),
                            const SizedBox(
                              width: 10,
                            ),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  widget.Category = 0;
                                });
                              },
                              child: const Icon(
                                Icons.cancel,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      )
                // : SizedBox(),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.all(10),
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      print(
                          "Rating=> ${widget.StarRating} Reviews=> ${widget.reviewCount}");

                      showModalBottomSheet(
                          enableDrag: true,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(15.0),
                            ),
                          ),
                          context: context,
                          builder: (context) {
                            return FilterView(
                              Category: widget.Category,
                              isLoggedIn: widget.isLoggedIn,
                              Star_Rating: widget.StarRating,
                              reviewCount: widget.reviewCount,
                            );
                          });
                    },
                    child: Container(
                      padding: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 1,
                          color: AppColors.PrimaryColor,
                        ),
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(10),
                            bottomLeft: Radius.circular(10)),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          BigText(
                            text: "Filter by",
                            color: AppColors.PrimaryColor,
                            size: 16,
                          ),
                          Icon(
                            Icons.filter_alt_outlined,
                            color: AppColors.PrimaryColor,
                          )
                        ],
                      ),
                    ),
                  ),
                ),

                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      showModalBottomSheet(
                          enableDrag: true,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(15.0),
                            ),
                          ),
                          context: context,
                          builder: (context) {
                            return Container(
                              padding: const EdgeInsets.all(20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      BigText(
                                        text: "Sorting",
                                        color: AppColors.PrimaryColor,
                                      ),
                                      IconButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          icon: const Icon(Icons.cancel))
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  ListTile(
                                    onTap: () {
                                      setState(() {
                                        _sort = 0;
                                      });
                                      Navigator.pop(context);
                                    },
                                    title: SmallText(text: "Default Sort"),
                                    leading: Icon(
                                      Icons.sort,
                                      color: AppColors.PrimaryColor,
                                    ),
                                  ),
                                  ListTile(
                                    onTap: () {
                                      setState(() {
                                        _sort = 1;
                                      });
                                      Navigator.pop(context);
                                    },
                                    title:
                                        SmallText(text: "Sort Alphabatically"),
                                    leading: Icon(
                                      Icons.sort_by_alpha,
                                      color: AppColors.PrimaryColor,
                                    ),
                                  ),
                                  ListTile(
                                    onTap: () {
                                      setState(() {
                                        _sort = 2;
                                      });
                                      Navigator.pop(context);
                                    },
                                    title: SmallText(text: "Sort by Rating"),
                                    leading: Icon(
                                      Icons.star,
                                      color: AppColors.PrimaryColor,
                                    ),
                                  ),
                                  ListTile(
                                    onTap: () {
                                      setState(() {
                                        _sort = 3;
                                      });
                                      Navigator.pop(context);
                                    },
                                    title: SmallText(text: "Sort by Prices"),
                                    leading: Icon(
                                      Icons.monetization_on,
                                      color: AppColors.PrimaryColor,
                                    ),
                                  ),
                                  ListTile(
                                    onTap: () {
                                      setState(() {
                                        _sort = 4;
                                      });
                                      Navigator.pop(context);
                                    },
                                    title: SmallText(
                                        text: "Sort by no of Reviews"),
                                    leading: Icon(
                                      Icons.numbers,
                                      color: AppColors.PrimaryColor,
                                    ),
                                  ),
                                ],
                              ),
                            );
                          });
                    },
                    child: Container(
                        padding: const EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          border: Border.all(
                              width: 1, color: AppColors.PrimaryColor),
                          borderRadius: const BorderRadius.only(
                              topRight: Radius.circular(10),
                              bottomRight: Radius.circular(10)),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            BigText(
                              size: 16,
                              color: AppColors.PrimaryColor,
                              text: "Sort by",
                            ),
                            _sort == 0
                                ? Icon(
                                    Icons.sort,
                                    color: AppColors.PrimaryColor,
                                  )
                                : _sort == 1
                                    ? Icon(
                                        Icons.sort_by_alpha,
                                        color: AppColors.PrimaryColor,
                                      )
                                    : _sort == 2
                                        ? Icon(
                                            Icons.stars,
                                            color: AppColors.PrimaryColor,
                                          )
                                        : _sort == 3
                                            ? Icon(
                                                Icons.monetization_on,
                                                color: AppColors.PrimaryColor,
                                              )
                                            : Icon(
                                                Icons.numbers,
                                                color: AppColors.PrimaryColor,
                                              )
                          ],
                        )),
                  ),
                ), // IconButton widget
              ],
            ), // Row widget
          ),
          StreamBuilder(
              stream: ProductsOfAllBussinessesSorted(
                _sort,
              ),
              builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                return snapshot.hasData
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 10,
                          ),
                          ListView(
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              children: snapshot.data!.docs.map((e) {
                                if (e["title"]
                                        .toString()
                                        .toLowerCase()
                                        .contains(
                                            widget.Results.toLowerCase()) ||
                                    e["Id"]
                                        .toString()
                                        .contains(widget.Results)) {
                                  if (widget.Category == 1
                                      ? e["Category"]
                                          .toString()
                                          .contains("Desi")
                                      : widget.Category == 2
                                          ? e["Category"]
                                              .toString()
                                              .contains("Fast Food")
                                          : widget.Category == 3
                                              ? e["Category"]
                                                  .toString()
                                                  .contains("Sea Food")
                                              : widget.Category == 4
                                                  ? e["Category"]
                                                      .toString()
                                                      .contains("Chineese")
                                                  : e["Category"]
                                                      .toString()
                                                      .contains("")) {
                                    if (widget.reviewCount == 1
                                        ? e["reviews"] >= 10
                                        : widget.reviewCount == 2
                                            ? e["reviews"] >= 50
                                            : widget.reviewCount == 3
                                                ? e["reviews"] >= 100
                                                : widget.reviewCount >= 0) {
                                      if (widget.StarRating == 1
                                          ? e["rating"] >= 3
                                          : widget.StarRating == 2
                                              ? e["rating"] >= 4
                                              : widget.StarRating == 3
                                                  ? e["rating"] == 5
                                                  : widget.StarRating >= 0) {
                                        return GestureDetector(
                                          onTap: () {},
                                          child: ProductCard(
                                              isLoggedin: widget.isLoggedIn,
                                              products: Product(
                                                  BussinessId: e["BussinessId"],
                                                  Id: e["Id"],
                                                  image: e["image"],
                                                  description: e["description"],
                                                  title: e["title"],
                                                  Category: e["Category"],
                                                  Price: e["Price"],
                                                  rating: e["rating"],
                                                  reviews: e["reviews"],
                                                  isRecommended:
                                                      e["isRecommended"])),
                                        );
                                      }
                                    }
                                  }
                                }

                                return const SizedBox();
                                // if()
                              }).toList()),
                        ],
                      )
                    : Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Center(
                          child: Lottie.asset(
                            'assets/images/animation_lk7tz5gr.json', // Replace with the path to your Lottie animation file
                            width: 200,
                            height: 200,
                            fit: BoxFit.contain,
                          ),
                        ),
                      );
              }),
        ],
      )),
    ); // Container widget
  }
}
