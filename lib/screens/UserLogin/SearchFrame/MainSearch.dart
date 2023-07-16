import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:spot_hub/configurations/AppColors.dart';
import 'package:spot_hub/configurations/BigText.dart';
import 'package:spot_hub/configurations/SmallText.dart';
import 'package:spot_hub/models/DummyData.dart';
import 'package:spot_hub/models/BusinessModels/Product.dart';
import 'package:spot_hub/models/Global/ProductsData.dart';
import 'package:spot_hub/screens/Loading.dart';
import 'package:spot_hub/screens/UserLogin/SearchFrame/widgets/FilterView.dart';
import 'package:spot_hub/screens/UserLogin/SearchFrame/widgets/FilteredBox.dart';
import 'package:spot_hub/widgets/Product/ProductCard.dart';

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
  var items = <String>[];
  TextEditingController SearchTextControl = new TextEditingController();
  List<int> filteredIndexes = <int>[];
  List<int> Previousindex = <int>[];

  // String _SearchedText

  @override
  void initState() {
    super.initState();
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
            margin: EdgeInsets.all(10),
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
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    color: AppColors.PrimaryColor,
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(10),
                        bottomRight: Radius.circular(10)),
                  ),
                  child: IconButton(
                    //   color: AppColors.PrimaryColor,
                    icon: Icon(
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
                    ? SizedBox()
                    : Container(
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
                              text: "Recommended",
                              color: Colors.white,
                            ),
                            //   ],
                            //  ),
                            SizedBox(
                              width: 10,
                            ),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  widget.recommended = false;
                                });
                              },
                              child: Icon(
                                Icons.cancel,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                widget.StarRating == 0
                    ? SizedBox()
                    : Container(
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
                              text: "${widget.StarRating + 2}+ Rating",
                              color: Colors.white,
                            ),
                            //   ],
                            //  ),
                            SizedBox(
                              width: 10,
                            ),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  widget.StarRating = 0;
                                });
                              },
                              child: Icon(
                                Icons.cancel,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                widget.reviewCount == 0
                    ? SizedBox()
                    : Container(
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
                            SizedBox(
                              width: 10,
                            ),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  widget.reviewCount = 0;
                                });
                              },
                              child: Icon(
                                Icons.cancel,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                widget.Category == 0
                    ? SizedBox()
                    : Container(
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
            margin: EdgeInsets.all(10),
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
                      padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 1,
                          color: AppColors.PrimaryColor,
                        ),
                        borderRadius: BorderRadius.only(
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
                              padding: EdgeInsets.all(10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  BigText(text: "Sort"),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  SmallText(text: "Sort by price"),
                                  SmallText(text: "Sort by rating")
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
                            Icon(
                              Icons.sort,
                              color: AppColors.PrimaryColor,
                            )
                          ],
                        )),
                  ),
                ), // IconButton widget
              ],
            ), // Row widget
          ),

          // SizedBox(height: 10,),

          StreamBuilder(
              stream: ProductsOfAllBussinesses(),
              builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                return snapshot.hasData
                    ? ListView(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        // This next line does the trick.
                        scrollDirection: Axis.vertical,
                        children: snapshot.data!.docs.map((e) {
                          if (e["title"].toString().contains(widget.Results)) {
                            if (widget.Category == 1
                                ? e["Category"].toString().contains("Desi")
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
                                            isRecommended: e["isRecommended"])),
                                  );
                                }
                              }
                            }
                          }

                          return SizedBox();
                          // if()
                        }).toList())
                    : const Loading(message: "Fetching products data");
              }),
        ],
      )),
    ); // Container widget
  }
}
