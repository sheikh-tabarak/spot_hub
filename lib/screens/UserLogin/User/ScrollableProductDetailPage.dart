// ignore_for_file: file_names, sized_box_for_whitespace

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter_sticky_header/flutter_sticky_header.dart';
import 'package:get/get.dart';
import 'package:spot_hub/configurations/AppColors.dart';
import 'package:spot_hub/configurations/Dimensions.dart';
import 'package:spot_hub/configurations/SmallText.dart';
import 'package:spot_hub/models/BusinessModels/Bussiness.dart';
import 'package:spot_hub/models/BusinessModels/Product.dart';
import 'package:spot_hub/models/Global/ProductsData.dart';
import 'package:spot_hub/screens/NoData.dart';
import 'package:spot_hub/screens/UserLogin/User/AddReview.dart';
import 'package:spot_hub/widgets/PopupModals/BussinessProfile.dart';
import 'package:spot_hub/widgets/Product/ProductTitleSection.dart';
import 'package:spot_hub/widgets/Product/ReviewWidget.dart';
import 'package:spot_hub/widgets/Product/StarsCard.dart';
import 'package:spot_hub/widgets/others/PrimayButton.dart';

class ScrollableProductDetailPage extends StatefulWidget {
  final int index;
  final bool isLoggedin;
  final Product SelectedProduct;
  ScrollableProductDetailPage(
      {super.key,
      this.index = 0,
      required this.SelectedProduct,
      required this.isLoggedin});

  @override
  State<ScrollableProductDetailPage> createState() =>
      _ScrollableProductDetailPageState();
}

class _ScrollableProductDetailPageState
    extends State<ScrollableProductDetailPage> {
  int _oneStar = 0;
  int _twoStar = 0;
  int _threeStar = 0;
  int _fourStar = 0;
  int _fiveStar = 0;

  Bussiness CurrentBussiness = Bussiness(
      BussinessId: "",
      BussinessImageUrl: "",
      BussinessName: "",
      BussinessEmail: "",
      BussinessCity: "",
      BussinessAddress: "",
      BussinessPhone: "",
      BussinessType: "",
      BussinessWebsite: "",
      Reports: 0);

  bool isFavorite = false;

  void _CalculateStars(double Stars) {
    if (Stars == 5) {
      setState(() {
        _fiveStar = _fiveStar + 1;
      });
    } else if (Stars != 5) {
      if (Stars < 5 || Stars == 4 || Stars > 4) {
        setState(() {
          _fourStar = _fourStar + 1;
        });
      }
    } else if (Stars != 4) {
      if (Stars < 4 || Stars == 3 || Stars > 3) {
        setState(() {
          _threeStar = _threeStar + 1;
        });
      }
    } else if (Stars != 3) {
      if (Stars < 3 || Stars == 2 || Stars > 2) {
        setState(() {
          _twoStar = _twoStar + 1;
        });
      }
    } else if (Stars != 2) {
      if (Stars < 2 || Stars == 1 || Stars > 1) {
        setState(() {
          _oneStar = _oneStar + 1;
        });
      }
    }
  }

  @override
  initState() {
    // FirebaseAuth.instance.currentUser == null
    //     ? setState(() {
    //         widget.isLoggedin == false;
    //       })
    //     : setState(() {
    //         widget.isLoggedin == true;
    //       });

    BussinessOfProduct(widget.SelectedProduct.BussinessId).then((value) {
      setState(() {
        CurrentBussiness = Bussiness(
          BussinessId: value.BussinessId,
          BussinessName: value.BussinessName,
          BussinessImageUrl: value.BussinessImageUrl,
          BussinessEmail: value.BussinessEmail,
          BussinessAddress: value.BussinessAddress,
          BussinessCity: value.BussinessCity,
          BussinessPhone: value.BussinessPhone,
          BussinessType: value.BussinessType,
          BussinessWebsite: value.BussinessWebsite,
          Reports: value.Reports,
        );
      });
    });
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //initState();

    return Scaffold(
      backgroundColor: Colors.white,
      body: DefaultTabController(
        length: 2,
        initialIndex: 0,
        child: CustomScrollView(slivers: [
          SliverAppBar(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: const [
                //  AppIcon(icon: Icons.clear),
                //   AppIcon(icon: Icons.shopping_cart)
              ],
            ),
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(Dimensions.height10 * 17),
              child: Container(
                  // margin: EdgeInsets.only(top: 50),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                        //BorderRadius.circular(Dimensions.radius20),
                        BorderRadius.only(
                            topLeft: Radius.circular(Dimensions.radius20),
                            topRight: Radius.circular(Dimensions.radius20)),
                  ),
                  //     padding: EdgeInsets.only(top:Dimensions.height10,bottom: Dimensions.height15),
                  width: double.maxFinite,
                  child: Center(
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.all(Dimensions.height15),
                          child: ProductTitleSection(
                            City: CurrentBussiness.BussinessCity,
                            text: widget.SelectedProduct.title,
                            NoofReviews: widget.SelectedProduct.reviews,
                            OverallRating: widget.SelectedProduct.rating,
                            Price: 77,
                            ClickedFavorite: () {
                              if (isFavorite == false) {
                                setState(() {
                                  isFavorite = true;
                                  print("Added to Favorites");
                                });
                              } else {
                                setState(() {
                                  isFavorite = false;
                                  print("Removed from Favorites");
                                });
                              }
                            },
                            favoriteIcon: isFavorite == false
                                ? const Icon(
                                    Icons.favorite_border,
                                    size: 26,
                                  )
                                : const Icon(
                                    Icons.favorite,
                                    color: Colors.red,
                                    size: 30,
                                  ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            showModalBottomSheet(
                                isScrollControlled: true,
                                enableDrag: true,
                                shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(15.0),
                                  ),
                                ),
                                context: context,
                                builder: (context) {
                                  return Container(
                                      // padding: const EdgeInsets.all(10),
                                      child: BussinessProfile(
                                    isLoggedIn: widget.isLoggedin,
                                    B: CurrentBussiness,
                                  ));
                                });
                          },
                          child: Container(
                            margin: EdgeInsets.all(12),
                            decoration: BoxDecoration(
                                border: Border.all(
                                    width: 1,
                                    color: const Color.fromARGB(
                                        255, 218, 218, 218)),
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(10))),
                            // padding: EdgeInsets.all(3),
                            child: ListTile(
                              leading: CircleAvatar(
                                radius: 20,
                                backgroundImage: NetworkImage(
                                    CurrentBussiness.BussinessImageUrl),
                              ),
                              title: Text(CurrentBussiness.BussinessName),
                              subtitle: Text(
                                  CurrentBussiness.BussinessType.toString()),
                            ),
                          ),
                        )
                      ],
                    ),
                  )),
            ),
            pinned: true,
            backgroundColor: AppColors.PrimaryColor,
            expandedHeight: 400,
            flexibleSpace: FlexibleSpaceBar(
                background: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(widget.SelectedProduct.image),
                    fit: BoxFit.cover),
              ),
              child: const Text(""),
            )),
          ),
          SliverStickyHeader(
            header: Column(
              children: [
                Container(
                  height: Dimensions.height10 * 6,
                  color: Colors.white,
                  child: TabBar(
                      labelColor: AppColors.PrimaryColor,
                      indicatorColor: AppColors.PrimaryColor,
                      unselectedLabelColor: Colors.black,
                      labelPadding: const EdgeInsets.all(0),
                      unselectedLabelStyle: const TextStyle(
                          fontSize: 15, fontWeight: FontWeight.w400),
                      labelStyle: TextStyle(
                          fontSize: 15,
                          color: AppColors.PrimaryColor,
                          fontWeight: FontWeight.w700),
                      tabs: const [
                        Tab(text: 'Reviews & Rating'),
                        Tab(text: 'Description'),
                      ]),
                ),
              ],
            ),
            sliver: SliverFillRemaining(
              child: Container(
                height: double.maxFinite,
                child: TabBarView(
                  children: [
                    SingleChildScrollView(
                      physics: const NeverScrollableScrollPhysics(),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 10,
                          ),
                          widget.isLoggedin == false
                              ? SizedBox()
                              : GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => AddReview(
                                                ProductToReview:
                                                    widget.SelectedProduct)));
                                  },

                                  child: Container(
                                    alignment: Alignment.center,
                                    //height: 5,
                                    margin: EdgeInsets.all(15),
                                    padding: EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          width: 1,
                                          color: AppColors.PrimaryColor),
                                    ),
                                    //    padding: 10,
                                    child: SmallText(
                                      text: "Write a Review",
                                      color: AppColors.PrimaryColor,
                                    ),
                                  ),

                                  //    text: "Write a review",
                                  //  color: AppColors.PrimaryColor,
                                  //  icon: Icons.rate_review
                                ),

                          StreamBuilder(
                              stream: ReviewsofThatProduct(
                                  widget.SelectedProduct.Id,
                                  widget.SelectedProduct.BussinessId),
                              builder: ((context,
                                  AsyncSnapshot<QuerySnapshot> snapshot) {
                                if (snapshot.hasData) {
                                  if (snapshot.data!.docs.isNotEmpty) {
                                    return ListView(
                                        padding: EdgeInsets.zero,
                                        physics: NeverScrollableScrollPhysics(),
                                        shrinkWrap: true,
                                        // This next line does the trick.
                                        scrollDirection: Axis.vertical,
                                        children: snapshot.data!.docs.map((e) {
                                          //  _CalculateStars(e['Stars']);
                                          return ReviewWidget(
                                            Name: e['Name'],
                                            Review: e['Review'],
                                            stars: e['Stars'],
                                            TimeStamp: e['TimeStamp'],
                                          );
                                        }).toList());
                                  } else {
                                    return NoData(
                                      ImageLink:
                                          "assets/images/noreviewsyet.png",
                                      title: "No Pulished Review",
                                      subtitle:
                                          "This Product have no Customer feedback yet, Just Login and write a Review now",
                                    );
                                  }
                                } else {
                                  return NoData(
                                    ImageLink: "assets/images/noreviewsyet.png",
                                    title: "No Pulished Reviews",
                                    subtitle:
                                        "This Product have no Customer feedback yet, Just Login and write a Review now",
                                  );
                                }
                                // return snapshot.data!.docs.isNotEmpty &&
                                //         snapshot.hasData
                                //     ? ListView(
                                //         padding: EdgeInsets.zero,
                                //         physics: NeverScrollableScrollPhysics(),
                                //         shrinkWrap: true,
                                //         // This next line does the trick.
                                //         scrollDirection: Axis.vertical,
                                //         children: snapshot.data!.docs.map((e) {
                                //           return ReviewWidget(
                                //             Name: e['Name'],
                                //             Review: e['Review'],
                                //             stars: e['Stars'],
                                //             TimeStamp: e['TimeStamp'],
                                //           );
                                //         }).toList())
                                //     : SmallText(
                                //         text:
                                //             "This Product have no Review yet");
                              }))
                          // SmallText(text: "text"),
                          // ListView.builder(
                          //     padding: EdgeInsets.zero,
                          //     physics: const NeverScrollableScrollPhysics(),
                          //     shrinkWrap: true,
                          //     itemCount: 5,
                          //     itemBuilder: (context, thisindex) {
                          //       return ReviewWidget(
                          //         Name: "John Doe",
                          //         Review: "Best of best",
                          //         stars: 5,
                          //         TimeStamp: DateTime.now().toString(),
                          //       );
                          //     }),
                        ],
                      ),
                    ),
                    SingleChildScrollView(
                      physics: const NeverScrollableScrollPhysics(),
                      child: Container(
                        padding: EdgeInsets.only(
                            top: 20,
                            left: Dimensions.width10,
                            right: Dimensions.width10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            StarsCard(
                              totalrating: widget.SelectedProduct.rating,
                              count: widget.SelectedProduct.reviews,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                                margin: EdgeInsets.only(right: 20, left: 20),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SmallText(
                                      text: "Description:",
                                      color: AppColors.PrimaryColor,
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    SmallText(
                                        text:
                                            widget.SelectedProduct.description),
                                  ],
                                ))
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
