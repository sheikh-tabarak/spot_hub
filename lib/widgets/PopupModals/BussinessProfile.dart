// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';
import 'package:spot_hub/configurations/AppColors.dart';
import 'package:spot_hub/configurations/BigText.dart';
import 'package:spot_hub/configurations/Dimensions.dart';
import 'package:spot_hub/configurations/SmallText.dart';
import 'package:spot_hub/models/UserModels/Bussiness.dart';

class BussinessProfile extends StatelessWidget {
  final Bussiness B;
   BussinessProfile({super.key, required this.B});

  @override
  Widget build(BuildContext context) {
   print('This is id : Bussiness Id');
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.all(0),
        child: DefaultTabController(
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
                                  BigText(text:B.BussinessName),
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
                                      SmallText(text: '( ${B.BussinessId} Reviews )')
                                    ],
                                  ),
                                ],
                              )
                            ],
                          )

                       

                          ),
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
                  //     height: double.maxFinite,
                  child: TabBarView(
                    children: [
                      
                      Center(
                          child: BigText(
                        text: 'This is Product Section',
                      )),
                       Center(
                          child: BigText(
                        text: 'This is Images Section',
                      )),
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
      ),
    );
  }
}