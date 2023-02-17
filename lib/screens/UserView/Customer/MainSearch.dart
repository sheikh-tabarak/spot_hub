import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:spot_hub/configurations/AppColors.dart';
import 'package:spot_hub/configurations/BigText.dart';
import 'package:spot_hub/configurations/SmallText.dart';
import 'package:spot_hub/widgets/PopupModals/FilterView.dart';
import 'package:spot_hub/widgets/Product/ProductCard.dart';

class MainSearch extends StatefulWidget {
  const MainSearch({super.key});

  @override
  State<MainSearch> createState() => _MainSearchState();
}

class _MainSearchState extends State<MainSearch> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: SmallText(
            text: "Searching \"Burger\"",
            size: 12,
            color: Colors.white,
          ),
          backgroundColor: AppColors.PrimaryColor,
        ),
        body: Column(
          children: [
            Container(
              margin: EdgeInsets.all(10),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
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
                                return 
                                 FilterView();              
                          
                              
                              });
                        

                      },
                      child: Container(
                        padding: EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          border: Border.all(
                              width: 1,
                              color: AppColors.PrimaryColor,),
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
                              Icon(Icons.filter_alt_outlined,color: AppColors.PrimaryColor,)
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
                                return 
                                 Container(

                                  padding: EdgeInsets.all(10),
                                   child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      BigText(text: "Sort"),

                                      SizedBox(height: 10,),
                                      SmallText(text: "Sort by price"),
                                       SmallText(text: "Sort by rating")

                                    ],
                                 
                                   ),
                                 );
                                            
                          
                              
                              });
                        
                      },
                      child: Container(
                          padding: EdgeInsets.all(15),
                          decoration: BoxDecoration(
                            border: Border.all(
                                width: 1,
                                color: AppColors.PrimaryColor),
                            borderRadius: BorderRadius.only(
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
                              Icon(Icons.sort,color: AppColors.PrimaryColor,)
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
  
  child: Column(
    children: [
ProductCard(),
ProductCard(),
ProductCard(),
ProductCard(),
ProductCard(),
ProductCard(),
    ],
  ),
)
,
)



          ],
        ) // Container widget
        );
  }
}
