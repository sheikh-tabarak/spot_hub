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
import 'package:spot_hub/widgets/default_widgets/Loading.dart';
import 'package:spot_hub/widgets/product_widgets/ProductCard.dart';
import 'package:spot_hub/widgets/primary_widgets/ImageViewer.dart';

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

                                // Row(
                                //   children: [
                                //     Expanded(
                                //       flex: 1,
                                //       child: Text(
                                //         B.BussinessAddress,
                                //         style: TextStyle(fontSize: 58),
                                //         softWrap: false,
                                //         maxLines: 1,
                                //       ),
                                //     ),
                                //   ],
                                // ),

                                // Text(
                                //     overflow: TextOverflow.ellipsis,
                                //     B.BussinessAddress),

                                // Text(B.BussinessAddress,
                                //     overflow: TextOverflow.fade,
                                //     maxLines: 1,
                                //     softWrap: false,
                                //     style: TextStyle(
                                //       fontFamily: 'Poppins',
                                //     )),
                                SmallText(text: B.BussinessCity),
                                SizedBox(height: Dimensions.height5),
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
                          text: "Products",
                        ),
                        Tab(
                          text: "Images",
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
                    SingleChildScrollView(
                      physics: const AlwaysScrollableScrollPhysics(),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: StreamBuilder(
                            stream: ProductsofThatBussiness(B.BussinessId),
                            builder: (context,
                                AsyncSnapshot<QuerySnapshot> snapshot) {
                              return snapshot.hasData
                                  ? Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 15, top: 10, bottom: 10),
                                          child: SmallText(
                                              text:
                                                  "${snapshot.data!.docs.length} Products found"),
                                        ),
                                        ListView(
                                            physics:
                                                const NeverScrollableScrollPhysics(),
                                            shrinkWrap: true,
                                            // This next line does the trick.
                                            scrollDirection: Axis.vertical,
                                            children:
                                                snapshot.data!.docs.map((e) {
                                              // if()

                                              return GestureDetector(
                                                  onTap: () {},
                                                  child: ProductCard(
                                                      isLoggedin: isLoggedIn,
                                                      products: Product(
                                                          BussinessId:
                                                              e["BussinessId"],
                                                          Id: e["Id"],
                                                          image: e["image"],
                                                          description:
                                                              e["description"],
                                                          title: e["title"],
                                                          Category:
                                                              e["Category"],
                                                          Price: e["Price"],
                                                          rating: e["rating"],
                                                          reviews: e["reviews"],
                                                          isRecommended: e[
                                                              "isRecommended"])));
                                            }).toList()),
                                      ],
                                    )
                                  : Container(
                                      padding: const EdgeInsets.all(10),
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
                                                  color: const Color.fromARGB(
                                                      255, 237, 237, 237)),
                                            ),
                                            alignment: Alignment.center,
                                            child: const Icon(Icons.add),
                                          ),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          SmallText(text: "Register")
                                        ],
                                      ),
                                    );
                            }),
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: SingleChildScrollView(
                        physics: const AlwaysScrollableScrollPhysics(),
                        child: StreamBuilder(
                            stream: ProductsofThatBussiness(B.BussinessId),
                            builder: (context,
                                AsyncSnapshot<QuerySnapshot> snapshot) {
                              return snapshot.hasData
                                  ? Wrap(
                                      alignment: WrapAlignment.spaceBetween,
                                      children: snapshot.data!.docs.map((e) {
                                        return GestureDetector(
                                            onTap: () {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      ImageViewer(
                                                          imageUrl: e["image"]),
                                                ),
                                              );
                                            },
                                            child: Container(
                                              margin: const EdgeInsets.all(5),
                                              width: 100,
                                              height: 100,
                                              decoration: BoxDecoration(
                                                  image: DecorationImage(
                                                      image: NetworkImage(
                                                          e["image"]),
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
                                  : const Loading(
                                      message: "Fetching your products");
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
