import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:spot_hub/configurations/AppColors.dart';
import 'package:spot_hub/configurations/BigText.dart';
import 'package:spot_hub/configurations/SmallText.dart';
import 'package:spot_hub/models/DummyData.dart';
import 'package:spot_hub/models/BusinessModels/Product.dart';
import 'package:spot_hub/screens/UserLogin/SearchFrame/widgets/FilterView.dart';
import 'package:spot_hub/screens/UserLogin/SearchFrame/widgets/FilteredBox.dart';
import 'package:spot_hub/widgets/Product/ProductCard.dart';

class MainSearch extends StatefulWidget {
  final String Results;
   String StarRating;
   String reviewCount;
   String PriceFilter;

   MainSearch({
    super.key,
    required this.Results,
     this.StarRating="0",
     this.reviewCount="0",
     this.PriceFilter="0",
  });

  @override
  State<MainSearch> createState() => _MainSearchState();
}

class _MainSearchState extends State<MainSearch> {
  var items = <String>[];
  TextEditingController SearchTextControl = new TextEditingController();
  List<int> filteredIndexes = <int>[];
  List<int> Previousindex = <int>[];

  @override
  void initState() {
    // TODO: implement initState
    for (var i = 0; i < DummyProducts.length; i++) {
      Previousindex.add(i);
    }
    filteredIndexes.clear();
    filteredIndexes.addAll(Previousindex);
    SearchTextControl.text = widget.Results;
    super.initState();
  }

  void filterSearch(String query) {
    //List<int> Previousindex = <int>[];
    // List<int> filteredIndexes = <int>[];

    if (query.isNotEmpty) {
      Previousindex.clear();
      for (int i = 0; i < DummyProducts.length; i++) {
        if (DummyProducts[i].title.contains(query) ||
            DummyProducts[i].description.contains(query)) {
          Previousindex.add(i);
        }
      }

      setState(() {
        filteredIndexes.clear();
        filteredIndexes.addAll(Previousindex);
      });

      print(filteredIndexes);
      print(filteredIndexes.length);

      return;
    } else {
      setState(() {
        filteredIndexes.clear();
        filteredIndexes.addAll(Previousindex);
      });
      print(filteredIndexes);
      print(filteredIndexes.length);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: SmallText(
          text: "Searching \"${widget.Results}\"",
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
                        filterSearch(value);
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
                Container(
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
                        text: "3.0+ Rating",
                        color: Colors.white,
                      ),
                      //   ],
                      //  ),
                      SizedBox(
                        width: 10,
                      ),
                      Icon(
                        Icons.cancel,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
                Container(
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
                        text: "3.0+ Rating",
                        color: Colors.white,
                      ),
                      //   ],
                      //  ),
                      SizedBox(
                        width: 10,
                      ),
                      Icon(
                        Icons.cancel,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
                widget.StarRating == "0"
                    ? SizedBox()
                    : FilteredBox(
                        text: "${widget.StarRating} Rating",
                        onCancel: (value) {
                          setState(() {
                             widget.StarRating="0";
                          });
                         
                          print("Pressed$value");
                        },
                      )
              ],
            ),
          ),

          Container(
            margin: EdgeInsets.all(10),
            // padding: EdgeInsets.all(10),
            child: Row(
              children: [
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
                            return FilterView();
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
          Container(
            height: 550,
            child: SingleChildScrollView(
                child: ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: filteredIndexes.length,
                    itemBuilder: (context, index) {
                      return ProductCard(
                          products: Product(
                              isRecommended:
                                  DummyProducts[filteredIndexes.elementAt(index)]
                                      .isRecommended,
                              BussinessId:
                                  DummyProducts[filteredIndexes.elementAt(index)]
                                      .BussinessId,
                              Id: DummyProducts[filteredIndexes.elementAt(index)]
                                  .Id,
                              image:
                                  DummyProducts[filteredIndexes.elementAt(index)]
                                      .image,
                              description:
                                  DummyProducts[filteredIndexes.elementAt(index)]
                                      .description,
                              title:
                                  DummyProducts[filteredIndexes.elementAt(index)]
                                      .title,
                              Price:
                                  DummyProducts[filteredIndexes.elementAt(index)]
                                      .Price,
                              rating:
                                  DummyProducts[filteredIndexes.elementAt(index)]
                                      .rating,
                              reviews:
                                  DummyProducts[filteredIndexes.elementAt(index)]
                                      .reviews));
                    })),
          )
        ],
      )),
    ); // Container widget
  }
}