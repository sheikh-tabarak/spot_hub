// ignore_for_file: file_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';
import 'package:spot_hub/configurations/AppColors.dart';
import 'package:spot_hub/configurations/BigText.dart';
import 'package:spot_hub/configurations/Dimensions.dart';
import 'package:spot_hub/configurations/SmallText.dart';
import 'package:spot_hub/models/BusinessModels/Bussiness.dart';
import 'package:spot_hub/models/BusinessModels/Product.dart';
import 'package:spot_hub/models/Global/ProductsData.dart';
import 'package:spot_hub/screens/Loading.dart';
import 'package:spot_hub/widgets/Product/ProductCard.dart';
import 'package:spot_hub/widgets/others/PrimaryWidgets/ImageViewer.dart';

class BussinessProfile extends StatelessWidget {
  final bool isLoggedIn;
  final Bussiness B;
  BussinessProfile({super.key, required this.isLoggedIn, required this.B});

  @override
  Widget build(BuildContext context) {
    print('This is id : Bussiness Id');
    return Scaffold(
      backgroundColor: Colors.white,
      body: DefaultTabController(
        length: 3,
        initialIndex: 0,
        child: CustomScrollView(slivers: [
          SliverAppBar(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //                 IconButton(
                //                     onPressed: () => {
                //             //          Navigator.pop(context)
                //                          Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) => HomePage( userindex:0,)),
                // )
                //                         },
                //                     icon: AppIcon(
                //                       icon: Icons.clear,
                //                     )),
                // AppIcon(icon: Icons.share)
              ],
            ),
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(Dimensions.height10 * 8),
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
                  width: double.maxFinite,
                  child: Center(
                    child: Container(
                        padding: EdgeInsets.all(Dimensions.height15),
                        child: Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                BigText(text: B.BussinessName),
                                SmallText(text: B.BussinessAddress),
                                SizedBox(height: Dimensions.height5),
                                Row(
                                  children: [
                                    Icon(Icons.star,
                                        size: Dimensions.font15,
                                        color: AppColors.PrimaryColor),
                                    Icon(Icons.star,
                                        size: Dimensions.font15,
                                        color: AppColors.PrimaryColor),
                                    Icon(Icons.star,
                                        size: Dimensions.font15,
                                        color: AppColors.PrimaryColor),
                                    Icon(Icons.star,
                                        size: Dimensions.font15,
                                        color: AppColors.PrimaryColor),
                                    Icon(Icons.star_border_outlined,
                                        size: Dimensions.font15,
                                        color: AppColors.PrimaryColor),
                                    SizedBox(width: Dimensions.width5),
                                    SmallText(text: '( ${B.Reports} Reviews )')
                                  ],
                                ),
                              ],
                            )
                          ],
                        )),
                  )),
            ),
            pinned: true,
            backgroundColor: AppColors.PrimaryColor,
            expandedHeight: 300,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.network(
                B.BussinessImageUrl,
                width: double.maxFinite,
                fit: BoxFit.cover,
              ),
              // background: Image.asset(
              //       'assets/image/resturant1.jpg',

              // ),
            ),
          ),
          SliverStickyHeader(
            header: Column(
              children: [
                Container(
                  padding: EdgeInsets.all(Dimensions.height5),
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
                        Tab(
                          // icon: Icon(
                          //   Icons.sell,
                          //   size: 20
                          // ),
                          text: "Popular",
                          //     child: SmallText(text: 'About',size: Dimensions.font15,color: AppColors.mainColor,)
                        ),
                        Tab(
                          // icon: Icon(Icons.list, size: 20),
                          text: "Images",
                          //   child: SmallText(text: 'Reviews',size: Dimensions.font15,color: AppColors.mainColor,)
                        ),
                      ]),
                ),
              ],
            ),
            sliver: SliverFillRemaining(
              child: Container(
                // height: double.maxFinite,
                child: TabBarView(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: StreamBuilder(
                          stream: ProductsofThatBussiness(B.BussinessId),
                          builder:
                              (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                            return snapshot.hasData
                                ? ListView(
                                    physics: NeverScrollableScrollPhysics(),
                                    shrinkWrap: true,
                                    // This next line does the trick.
                                    scrollDirection: Axis.vertical,
                                    children: snapshot.data!.docs.map((e) {
                                      // if()

                                      return GestureDetector(
                                          onTap: () {},
                                          child: ProductCard(
                                              isLoggedin: isLoggedIn,
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
                                                      e["isRecommended"])));
                                    }).toList())
                                : Container(
                                    padding: EdgeInsets.all(10),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(50),
                                            border: Border.all(
                                                width: 2.0,
                                                color: Color.fromARGB(
                                                    255, 237, 237, 237)),
                                          ),
                                          alignment: Alignment.center,
                                          child: Icon(Icons.add),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        SmallText(text: "Register")
                                      ],
                                    ),
                                  );
                          }),
                    ),

                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: StreamBuilder(
                          stream: ProductsofThatBussiness(B.BussinessId),
                          builder:
                              (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                            return snapshot.hasData
                                ? Wrap(
                                    // physics: NeverScrollableScrollPhysics(),
                                    // shrinkWrap: true,
                                    // This next line does the trick.
                                    //  scrollDirection: Axis.,
                                    children: snapshot.data!.docs.map((e) {
                                    // if()

                                    return GestureDetector(
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) => ImageViewer(
                                                  imageUrl: e["image"]),
                                            ),
                                          );
                                        },
                                        child: Container(
                                          margin: EdgeInsets.all(5),
                                          width: 120,
                                          height: 120,
                                          decoration: BoxDecoration(
                                              image: DecorationImage(
                                                  image:
                                                      NetworkImage(e["image"]),
                                                  fit: BoxFit.cover)),
                                        )

                                        // ProductCard(
                                        //     products: Product(
                                        //         BussinessId: e["BussinessId"],
                                        //         Id: e["Id"],
                                        //         image: e["image"],
                                        //         description: e["description"],
                                        //         title: e["title"],
                                        //         Price: e["Price"],
                                        //         rating: e["rating"],
                                        //         reviews: e["reviews"],
                                        //         isRecommended:
                                        //             e["isRecommended"]))

                                        );
                                  }).toList())
                                : Loading(message: "Fetching your products");
                            //Container(
                            //   padding: EdgeInsets.all(10),
                            //   child: Column(
                            //     crossAxisAlignment:
                            //         CrossAxisAlignment.center,
                            //     mainAxisAlignment:
                            //         MainAxisAlignment.center,
                            //     children: [
                            //       Container(
                            //         decoration: BoxDecoration(
                            //           borderRadius:
                            //               BorderRadius.circular(50),
                            //           border: Border.all(
                            //               width: 2.0,
                            //               color: Color.fromARGB(
                            //                   255, 237, 237, 237)),
                            //         ),
                            //         alignment: Alignment.center,
                            //         child: Icon(Icons.add),
                            //       ),
                            //       SizedBox(
                            //         height: 5,
                            //       ),
                            //       SmallText(text: "Register")
                            //     ],
                            //   ),
                            // );
                          }),
                    ),

                    // Center(
                    //     child: BigText(
                    //   text: 'This is  Images Section',
                    // )),
                    // Center(
                    //     child: BigText(
                    //   text: 'This is Images Section',
                    // )),
                    // ListView.builder(
                    //     physics: const NeverScrollableScrollPhysics(),
                    //     shrinkWrap: true,
                    //     itemCount: 5,
                    //     itemBuilder: (context, index) {
                    //       return const ReviewWidget(
                    //         Name: "ReviewsData[index].Name",
                    //         Review: "ReviewsData[index].Review",
                    //         stars: 4,
                    //         TimeStamp: "ReviewsData[index].TimeStamp",
                    //       );
                    //     }),
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
