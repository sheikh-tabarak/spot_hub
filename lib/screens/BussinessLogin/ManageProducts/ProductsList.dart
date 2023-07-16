// ignore_for_file: file_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:spot_hub/configurations/BigText.dart';
import 'package:spot_hub/configurations/Dimensions.dart';
import 'package:spot_hub/configurations/SmallText.dart';
import 'package:spot_hub/models/BusinessModels/Bussiness.dart';
import 'package:spot_hub/models/BusinessModels/Product.dart';
import 'package:spot_hub/screens/BussinessLogin/ManageProducts/AddProduct.dart';
import 'package:spot_hub/screens/Loading.dart';
import 'package:spot_hub/screens/NoData.dart';
//import 'package:spot_hub/widgets/others/ItemCard.dart';

class ProductsList extends StatefulWidget {
  final Bussiness CurrentBussiness;
  const ProductsList({super.key, required this.CurrentBussiness});

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
                physics: const AlwaysScrollableScrollPhysics(),
                child: StreamBuilder(
                    stream: ProductsofBussiness(
                        widget.CurrentBussiness.BussinessId),
                    builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                      if (snapshot.hasData) {
                        if (snapshot.data!.docs.isNotEmpty) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: Dimensions.height10,
                              ),

                              ListView(
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  children: snapshot.data!.docs.map((e) {
                                    return Slidable(
                                      groupTag: '0',
                                      enabled: true,
                                      key: UniqueKey(),
                                      endActionPane: ActionPane(
                                        extentRatio: 0.45,
                                        motion: ScrollMotion(),
                                        children: [
                                          SlidableAction(
                                            onPressed: (context) async {
                                              setState(() {
                                                isLoading = true;
                                              });

                                              await deleteProduct(e["Id"]);

                                              //  Navigator.pop(context);

                                              setState(() {
                                                isLoading = false;
                                              });

                                              Fluttertoast.showToast(
                                                  msg:
                                                      "Product deleted Succesfully");
                                            },
                                            backgroundColor: Color(0xFFFE4A49),
                                            foregroundColor: Colors.white,
                                            icon: Icons.delete,
                                            label: 'Delete',
                                          ),
                                          SlidableAction(
                                            onPressed: (context) {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          AddProduct(
                                                            titleId: e["Id"],
                                                            title: e["title"],
                                                            description: e[
                                                                "description"],
                                                            Price: e["Price"],
                                                            image: e["image"],
                                                          )));
                                            },
                                            backgroundColor: Color.fromARGB(
                                                255, 57, 101, 184),
                                            foregroundColor: Colors.white,
                                            icon: Icons.edit,
                                            label: 'Edit',
                                          ),
                                        ],
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
                                    );

                                    // GestureDetector(
                                    //   onTap: () => {
                                    //     showModalBottomSheet(
                                    //         isDismissible: true,
                                    //         context: context,
                                    //         builder: (BuildContext bc) {
                                    //           return Container(
                                    //             decoration: const BoxDecoration(
                                    //                 borderRadius:
                                    //                     BorderRadius.only(
                                    //                         topLeft: Radius
                                    //                             .circular(15),
                                    //                         topRight:
                                    //                             Radius.circular(
                                    //                                 15))),
                                    //             child: Column(
                                    //               children: [
                                    //                 ListTile(
                                    //                   onTap: () {
                                    //                     Navigator.push(
                                    //                         context,
                                    //                         MaterialPageRoute(
                                    //                             builder:
                                    //                                 (context) =>
                                    //                                     AddProduct(
                                    //                                       titleId:
                                    //                                           e["Id"],
                                    //                                       title:
                                    //                                           e["title"],
                                    //                                       description:
                                    //                                           e["description"],
                                    //                                       Price:
                                    //                                           e["Price"],
                                    //                                       image:
                                    //                                           e["image"],
                                    //                                     )));
                                    //                   },
                                    //                   leading: Icon(Icons.edit),
                                    //                   title: Text('Edit'),
                                    //                 ),
                                    //                 ListTile(
                                    //                   onTap: () async {
                                    //                     showDialog(
                                    //                         context: context,
                                    //                         builder:
                                    //                             (context) =>
                                    //                                 Container(
                                    //                                   child: BigText(
                                    //                                       text:
                                    //                                           "text"),
                                    //                                 ));

                                    //                     setState(() {
                                    //                       isLoading = true;
                                    //                     });

                                    //                     await deleteProduct(
                                    //                         e["Id"]);

                                    //                     Navigator.pop(context);

                                    //                     setState(() {
                                    //                       isLoading = false;
                                    //                     });

                                    //                     Fluttertoast.showToast(
                                    //                         msg:
                                    //                             "Product deleted Succesfully");
                                    //                   },
                                    //                   leading:
                                    //                       Icon(Icons.delete),
                                    //                   title: Text('Delete'),
                                    //                 )
                                    //               ],
                                    //             ),
                                    //           );
                                    //         })
                                    //   },
                                    //   child:

                                    //   Container(
                                    //     decoration: BoxDecoration(
                                    //       borderRadius:
                                    //           BorderRadius.circular(20),
                                    //       color: Colors.white,
                                    //     ),
                                    //     child: ListTile(
                                    //       leading: CircleAvatar(
                                    //         backgroundImage:
                                    //             NetworkImage(e['image']),
                                    //         radius: 40,
                                    //       ),
                                    //       title:
                                    //           // BigText(text: "test"),
                                    //           BigText(
                                    //               text:
                                    //                   "${e['title'].toString().length > 22 ? e['title'].toString().substring(0, 22) : e['title']}"
                                    //               // .toString().substring(0, 22)}..."
                                    //               ),
                                    //       subtitle: SmallText(
                                    //           text:
                                    //               "${e['description'].toString().length > 70 ? e['description'].toString().substring(0, 70) : e['description']}"
                                    //           //.toString().substring(0, 70)}..."
                                    //           ),
                                    //       trailing:
                                    //           //BigText(text: "test")
                                    //           BigText(
                                    //         text: e['Price'].toString(),
                                    //         color: Colors.red,
                                    //       ),
                                    //     ),
                                    //   ),

                                    // );
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
        : const Loading(message: "Loading Products");
  }
}
