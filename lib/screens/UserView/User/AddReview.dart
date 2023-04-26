// ignore_for_file: file_names, non_constant_identifier_names, unnecessary_new


import 'package:flutter/material.dart';
import 'package:spot_hub/configurations/AppColors.dart';
import 'package:spot_hub/configurations/BigText.dart';
import 'package:spot_hub/configurations/Dimensions.dart';
import 'package:spot_hub/configurations/SmallText.dart';
import 'package:spot_hub/models/Products/FoodItems.dart';
import 'package:spot_hub/screens/UserView/User/SearchPage.dart';
import 'package:spot_hub/widgets/others/PrimayButton.dart';
import 'package:spot_hub/widgets/others/RatingSlider.dart';
import 'package:spot_hub/widgets/others/UnderConstruction.dart';

class AddReview extends StatefulWidget {
  final FoodItem ProductToReview;
  const AddReview({super.key, required this.ProductToReview});

  @override
  State<AddReview> createState() => _AddReviewState();
}

class _AddReviewState extends State<AddReview> {

  List<String> products = [];

  late String SelectedProduct;
  //= products[1];

  @override
  void initState() {
    super.initState();
    // products.clear();

    // for (var i = 0; i < DummyProducts.length; i++) {
    //   products.add(DummyProducts[i].title);
    // }
    // SelectedProduct = products[1];
  }

  TextEditingController reviewController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(
              "assets/images/logo.png",
              width: 50,
              height: 50,
            ),
            BigText(
              text: "Post Review",
              color: AppColors.PrimaryColor,
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: SmallText(
                text: "Cancel",
                color: Colors.grey,
              ),
            )
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            // Drop Down list of Product, also need to uncomment the section in initia;izing state to get the data of all products 

            // DropdownButton(
            //   value: SelectedProduct,
            //   items: products.map((String e) {
            //     return DropdownMenuItem(
            //       value: e,
            //       child: Row(
            //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //         children: [
            //           Image(
            //             image: NetworkImage(
            //                 DummyProducts[products.indexOf(e)].image),
            //             width: 50,
            //             height: 50,
            //           ),
            //           Column(
            //             children: [
            //               BigText(text:e),
            //              // SmallText(text:DummyProducts[products.indexOf(e)].description)
            //             ],
            //           ),
            //           BigText(
            //            text: DummyProducts[products.indexOf(e)].Price.toString(),
            //            color: AppColors.PrimaryColor,
            //           )
            //         ],
            //       ),
            //     );
            //   }).toList(),

            //   icon: const Icon(Icons.keyboard_arrow_down),
            //   onChanged: (String? value) {
            //     setState(() {
            //       SelectedProduct = value.toString();
            //     });
            //   },
            // ),


 GestureDetector(
  onTap:() => {
   Navigator.push(context, MaterialPageRoute(builder: (context)=>const SearchPage(searchTitle: "",isSelection: true,)))
  },
   child: Container(
     margin: const EdgeInsets.only(top: 20,left: 20,right: 20),
     padding:EdgeInsets.all(5) ,
                        decoration: BoxDecoration(
                          border: Border.all(
                              width: 1,
                              color: const Color.fromARGB(255, 213, 213, 213)),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(5)),
                        ),
                        child: ListTile(
                          leading: Container(
                            width: 50,
                            decoration: BoxDecoration(
                              border: Border.all(
                                  width: 1,
                                  color:
                                      const Color.fromARGB(255, 213, 213, 213)),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(50)),
                              image: DecorationImage(
                                  image: NetworkImage(
                                      widget.ProductToReview.image),
                                  fit: BoxFit.cover),
                            ),
                          ),
                          title: Padding(
                            padding: const EdgeInsets.only(bottom: 3),
                            child: SmallText(
                                size: 14,
                                color: Colors.black,
                                text: widget.ProductToReview.title),
                          ),
                          subtitle: SmallText(
                              size: 11,
                              color: const Color.fromARGB(255, 163, 163, 163),
                              text: widget.ProductToReview.description),
                          trailing: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SmallText(
                                text: widget.ProductToReview.Price.toString(),
                                color: AppColors.PrimaryColor,
                                weight: FontWeight.w800,
                              ),
                            ],
                          ),
                        )),
 ),

           
            Container(
              padding: const EdgeInsets.only(left:20,right: 20,bottom: 10,top: 10),
              margin: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                  border: Border.all(
                      width: 1,
                      color: const Color.fromARGB(255, 213, 213, 213))),
              child: Column(
                children: [
                 
                  
                  Row(
                    children: [
                      BigText(
                        text: "Write a review",
                        color: AppColors.PrimaryColor,
                      ),
                    ],
                  ),
                  TextField(
                    controller: reviewController,
                    keyboardType: TextInputType.multiline,
                    minLines: 1,
                    maxLines: 6,
                    cursorColor: AppColors.PrimaryColor,
                    onChanged: (value) => {},
                    decoration: const InputDecoration(
                      hintStyle: TextStyle(
                          fontFamily: 'Poppins',
                          color: Color.fromARGB(255, 180, 180, 180)),
                      hintText:
                          "Doesn’t look like much when you walk past, but I was practically dying of hunger so I popped in. The definition of a hole-in-the-wall. I got the regular hamburger and wow…  there are no words. A classic burger done right. Crisp bun, juicy patty, stuffed with all the essentials (ketchup, shredded lettuce, tomato, and pickles). There’s about a million options available between the menu board and wall full of specials, so it can get a little overwhelming, but you really can’t go wrong. Not much else to say besides go see for yourself! You won’t be disappointed.",
                    ),
                  ),
                  RatingSlider(
                    RecordRating: (selectedStars) =>
                        {print("Rating 1: $selectedStars")},
                    title: "Taste:",
                  ),
                  RatingSlider(
                    RecordRating: (selectedStars) =>
                        {print("Rating 2: $selectedStars")},
                    title: "Serving:",
                  ),
                  RatingSlider(
                    RecordRating: (selectedStars) =>
                        {print("Rating 3: $selectedStars")},
                    title: "Presentation:",
                  ),
                  SizedBox(
                    height: Dimensions.height20,
                  ),
                  PrimaryButton(
                      TapAction: () {
                        showDialog(
                            context: context,
                            builder: (context) => UnderConstruction(message: "Review Module is Under Consturuction yet",));
                      },
                      text: "Publish Review",
                      color: AppColors.PrimaryColor,
                      icon: Icons.published_with_changes),
                  //  RatingBar.builder(itemBuilder: , onRatingUpdate: (value)=>{
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
