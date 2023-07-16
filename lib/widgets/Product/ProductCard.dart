import 'package:flutter/material.dart';
import 'package:spot_hub/configurations/AppColors.dart';
import 'package:spot_hub/configurations/BigText.dart';
import 'package:spot_hub/configurations/Dimensions.dart';
import 'package:spot_hub/configurations/SmallText.dart';
import 'package:spot_hub/models/DummyData.dart';
import 'package:spot_hub/models/BusinessModels/Product.dart';
import 'package:spot_hub/models/BusinessModels/Bussiness.dart';
import 'package:spot_hub/models/Global/ProductsData.dart';
import 'package:spot_hub/screens/UserLogin/User/ScrollableProductDetailPage.dart';
import 'package:spot_hub/widgets/PopupModals/BussinessProfile.dart';
import 'package:spot_hub/widgets/PopupModals/ProductContact.dart';
import 'package:spot_hub/widgets/Product/ProductTitleSection.dart';

class ProductCard extends StatefulWidget {
  final bool isLoggedin;
  final Product products;
  //final Bussiness bussiness;

  ProductCard({
    required this.isLoggedin,
    super.key,
    required this.products,
  });

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  Bussiness CurrentBussiness = Bussiness(
      BussinessId: "",
      BussinessImageUrl: "",
      BussinessName: "",
      BussinessEmail: "",
      BussinessCity: "",
      BussinessAddress: "",
      BussinessPhone: "",
      BussinessType: "",
      BussinessWebsite: "",
      Reports: 0);

  @override
  void initState() {
    BussinessOfProduct(widget.products.BussinessId).then((value) {
      setState(() {
        CurrentBussiness = Bussiness(
          BussinessId: value.BussinessId,
          BussinessName: value.BussinessName,
          BussinessImageUrl: value.BussinessImageUrl,
          BussinessEmail: value.BussinessEmail,
          BussinessAddress: value.BussinessAddress,
          BussinessCity: value.BussinessCity,
          BussinessPhone: value.BussinessPhone,
          BussinessType: value.BussinessType,
          BussinessWebsite: value.BussinessWebsite,
          Reports: value.Reports,
        );
      });
    });
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ScrollableProductDetailPage(
                    isLoggedin: widget.isLoggedin,
                    SelectedProduct: widget.products)));
      },
      child: Container(
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: const BorderRadius.all(Radius.circular(5)),
            border: Border.all(
                width: 1, color: const Color.fromARGB(255, 205, 205, 205))),
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
                        image: NetworkImage(widget.products.image),
                        fit: BoxFit.cover)),
              ),
              title: BigText(text: widget.products.title),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Stack(
                        children: [
                          Wrap(
                            children: List.generate(
                                5,
                                //OverallRating.floor()
                                (index) => const Icon(
                                      Icons.star,
                                      color: Color.fromARGB(255, 255, 191, 135),
                                      size: 20,
                                    )),
                          ),
                          Wrap(
                            children: List.generate(
                                widget.products.rating.floor(),
                                (index) => Icon(
                                      Icons.star,
                                      color: AppColors.PrimaryColor,
                                      size: 20,
                                    )),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: Dimensions.height10,
                      ),
                      SmallText(text: widget.products.rating.toString()),
                      const SizedBox(
                        width: 5,
                      ),
                      SmallText(text: '| '),
                      SmallText(text: widget.products.reviews.toString()),
                      const SizedBox(
                        width: 5,
                      ),
                      SmallText(text: 'Reviews'),
                    ],
                  ),
                  SizedBox(
                    height: Dimensions.height5,
                  ),
                  GestureDetector(
                    onTap: () {
                      showModalBottomSheet(
                          isScrollControlled: true,
                          enableDrag: true,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(15.0),
                            ),
                          ),
                          context: context,
                          builder: (context) {
                            return Container(
                                // padding: const EdgeInsets.all(10),
                                child: BussinessProfile(
                              isLoggedIn: widget.isLoggedin,
                              B: CurrentBussiness,
                            ));
                          });
                    },
                    child: SmallText(
                      text: CurrentBussiness.BussinessName,
                    ),
                  ),
                ],
              ),
            ),

            //  SizedBox(height: 15,),
            Container(
              decoration: const BoxDecoration(),
              padding: const EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SmallText(text: widget.products.Category),
                  widget.products.isRecommended == true
                      ? Container(
                          // width: ==true?,
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: const Color.fromARGB(255, 255, 230, 209)),
                          child: SmallText(
                            text: "Recommended",
                          ),
                        )
                      : SizedBox()
                ],
              ),
            ),
            //  SizedBox(height: 10,),

            Container(
              decoration: const BoxDecoration(
                  border: Border(
                      top: BorderSide(
                          width: 1,
                          color: Color.fromARGB(255, 212, 212, 212)))),
              padding: const EdgeInsets.all(10),
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
                                padding: const EdgeInsets.all(10),
                                child: ProductContact(
                                  BussinessName:
                                      CurrentBussiness.BussinessName == ""
                                          ? "N/A"
                                          : CurrentBussiness.BussinessName,
                                  Email: CurrentBussiness.BussinessEmail == ""
                                      ? "N/A"
                                      : CurrentBussiness.BussinessEmail,
                                  Phone: CurrentBussiness.BussinessPhone == ""
                                      ? "N/A"
                                      : CurrentBussiness.BussinessPhone,
                                  website:
                                      CurrentBussiness.BussinessWebsite == ""
                                          ? "N/A"
                                          : CurrentBussiness.BussinessWebsite,
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
                      SmallText(text: CurrentBussiness.BussinessCity),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
