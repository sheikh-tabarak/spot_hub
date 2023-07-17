import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:spot_hub/configurations/AppColors.dart';
import 'package:spot_hub/configurations/BigText.dart';
import 'package:spot_hub/configurations/SmallText.dart';
import 'package:spot_hub/models/BusinessModels/Product.dart';
import 'package:spot_hub/models/UserModels/Notification.dart';
import 'package:spot_hub/models/UserModels/UserClass.dart';
import 'package:spot_hub/screens/UserLogin/Home/MainPage.dart';
import 'package:spot_hub/screens/UserLogin/User/ScrollableProductDetailPage.dart';
import 'package:spot_hub/screens/UserLogin/chat/ChatScreen.dart';
import 'package:spot_hub/widgets/others/PrimayButton.dart';

class Notifications extends StatefulWidget {
  final UserClass currentUser;

  const Notifications({
    super.key,
    required this.currentUser,
  });

  @override
  State<Notifications> createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  int _noOfNotication = 0;

  Product currentProduct = Product(
      BussinessId: "",
      Id: "",
      image: "",
      description: "",
      title: "",
      Category: "",
      Price: 0,
      rating: 0,
      reviews: 0,
      isRecommended: false);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  // Future getProducts(String id) async {
  //   try {
  //     await FirebaseFirestore.instance
  //         .collection('user')
  //         .doc(FirebaseAuth.instance.currentUser!.uid)
  //         .collection("bussiness")
  //         .doc("B_${FirebaseAuth.instance.currentUser!.uid}")
  //         .collection("products")
  //         .doc(id)
  //         .get()
  //         .then((e) {
  //       currentProduct = Product(
  //         BussinessId: e['BussinessId'],
  //         Category: e['Category'],
  //         Id: e['Id'],
  //         Price: e['Price'],
  //         description: e['description'],
  //         image: e['image'],
  //         isRecommended: e['isRecommended'],
  //         rating: e['rating'],
  //         reviews: e['reviews'],
  //         title: e['title'],
  //       );

  //       print(currentProduct.title);
  //     });
  //   } catch (e) {
  //     print(e);
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 221, 221, 221),
        appBar: AppBar(
          backgroundColor: AppColors.PrimaryColor,
          title: BigText(
            text: "Notifications",
            color: Colors.white,
          ),
          actions: [
            IconButton(
                onPressed: () async {
                  await deleteReadedNotifications();
                },
                icon: Icon(Icons.delete))
          ],
        ),
        body: StreamBuilder(
            stream: NotificationsofUser(widget.currentUser.UserId),
            builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.hasData) {
                if (snapshot.data!.docs.isNotEmpty) {
                  return ListView(
                    shrinkWrap: true,
                    children: snapshot.data!.docs
                        .map((e) => Container(
                              padding: EdgeInsets.all(10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // SmallText(text: "7 May"),
                                  Container(
                                    margin: const EdgeInsets.only(top: 10),
                                    decoration: const BoxDecoration(
                                      color: Colors.white,
                                    ),
                                    child: Column(
                                      children: [
                                        ListTile(
                                          onTap: e["ntype"] == "message"
                                              ? () {
                                                  Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              ChatScreen(
                                                                  ChatUserId: e[
                                                                      "fromuserId"])));
                                                }
                                              : () async {
                                                  // await getProducts(
                                                  //     e['ProductId']);

                                                  Future.delayed(
                                                      Duration(seconds: 4));

                                                  Fluttertoast.showToast(
                                                      msg:
                                                          "Network Connection error! Unable to open product page");

                                                  // Navigator.push(
                                                  //     context,
                                                  //     MaterialPageRoute(
                                                  //         builder: (context) =>
                                                  //            ));
                                                },
                                          leading: e["ntype"] == "message"
                                              ? Icon(Icons.message)
                                              : Icon(Icons.email),
                                          title: SmallText(
                                              text: e["ntype"] == "message"
                                                  ? "Someone sent you a message"
                                                  : "Someone mentioned you"),
                                          subtitle:
                                              SmallText(text: e["TimeStamp"]),
                                          trailing:
                                              Icon(Icons.arrow_forward_ios),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ))
                        .toList(),
                  );
                } else {
                  return Center(
                    child: Padding(
                      padding: const EdgeInsets.all(50.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.notifications_none,
                            size: 60,
                            color: AppColors.PrimaryColor,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          BigText(text: "No Notifications"),
                          SizedBox(
                            height: 10,
                          ),
                          SmallText(
                              iscentre: true,
                              text:
                                  "There is no notification right now.\n Refresh to and check back again"),
                          SizedBox(
                            height: 10,
                          ),
                          TextButton(
                              onPressed: () {
                                setState(() {
                                  print("Refreshed");
                                });
                              },
                              child: Text("Refresh"))
                        ],
                      ),
                    ),
                  );
                }
              } else {
                return Center(
                  child: Padding(
                    padding: const EdgeInsets.all(50.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.notifications_none,
                          size: 60,
                          color: AppColors.PrimaryColor,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        BigText(text: "No Notifications"),
                        SizedBox(
                          height: 10,
                        ),
                        SmallText(
                            iscentre: true,
                            text:
                                "There is no notification right now.\n Refresh to and check back again"),
                        SizedBox(
                          height: 10,
                        ),
                        TextButton(
                            onPressed: () {
                              setState(() {
                                print("Refreshed");
                              });
                            },
                            child: Text("Refresh"))
                      ],
                    ),
                  ),
                );
              }
            }));
  }
}
