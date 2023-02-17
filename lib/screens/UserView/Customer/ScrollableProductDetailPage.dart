// ignore_for_file: file_names, sized_box_for_whitespace
import 'package:flutter/material.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';
import 'package:spot_hub/configurations/AppColors.dart';
import 'package:spot_hub/configurations/BigText.dart';
import 'package:spot_hub/configurations/Dimensions.dart';
import 'package:spot_hub/configurations/SmallText.dart';
import 'package:spot_hub/models/Products/FoodItems.dart';
import 'package:spot_hub/widgets/Product/ProductTitleSection.dart';
import 'package:spot_hub/widgets/Product/ReviewWidget.dart';

class ScrollableProductDetailPage extends StatefulWidget {
  final int index;
  final FoodItem SelectedProduct;
  const ScrollableProductDetailPage(
      {super.key, this.index = 0, required this.SelectedProduct});

  @override
  State<ScrollableProductDetailPage> createState() => _ScrollableProductDetailPageState();
}

class _ScrollableProductDetailPageState extends State<ScrollableProductDetailPage> {
  bool isFavorite = false;

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
              preferredSize: Size.fromHeight(Dimensions.height10 * 12),
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
                    child: Container(
                      padding: EdgeInsets.all(Dimensions.height15),
                      child:
                      
                      ProductTitleSection(
                        text: widget.SelectedProduct.title,
                        NoofReviews: 5,
                        OverallRating: 5,
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
                            ? const Icon(Icons.favorite_border,size: 26,)
                            : const Icon(Icons.favorite,color: Colors.red,size: 30,),
                      ),
                    
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
              child: const Text("data"),
            )

                // Image.network(SelectedProduct.image)
                // Image.asset(
                //   'assets/image/foodhome2.jpg',
                //   width: double.maxFinite,
                //   fit: BoxFit.cover,
                // ),
                ),
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
                      tabs: [
                        const Tab(
                          //    icon: Icon(Icons.info_outline_rounded),
                          text: 'About',
                          //     child: SmallText(text: 'About',size: Dimensions.font15,color: AppColors.mainColor,)
                        ),
                        const Tab(
                          //     icon: Icon(Icons.reviews),
                          text: 'Reviews ( 5 )',
                          // child:
                          //    text:SmallText(text: 'tex',size: Dimensions.font15,color: AppColors.mainColor,),
                        ),
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
                      child: Container(
                        padding: EdgeInsets.only(
                            left: Dimensions.width10,
                            right: Dimensions.width10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: Dimensions.height20),
                            SmallText(
                              text: widget.SelectedProduct.description,
                              size: 15,
                            ),
                          ],
                        ),
                      ),
                    ),
                    ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: 5,
                        itemBuilder: (context, thisindex) {
                          return ReviewWidget(
                            Name: "John Doe",
                            Review: "Best of best",
                            stars: 5,
                            TimeStamp: DateTime.now().toString(),
                          );
                        }),
                  ],
                ),
              ),
            ),
          ),
        ]),
     
      ),

      // Navigation Same as the Product Detail Page
//       bottomNavigationBar: Container(
//         height: 100,
//         padding: EdgeInsets.only(
//             top: Dimensions.height20,
//             bottom: Dimensions.height20,
//             right: Dimensions.width20,
//             left: Dimensions.width20),
//         decoration: BoxDecoration(
//             boxShadow: const [
//               BoxShadow(
//                 color: Color.fromARGB(255, 215, 215, 215),
//                 blurRadius: 5,
//                 offset: Offset(0, 0),
//               ),
//             ],
//             color: Colors.white,
//             borderRadius: BorderRadius.only(
//               topLeft: Radius.circular(Dimensions.radius20),
//               topRight: Radius.circular(Dimensions.radius20),
//             )),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             // First Child - Quantity Box for Product | Parent : Bottom Bar Producvty Details
//             // Container(
//             //   alignment: Alignment.center,
//             //   padding: EdgeInsets.all(Dimensions.width10),
//             //   decoration: BoxDecoration(
//             //     color: const Color.fromARGB(255, 237, 237, 237),
//             //     borderRadius: BorderRadius.circular(Dimensions.radius20),
//             //   ),
//             //   child: Row(
//             //     children: [
//             //       // Minus Button to decrease quanity of product you are going to add to the cart
//             //       Container(
//             //           padding: const EdgeInsets.all(2),
//             //           decoration: BoxDecoration(
//             //             color: AppColors.PrimaryColor,
//             //             borderRadius:
//             //                 BorderRadius.circular(Dimensions.radius20),
//             //           ),
//             //           child: Icon(
//             //             Icons.remove,
//             //             color: Colors.white,
//             //             size: Dimensions.font20,
//             //           )),
//             //       SizedBox(width: Dimensions.width15),
//             //       // Qantity of product you are going to add to the cart
//             //       BigText(text: '1'),
//             //       SizedBox(width: Dimensions.width15),
//             //       // Plus Button to Increase quanity of product you are going to add to the cart
//             //       Container(
//             //           padding: const EdgeInsets.all(2),
//             //           decoration: BoxDecoration(
//             //             color: AppColors.PrimaryColor,
//             //             borderRadius:
//             //                 BorderRadius.circular(Dimensions.radius20),
//             //           ),
//             //           child: Icon(
//             //             Icons.add,
//             //             color: Colors.white,
//             //             size: Dimensions.font20,
//             //           ))
//             //     ],
//             //   ),
//             // ),

//             // SizedBox(width: Dimensions.width20),

// // Add to Cart Button
//             // Expanded(
//             //   child: Container(
//             //     alignment: Alignment.center,
//             //     padding: EdgeInsets.all(Dimensions.width10),
//             //     decoration: BoxDecoration(
//             //       color: AppColors.PrimaryColor,
//             //       borderRadius: BorderRadius.circular(Dimensions.radius20),
//             //     ),
//             //     child: BigText(
//             //       text: '\$150 - Add to Cart',
//             //       color: Colors.white,
//             //     ),
//             //   ),
//             // )

//           ],
//         ),
//       ),
    );
  }
}
