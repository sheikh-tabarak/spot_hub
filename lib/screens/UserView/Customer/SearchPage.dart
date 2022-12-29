import 'package:flutter/material.dart';
import 'package:spot_hub/configurations/AppColors.dart';
import 'package:spot_hub/configurations/Dimensions.dart';
import 'package:spot_hub/configurations/SmallText.dart';
import 'package:spot_hub/models/DummyData.dart';
import 'package:spot_hub/widgets/BoxedTextField.dart';
//import 'package:geolocator/geolocator.dart';

class SearchPage extends StatefulWidget {
  final String searchTitle;
  final int index;
  const SearchPage({super.key, this.index = 0, required this.searchTitle});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final duplicateItems = List<String>.generate(
      DummyProducts.length, (index) => DummyProducts[index].title);
  var items = <String>[];
  late TextEditingController textControtroller =
      TextEditingController(text: widget.searchTitle);
  List<int> filteredIndexes = <int>[];
  List<int> Previousindex = <int>[];

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
    TextEditingController locationController = TextEditingController();

    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
    //   physics:AlwaysScrollableScrollPhysics(),
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
                BoxedTextField(
                  TapAction: (value){
                    setState(() {
                       filterSearch(value);
                    },);
        
                  },
                    controller: textControtroller,
                    placeholder: 'Search your best Food',
                    icon: Icons.search),
        
                BoxedTextField(
                    TapAction: () {},
                    // onChange: (){},
                    controller: locationController,
                    placeholder: 'Location',
                    icon: Icons.pin_drop_outlined),
        
                TextButton(
                    onPressed: () => {
                          setState(() async {
                            locationController.text = "Garden Town, Gujranwala";
                          }),
                        },
                    child: Row(
                      //  crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.center_focus_strong,
                          color: Color.fromARGB(255, 0, 90, 163),
                          size: 16,
                        ),
                        SizedBox(
                          width: Dimensions.width5,
                        ),
                        SmallText(
                          text: "Use Current Location",
                          color: const Color.fromARGB(255, 0, 90, 163),
                        )
                      ],
                    )),
        
                // ContainList==true?
                ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
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
                                // minLeadingWidth: 50,
                                leading: 
                                Container(
                                  width: 50,
                                  // height: 50,
                                  decoration: 
                                  BoxDecoration(
                                    borderRadius: BorderRadius.all(Radius.circular(50)),
                                    image: DecorationImage(image: NetworkImage(DummyProducts[filteredIndexes.elementAt(index)].image),fit: BoxFit.cover
                                  ),
                                ),),
                               
                                // Image.network(
                                //     DummyProducts[filteredIndexes.elementAt(index)]
                                //         .image,),
                                title: Padding(
                                  padding: const EdgeInsets.only(bottom: 3),
                                  child: SmallText(size: 14,color: Colors.black,
                                      text: DummyProducts[
                                              filteredIndexes.elementAt(index)]
                                          .title),
                                ),
                                subtitle: 
                                SmallText(size: 11,color: Color.fromARGB(255, 163, 163, 163),
                                    text: DummyProducts[
                                            filteredIndexes.elementAt(index)].description),
                                trailing: SmallText(
                                  text: "\$ ${DummyProducts[
                                            filteredIndexes.elementAt(index)]
                                        .Price.toString()}",
                                  color: AppColors.PrimaryColor,
                                  weight: FontWeight.w800,
                                ),
                              ));
                      // :Text("")
                      // ;
                    }),
              ],
            ),
          ),
        ));
  }
}
