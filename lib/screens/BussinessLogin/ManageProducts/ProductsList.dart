// ignore_for_file: file_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:spot_hub/configurations/BigText.dart';
import 'package:spot_hub/configurations/Dimensions.dart';
import 'package:spot_hub/configurations/SmallText.dart';
import 'package:spot_hub/models/BusinessModels/Product.dart';
import 'package:spot_hub/screens/BussinessLogin/ManageProducts/AddProduct.dart';
import 'package:spot_hub/screens/Loading.dart';
import 'package:spot_hub/screens/NoData.dart';
//import 'package:spot_hub/widgets/others/ItemCard.dart';

class ProductsList extends StatefulWidget {
  const ProductsList({super.key});

  @override
  State<ProductsList> createState() => _ProductsListState();
}

class _ProductsListState extends State<ProductsList> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return isLoading == false
        ? Scaffold(
            body: SingleChildScrollView(
                physics: AlwaysScrollableScrollPhysics(),
                child: StreamBuilder(
                    stream: ProductsofBussiness(),
                    builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                      if (snapshot.hasData) {
                        if (snapshot.data!.docs.isNotEmpty) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: Dimensions.height10,
                              ),

                              //   BigText(text: 'This is Resturant Items', color: AppColors.PrimaryColor),

                              ListView(
                                  shrinkWrap: true,
                                  physics: NeverScrollableScrollPhysics(),
                                  children: snapshot.data!.docs.map((e) {
                                    // itemBuilder: (context, index) {
                                    return
                                        // ListTile(
                                        //   title: BigText(text: e["Price"].toString(), color: Colors.black,),
                                        // );
                                        GestureDetector(
                                      onTap: () => {
                                        showModalBottomSheet(
                                            context: context,
                                            builder: (BuildContext bc) {
                                              return Container(
                                                decoration: const BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.only(
                                                            topLeft: Radius
                                                                .circular(15),
                                                            topRight:
                                                                Radius.circular(
                                                                    15))),
                                                child: Column(
                                                  children: [
                                                    ListTile(
                                                      onTap: () {
                                                        Navigator.push(
                                                            context,
                                                            MaterialPageRoute(
                                                                builder:
                                                                    (context) =>
                                                                        AddProduct(
                                                                          titleId:
                                                                              e["Id"],
                                                                          title:
                                                                              e["title"],
                                                                          description:
                                                                              e["description"],
                                                                          Price:
                                                                              e["Price"],
                                                                          image:
                                                                              e["image"],
                                                                        )));
                                                      },
                                                      leading: Icon(Icons.edit),
                                                      title: Text('Edit'),
                                                    ),
                                                    ListTile(
                                                      onTap: () async {
                                                        setState(() {
                                                          isLoading = true;
                                                        });

                                                        await deleteProduct(
                                                            e["Id"]);

                                                        setState(() {
                                                          isLoading = false;
                                                        });

                                                        Fluttertoast.showToast(
                                                            msg:
                                                                "Product deleted Succesfully");
                                                      },
                                                      leading:
                                                          Icon(Icons.delete),
                                                      title: Text('Delete'),
                                                    )
                                                  ],
                                                ),
                                              );
                                            })
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          color: Colors.white,
                                        ),
                                        child: ListTile(
                                          leading: CircleAvatar(
                                            backgroundImage:
                                                NetworkImage(e['image']),
                                            radius: 40,
                                          ),
                                          title:
                                              // BigText(text: "test"),
                                              BigText(
                                                  text:
                                                      "${e['title'].toString().length > 22 ? e['title'].toString().substring(0, 22) : e['title']}"
                                                  // .toString().substring(0, 22)}..."
                                                  ),
                                          subtitle: SmallText(
                                              text:
                                                  "${e['description'].toString().length > 70 ? e['description'].toString().substring(0, 70) : e['description']}"
                                              //.toString().substring(0, 70)}..."
                                              ),
                                          trailing:
                                              //BigText(text: "test")
                                              BigText(
                                            text: e['Price'].toString(),
                                            color: Colors.red,
                                          ),
                                        ),
                                      ),
                                    );
                                  }).toList())
                              // : Center(
                              //     child: BigText(
                              //         text:
                              //             "Oho, Seems there is no product added yet"),
                              //   )
                            ],
                          );
                        } else {
                          return NoData(
                            ImageLink: "assets/images/noproductsyet.png",
                            title: "No Products yet",
                            subtitle:
                                "This store have no products yet,Click the plus icon on upper right cornet to add new product",
                          );
                        }
                      } else {
                        return NoData(
                          ImageLink: "assets/images/noproductsyet.png",
                          title: "NoProducts yet",
                          subtitle:
                              "This store have no products yet,Click the plus icon on upper right cornet to add new product",
                        );
                      }
                    })),
          )
        : Loading(message: "Loading Products");
  }
}
