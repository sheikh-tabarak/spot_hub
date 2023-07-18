// ignore_for_file: use_build_context_synchronously

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:spot_hub/configurations/AppColors.dart';
import 'package:spot_hub/configurations/BigText.dart';
import 'package:spot_hub/configurations/SmallText.dart';
import 'package:spot_hub/models/BusinessModels/Product.dart';
import 'package:spot_hub/models/UserModels/Notification.dart';
import 'package:spot_hub/models/UserModels/UserClass.dart';
import 'package:spot_hub/screens/UserLogin/home/MainPage.dart';
import 'package:spot_hub/screens/UserLogin/nav_search/MainSearch.dart';
import 'package:spot_hub/screens/UserLogin/chat/ChatScreen.dart';
import 'package:spot_hub/widgets/primary_widgets/PrimayButton.dart';

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

  Product currentProduct = const Product(
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 221, 221, 221),
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
                icon: const Icon(Icons.delete))
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
                        .map((e) => Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // SmallText(text: "7 May"),
                                Container(
                                  padding: const EdgeInsets.only(
                                      top: 10, bottom: 10),
                                  // margin: const EdgeInsets.only(top: 10),
                                  decoration: const BoxDecoration(
                                    color:
                                        // e['isRead'] == false
                                        //  ? Color.fromARGB(255, 255, 235, 206)
                                        Colors.white,
                                  ),
                                  child: Column(
                                    children: [
                                      ListTile(
                                        onTap: e["ntype"] == "message"
                                            ? () async {
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            ChatScreen(
                                                                ChatUserId: e[
                                                                    "fromuserId"])));
                                                await ReadThatNotfications(
                                                    e.id);
                                              }
                                            : () async {
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            MainSearch(
                                                              isLoggedIn: true,
                                                              Results: e[
                                                                  "ProductId"],
                                                            )));

                                                await ReadThatNotfications(
                                                    e.id);
                                              },
                                        leading: Column(
                                          children: [
                                            e["ntype"] == "message"
                                                ? Icon(
                                                    Icons.message,
                                                    color:
                                                        AppColors.PrimaryColor,
                                                  )
                                                : Icon(
                                                    Icons.email,
                                                    color:
                                                        AppColors.PrimaryColor,
                                                  ),
                                            const SizedBox(
                                              height: 5,
                                            ),
                                            SmallText(
                                                text: DateFormat("HH:mm")
                                                    .format(DateTime.parse(
                                                        e['TimeStamp']
                                                            .toString())))
                                          ],
                                        ),
                                        title: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            SmallText(
                                              iscentre: false,
                                              text: e["ntype"] == "message"
                                                  ? "Someone sent you a message"
                                                  : "Someone mentioned you",
                                              color: AppColors.PrimaryColor,
                                            ),
                                            const SizedBox(
                                              height: 5,
                                            )
                                          ],
                                        ),
                                        subtitle: SmallText(
                                          text: e["ntype"] == "message"
                                              ? "Check out your inbox, you got a message from one of your friend"
                                              : "Here is a suggestion for you as someone mentioned your while reviewing a product",
                                          size: 12,
                                        ),
                                        trailing: e['isRead'] == false
                                            ? Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Icon(
                                                    Icons.circle,
                                                    color:
                                                        AppColors.PrimaryColor,
                                                    size: 10,
                                                  ),
                                                ],
                                              )
                                            : const SizedBox(),
                                      )
                                    ],
                                  ),
                                ),
                              ],
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
                          const SizedBox(
                            height: 10,
                          ),
                          BigText(text: "No Notifications"),
                          const SizedBox(
                            height: 10,
                          ),
                          SmallText(
                              iscentre: true,
                              text:
                                  "There is no notification right now.\n Refresh the page and check back again"),
                          const SizedBox(
                            height: 10,
                          ),
                          TextButton(
                              onPressed: () {
                                setState(() {
                                  print("Refreshed");
                                });
                              },
                              child: const Text("Refresh"))
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
                        const SizedBox(
                          height: 10,
                        ),
                        BigText(text: "No Notifications"),
                        const SizedBox(
                          height: 10,
                        ),
                        SmallText(
                            iscentre: true,
                            text:
                                "There is no notification right now.\n Refresh to and check back again"),
                        const SizedBox(
                          height: 10,
                        ),
                        TextButton(
                            onPressed: () {
                              setState(() {
                                print("Refreshed");
                              });
                            },
                            child: const Text("Refresh"))
                      ],
                    ),
                  ),
                );
              }
            }));
  }
}
