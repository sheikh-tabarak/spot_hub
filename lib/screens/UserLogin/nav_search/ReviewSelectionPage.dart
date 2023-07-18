import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:spot_hub/configurations/AppColors.dart';
import 'package:spot_hub/configurations/BigText.dart';
import 'package:spot_hub/configurations/Dimensions.dart';
import 'package:spot_hub/configurations/SmallText.dart';
import 'package:spot_hub/models/BusinessModels/Product.dart';
import 'package:spot_hub/models/DummyData.dart';
import 'package:spot_hub/models/Global/ProductsData.dart';
import 'package:spot_hub/widgets/default_widgets/Loading.dart';
import 'package:spot_hub/screens/UserLogin/nav_more/AddReview.dart';
import 'package:spot_hub/screens/UserLogin/nav_search/MainSearch.dart';
import 'package:spot_hub/screens/UserLogin/nav_more/ScrollableProductDetailPage.dart';
import 'package:spot_hub/widgets/product_widgets/ProductCard.dart';
import 'package:spot_hub/widgets/primary_widgets/PrimayButton.dart';
//import 'package:geolocator/geolocator.dart';

class ReviewSelectionPage extends StatefulWidget {
  String Results;
  final String searchTitle;
  final bool isSelection;
  final int index;

  ReviewSelectionPage(
      {super.key,
      this.Results = "",
      this.index = 0,
      required this.searchTitle,
      this.isSelection = false});

  @override
  State<ReviewSelectionPage> createState() => _ReviewSelectionPageState();
}

class _ReviewSelectionPageState extends State<ReviewSelectionPage> {
  TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
            backgroundColor: AppColors.PrimaryColor,
            title: BigText(
              text: "Select a Product to Review",
              color: Colors.white,
            )),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: Dimensions.height10,
                ),
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        onChanged: (value) {
                          setState(() {
                            widget.Results = value;
                          });
                        },
                        controller: searchController,
                        decoration: const InputDecoration(
                          hintText: "Search for products",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
                        ),
                      ), // TextField widget
                    ), // Expanded widget
                  ],
                ),
                StreamBuilder(
                    stream: ProductsOfAllBussinesses(),
                    builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                      return snapshot.hasData
                          ? ListView(
                              padding: EdgeInsets.zero,
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              // This next line does the trick.
                              scrollDirection: Axis.vertical,
                              children: snapshot.data!.docs.map((e) {
                                if (e["title"]
                                    .toString()
                                    .contains(widget.Results)) {
                                  // if (widget.PriceFilter != 0 &&
                                  //     e["Price"] > widget.PriceFilter) {
                                  return GestureDetector(
                                    // onTap: () {

                                    // },
                                    child: Container(
                                      margin: const EdgeInsets.only(
                                          bottom: 5, top: 5),
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            width: 1,
                                            color: const Color.fromARGB(
                                                255, 224, 224, 224)),
                                        borderRadius: const BorderRadius.all(
                                          Radius.circular(10),
                                        ),
                                      ),
                                      child: Column(
                                        children: [
                                          ListTile(
                                            leading: Container(
                                              width: 50,
                                              height: 50,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    const BorderRadius.all(
                                                        Radius.circular(50)),
                                                image: DecorationImage(
                                                    image: NetworkImage(
                                                        e["image"]),
                                                    fit: BoxFit.cover),
                                              ),
                                            ),
                                            title: Padding(
                                              padding: const EdgeInsets.only(
                                                  bottom: 3),
                                              child: SmallText(
                                                  size: 14,
                                                  color: Colors.black,
                                                  text: e["title"]),
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
                                                                color: AppColors
                                                                    .PrimaryColor,
                                                                size: 20,
                                                              )),
                                                    ),
                                                    // Wrap(
                                                    //   children: List.generate(
                                                    //       e["rating"].floor(),
                                                    //       (index) => Icon(
                                                    //             Icons.star,
                                                    //             color: AppColors
                                                    //                 .PrimaryColor,
                                                    //             size: 20,
                                                    //           )),
                                                    // ),
                                                  ],
                                                ),
                                                SizedBox(
                                                  width: Dimensions.height10,
                                                ),
                                                SmallText(
                                                    text:
                                                        e["rating"].toString()),
                                                const SizedBox(
                                                  width: 5,
                                                ),
                                                SmallText(text: '| '),
                                                SmallText(
                                                    text: e["reviews"]
                                                        .toString()),
                                                const SizedBox(
                                                  width: 5,
                                                ),
                                                SmallText(text: 'Reviews'),
                                              ],
                                            ),
                                            trailing: SmallText(
                                              text: e["Price"].toString(),
                                              color: AppColors.PrimaryColor,
                                              weight: FontWeight.w800,
                                            ),
                                          ),
                                          PrimaryButton(
                                              padding: 10,
                                              TapAction: () {
                                                Navigator.pop(context);
                                                Navigator.pushReplacement(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) => AddReview(
                                                            isSelected: true,
                                                            ProductToReview: Product(
                                                                BussinessId: e[
                                                                    "BussinessId"],
                                                                Id: e["Id"],
                                                                image:
                                                                    e["image"],
                                                                description: e[
                                                                    "description"],
                                                                title:
                                                                    e["title"],
                                                                Category: e[
                                                                    "Category"],
                                                                Price:
                                                                    e["Price"],
                                                                rating:
                                                                    e["rating"],
                                                                reviews: e[
                                                                    "reviews"],
                                                                isRecommended: e[
                                                                    "isRecommended"]))));
                                              },
                                              text: "Select",
                                              color: AppColors.PrimaryColor,
                                              icon: Icons.ads_click)
                                        ],
                                      ),
                                    ),
                                  );
                                }

                                return const SizedBox();
                                // if()
                              }).toList())
                          : const Loading(message: "Fetching products data");
                    }),
              ],
            ),
          ),
        ));
  }
}
