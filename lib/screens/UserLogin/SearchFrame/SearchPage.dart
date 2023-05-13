import 'package:flutter/material.dart';
import 'package:spot_hub/configurations/AppColors.dart';
import 'package:spot_hub/configurations/Dimensions.dart';
import 'package:spot_hub/configurations/SmallText.dart';
import 'package:spot_hub/models/DummyData.dart';
import 'package:spot_hub/screens/UserLogin/User/AddReview.dart';
import 'package:spot_hub/screens/UserLogin/SearchFrame/MainSearch.dart';
import 'package:spot_hub/screens/UserLogin/User/ScrollableProductDetailPage.dart';
//import 'package:geolocator/geolocator.dart';

class SearchPage extends StatefulWidget {
  final String searchTitle;
  final bool isSelection;
  final int index;

  const SearchPage(
      {super.key,
      this.index = 0,
      required this.searchTitle,
      this.isSelection = false});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  // List<String> StarRating = ["Any", "★ 3.0+", "★ 4.0+", "★ 5.0+"];
  // List<String> reviewCount = ["N/A", "10+", "50+", "100+"];
  // RangeValues _currentRangeValues = RangeValues(40, 80);

  final duplicateItems = List<String>.generate(
      DummyProducts.length, (index) => DummyProducts[index].title);
  var items = <String>[];
  late TextEditingController textControtroller =
      TextEditingController(text: widget.searchTitle);
  List<int> filteredIndexes = <int>[];
  List<int> Previousindex = <int>[];

  @override
  void initState() {
    for (var i = 0; i < DummyProducts.length; i++) {
      Previousindex.add(i);
    }
    filteredIndexes.clear();
    filteredIndexes.addAll(Previousindex);
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
    TextEditingController searchController = new TextEditingController();

    return Scaffold(
        backgroundColor: Colors.white,
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
                        controller: searchController,
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
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: AppColors.PrimaryColor,
                        borderRadius: const BorderRadius.only(
                            topRight: Radius.circular(10),
                            bottomRight: Radius.circular(10)),
                      ),
                      child: IconButton(
                        icon: const Icon(
                          Icons.search,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MainSearch(
                                      Results: searchController.text)));
                        },
                      ),
                    ), // IconButton widget
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

                Container(
                  // height: 10,
                  child: ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: filteredIndexes.length,
                      itemBuilder: (context, index) {
                        return
                            //   DummyProducts[filteredIndexes.elementAt(index)].username.contains(textControtroller.text)?
                            Container(
                                decoration: BoxDecoration(
                                    border: Border.symmetric(
                                        horizontal: BorderSide.lerp(
                                            const BorderSide(
                                                width: 0,
                                                color: Color.fromARGB(
                                                    255, 198, 198, 198)),
                                            const BorderSide(width: 1),
                                            0))),
                                child: ListTile(
                                  onTap: () => {
                                    widget.isSelection == true
                                        ? Navigator.pushReplacement(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) => AddReview(
                                                    ProductToReview:
                                                        DummyProducts[
                                                            filteredIndexes
                                                                .elementAt(
                                                                    index)])))
                                        : Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    ScrollableProductDetailPage(
                                                        SelectedProduct:
                                                            DummyProducts[
                                                                filteredIndexes
                                                                    .elementAt(
                                                                        index)])))
                                  },
                                  // minLeadingWidth: 50,
                                  leading: Container(
                                    width: 50,
                                    // height: 50,
                                    decoration: BoxDecoration(
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(50)),
                                      image: DecorationImage(
                                          image: NetworkImage(DummyProducts[
                                                  filteredIndexes
                                                      .elementAt(index)]
                                              .image),
                                          fit: BoxFit.cover),
                                    ),
                                  ),

                                  title: Padding(
                                    padding: const EdgeInsets.only(bottom: 3),
                                    child: SmallText(
                                        size: 14,
                                        color: Colors.black,
                                        text: DummyProducts[filteredIndexes
                                                .elementAt(index)]
                                            .title),
                                  ),
                                  subtitle: SmallText(
                                      size: 11,
                                      color: const Color.fromARGB(
                                          255, 163, 163, 163),
                                      text: DummyProducts[
                                              filteredIndexes.elementAt(index)]
                                          .description),
                                  trailing: SmallText(
                                    text:
                                        "\$ ${DummyProducts[filteredIndexes.elementAt(index)].Price.toString()}",
                                    color: AppColors.PrimaryColor,
                                    weight: FontWeight.w800,
                                  ),
                                ));
                        // :Text("")
                        // ;
                      }),
                ),
              ],
            ),
          ),
        ));
  }
}
