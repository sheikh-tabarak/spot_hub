import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:spot_hub/configurations/AppColors.dart';
import 'package:spot_hub/configurations/BigText.dart';
import 'package:spot_hub/configurations/Dimensions.dart';
import 'package:spot_hub/configurations/SmallText.dart';
import 'package:spot_hub/models/BusinessModels/Product.dart';
import 'package:spot_hub/models/DummyData.dart';
import 'package:spot_hub/models/Global/ProductsData.dart';
import 'package:spot_hub/screens/Loading.dart';
import 'package:spot_hub/screens/UserLogin/User/AddReview.dart';
import 'package:spot_hub/screens/UserLogin/SearchFrame/MainSearch.dart';
import 'package:spot_hub/screens/UserLogin/User/ScrollableProductDetailPage.dart';
import 'package:spot_hub/widgets/Product/ProductCard.dart';
import 'package:spot_hub/widgets/others/PrimayButton.dart';
//import 'package:geolocator/geolocator.dart';

class SearchPage extends StatefulWidget {
  String Results;
  final String searchTitle;
  final bool isSelection;
  final int index;

  SearchPage(
      {super.key,
      this.Results = "",
      this.index = 0,
      required this.searchTitle,
      this.isSelection = false});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController searchController = TextEditingController();

  // final duplicateItems = List<String>.generate(
  //     DummyProducts.length, (index) => DummyProducts[index].title);
  // var items = <String>[];
  // late TextEditingController textControtroller =
  //     TextEditingController(text: widget.searchTitle);
  // List<int> filteredIndexes = <int>[];
  // List<int> Previousindex = <int>[];

  // void filterSearch(String query) {
  //   //List<int> Previousindex = <int>[];
  //   // List<int> filteredIndexes = <int>[];

  //   if (query.isNotEmpty) {
  //     Previousindex.clear();
  //     for (int i = 0; i < DummyProducts.length; i++) {
  //       if (DummyProducts[i].title.contains(query) ||
  //           DummyProducts[i].description.contains(query)) {
  //         Previousindex.add(i);
  //       }
  //     }

  //     setState(() {
  //       filteredIndexes.clear();
  //       filteredIndexes.addAll(Previousindex);
  //     });

  //     print(filteredIndexes);
  //     print(filteredIndexes.length);

  //     return;
  //   } else {
  //     setState(() {
  //       filteredIndexes.clear();
  //       filteredIndexes.addAll(Previousindex);
  //     });
  //     print(filteredIndexes);
  //     print(filteredIndexes.length);
  //   }
  // }

//   void filterSearchResults(String query) {
//   List<int> dummySearchList = <int>[];
//   dummySearchList.addAll(duplicateItems);
//   if(query.isNotEmpty) {
//     List<String> dummyListData = <String>[];
//     for (var item in dummySearchList) {
//       if(item.contains(query)) {
//         dummyListData.add(item);
//       }
//     }
//     setState(
//       () {
//       items.clear();
//       items.addAll(dummyListData);
//     }
//     );
//     return;
//   }
//   else {
//     setState(() {
//       items.clear();
//       items.addAll(duplicateItems);
//     });
//   }
// }

  //bool ContainList=true;
// late Position position;

// void getLocation() async {
//     LocationPermission permission;
//     permission = await Geolocator.checkPermission();
//     permission = await Geolocator.requestPermission();
//     if( permission== LocationPermission.denied){
//          //nothing
//     }
//      position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
//   }

  @override
  Widget build(BuildContext context) {
    // textControtroller =
    //     TextEditingController(text: widget.searchTitle);

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
                // TextField(
                //   controller: textControtroller,
                //   onChanged: (value) {
                //     setState(() {
                //      filterSearch(value);
                //     });
                //     },
                // ),
                // BoxedTextField(
                //     TapAction: (value) {
                //       setState(
                //         () {
                //           filterSearch(value);
                //         },
                //       );
                //     },
                //     controller: textControtroller,
                //     placeholder: 'Search your best Food',
                //     icon: Icons.search),
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
                    // SizedBox widget
                    // Container(
                    //   margin: EdgeInsets.zero,
                    //   padding: const EdgeInsets.all(5),
                    //   decoration: BoxDecoration(
                    //     color: AppColors.PrimaryColor,
                    //     borderRadius: const BorderRadius.only(
                    //         topRight: Radius.circular(10),
                    //         bottomRight: Radius.circular(10)),
                    //   ),
                    //   child: IconButton(
                    //     icon: const Icon(
                    //       Icons.search,
                    //       color: Colors.white,
                    //     ),
                    //     onPressed: () {
                    //       Navigator.push(
                    //           context,
                    //           MaterialPageRoute(
                    //               builder: (context) => MainSearch(
                    //                   Results: searchController.text)));
                    //     },
                    //   ),
                    // ), // IconButton widget
                  ],
                ),
                // BoxedTextField(
                //     TapAction: () {},
                //     controller: locationController,
                //     placeholder: 'Location',
                //     icon: Icons.pin_drop_outlined),

                // TextButton(
                //     onPressed: () => {
                //           setState(() async {
                //             locationController.text = "Garden Town, Gujranwala";
                //           }),
                //         },
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //   children: [
                //     // Container(
                //     //   child: TextButton(
                //     //     onPressed: () => {
                //     //       setState(() async {
                //     //         locationController.text = "Garden Town, Gujranwala";
                //     //       }),
                //     //     },
                //     //     child: Row(
                //     //       children: [
                //     //         const Icon(
                //     //           Icons.center_focus_strong,
                //     //           color: Color.fromARGB(255, 0, 90, 163),
                //     //           size: 16,
                //     //         ),
                //     //         SizedBox(
                //     //           width: Dimensions.width5,
                //     //         ),
                //     //         SmallText(
                //     //           text: "Use Current Location",
                //     //           color: const Color.fromARGB(255, 0, 90, 163),
                //     //         )
                //     //       ],
                //     //     ),
                //     //   ),
                //     // ),
                //     TextButton(
                //         onPressed: () {
                //           showModalBottomSheet(
                //               enableDrag: true,
                //               shape: const RoundedRectangleBorder(
                //                 borderRadius: BorderRadius.vertical(
                //                   top: Radius.circular(15.0),
                //                 ),
                //               ),
                //               context: context,
                //               builder: (context) {
                //                 return
                //                  FilterView();

                //               });

                //         },
                //         child: Container(
                //           alignment: Alignment.centerRight,
                //           padding: const EdgeInsets.all(10),
                //           decoration: BoxDecoration(
                //             //  color: const Color.fromARGB(255, 224, 224, 224),
                //             borderRadius:
                //                 const BorderRadius.all(Radius.circular(5)),
                //             border: Border.all(color: AppColors.PrimaryColor),
                //           ),
                //           child: Row(
                //             mainAxisAlignment: MainAxisAlignment.end,
                //             children: [
                //               const Icon(
                //                 Icons.filter_list,
                //                 color: const Color(0xFFEF4C2F),
                //                 size: 16,
                //               ),
                //               SizedBox(
                //                 width: Dimensions.width5,
                //               ),
                //               SmallText(
                //                 text: "Filters",
                //                 color: AppColors.PrimaryColor,
                //               )
                //             ],
                //           ),
                //         )),
                //   ],
                // ),

                StreamBuilder(
                    stream: ProductsOfAllBussinesses(),
                    builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                      return snapshot.hasData
                          ? ListView(
                              padding: EdgeInsets.zero,
                              physics: NeverScrollableScrollPhysics(),
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
                                      margin:
                                          EdgeInsets.only(bottom: 5, top: 5),
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            width: 1,
                                            color: const Color.fromARGB(
                                                255, 224, 224, 224)),
                                        borderRadius: BorderRadius.all(
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
                                                          5,
                                                          //OverallRating.floor()
                                                          (index) => const Icon(
                                                                Icons.star,
                                                                color: Color
                                                                    .fromARGB(
                                                                        255,
                                                                        255,
                                                                        191,
                                                                        135),
                                                                size: 20,
                                                              )),
                                                    ),
                                                    Wrap(
                                                      children: List.generate(
                                                          e["rating"].floor(),
                                                          (index) => Icon(
                                                                Icons.star,
                                                                color: AppColors
                                                                    .PrimaryColor,
                                                                size: 20,
                                                              )),
                                                    ),
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

                                return SizedBox();
                                // if()
                              }).toList())
                          : Loading(message: "Fetching products data");
                      // Container(
                      //     padding: EdgeInsets.all(10),
                      //     child: Column(
                      //       crossAxisAlignment:
                      //           CrossAxisAlignment.center,
                      //       mainAxisAlignment:
                      //           MainAxisAlignment.center,
                      //       children: [
                      //         Container(
                      //           decoration: BoxDecoration(
                      //             borderRadius:
                      //                 BorderRadius.circular(50),
                      //             border: Border.all(
                      //                 width: 2.0,
                      //                 color: Color.fromARGB(
                      //                     255, 237, 237, 237)),
                      //           ),
                      //           alignment: Alignment.center,
                      //           child: Icon(Icons.add),
                      //         ),
                      //         SizedBox(
                      //           height: 5,
                      //         ),
                      //         SmallText(text: "Register")
                      //       ],
                      //     ),
                      //   );
                    }),

                // Container(
                //   // height: 10,
                //   child: ListView.builder(
                //       physics: const NeverScrollableScrollPhysics(),
                //       shrinkWrap: true,
                //       itemCount: filteredIndexes.length,
                //       itemBuilder: (context, index) {
                //         return
                //             //   DummyProducts[filteredIndexes.elementAt(index)].username.contains(textControtroller.text)?
                //             Container(
                //                 decoration: BoxDecoration(
                //                     border: Border.symmetric(
                //                         horizontal: BorderSide.lerp(
                //                             const BorderSide(
                //                                 width: 0,
                //                                 color: Color.fromARGB(
                //                                     255, 198, 198, 198)),
                //                             const BorderSide(width: 1),
                //                             0))),
                //                 child: ListTile(
                //                   onTap: () => {
                //                     widget.isSelection == true
                //                         ? Navigator.pushReplacement(
                //                             context,
                //                             MaterialPageRoute(
                //                                 builder: (context) => AddReview(
                //                                     ProductToReview:
                //                                         DummyProducts[
                //                                             filteredIndexes
                //                                                 .elementAt(
                //                                                     index)])))
                //                         : Navigator.push(
                //                             context,
                //                             MaterialPageRoute(
                //                                 builder: (context) =>
                //                                     ScrollableProductDetailPage(
                //                                         SelectedProduct:
                //                                             DummyProducts[
                //                                                 filteredIndexes
                //                                                     .elementAt(
                //                                                         index)])))
                //                   },
                //                   // minLeadingWidth: 50,
                //                   leading: Container(
                //                     width: 50,
                //                     // height: 50,
                //                     decoration: BoxDecoration(
                //                       borderRadius: const BorderRadius.all(
                //                           Radius.circular(50)),
                //                       image: DecorationImage(
                //                           image: NetworkImage(DummyProducts[
                //                                   filteredIndexes
                //                                       .elementAt(index)]
                //                               .image),
                //                           fit: BoxFit.cover),
                //                     ),
                //                   ),

                //                   title: Padding(
                //                     padding: const EdgeInsets.only(bottom: 3),
                //                     child: SmallText(
                //                         size: 14,
                //                         color: Colors.black,
                //                         text: DummyProducts[filteredIndexes
                //                                 .elementAt(index)]
                //                             .title),
                //                   ),
                //                   subtitle: SmallText(
                //                       size: 11,
                //                       color: const Color.fromARGB(
                //                           255, 163, 163, 163),
                //                       text: DummyProducts[
                //                               filteredIndexes.elementAt(index)]
                //                           .description),
                //                   trailing: SmallText(
                //                     text:
                //                         "\$ ${DummyProducts[filteredIndexes.elementAt(index)].Price.toString()}",
                //                     color: AppColors.PrimaryColor,
                //                     weight: FontWeight.w800,
                //                   ),
                //                 ));
                //         // :Text("")
                //         // ;
                //       }),

                // ),
              ],
            ),
          ),
        ));
  }
}
