import 'package:flutter/material.dart';
import 'package:spot_hub/configurations/AppColors.dart';
import 'package:spot_hub/configurations/BigText.dart';
import 'package:spot_hub/configurations/Dimensions.dart';
import 'package:spot_hub/configurations/SmallText.dart';
import 'package:spot_hub/widgets/PopupModals/ProductContact.dart';
import 'package:spot_hub/widgets/Product/ProductTitleSection.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(5)),
          border:
              Border.all(width: 1, color: Color.fromARGB(255, 205, 205, 205))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            leading: Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  image: DecorationImage(
                      image: AssetImage("assets/images/pizza-background.jpg"),
                      fit: BoxFit.cover)),
            ),
            title: BigText(text: "Product Title"),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Wrap(
                      children: List.generate(
                          5,
                          //OverallRating.floor()
                          (index) => Icon(
                                Icons.star,
                                color: AppColors.PrimaryColor,
                                size: 20,
                              )),
                    ),
                    SizedBox(
                      width: Dimensions.height10,
                    ),
                    SmallText(text: "4.8"),
                    const SizedBox(
                      width: 5,
                    ),
                    SmallText(text: '| '),
                    SmallText(text: "42"),
                    const SizedBox(
                      width: 5,
                    ),
                    SmallText(text: 'Reviews'),
                  ],
                ),
                SizedBox(
                  height: Dimensions.height5,
                ),
                SmallText(text: "Resturant Name"),
              ],
            ),
          ),

          //  SizedBox(height: 15,),
          Container(
            decoration: const BoxDecoration(
                // border: Border(top: BorderSide(width: 1, color: Color.fromARGB(255, 212, 212, 212)))
                ),
            padding: EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SmallText(text: "Fast Food"),
                Container(
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Color.fromARGB(255, 255, 230, 209)),
                  child: SmallText(
                    text: "Recommended",
                  ),
                )
              ],
            ),
          ),
          //  SizedBox(height: 10,),

          Container(
            decoration: const BoxDecoration(
                border: Border(
                    top: BorderSide(
                        width: 1, color: Color.fromARGB(255, 212, 212, 212)))),
            padding: EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
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
                          return Container(
                              padding: EdgeInsets.all(10),
                              child: ProductContact(
                                Email: 'bussiness@email.com',
                                Phone: "+1 234 5678 90",
                                website: "thisbussiness.com",
                              ));
                        });
                  },
                  child: Row(
                    children: const [
                      Icon(
                        Icons.web,
                        size: 16,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Icon(Icons.mail, size: 16),
                      SizedBox(
                        width: 10,
                      ),
                      Icon(Icons.phone, size: 16),
                    ],
                  ),
                ),

                //             Row(children: [
                // Icon(Icons.pin_drop),
                // SmallText(text: "Gujranwala"),
                //             ],),

                Row(
                  children: [
                    // Icon(Icons.pin_drop),
                    SmallText(text: "Gujranwala"),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
