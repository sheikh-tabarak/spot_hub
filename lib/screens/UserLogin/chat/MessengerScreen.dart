import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spot_hub/configurations/AppColors.dart';
import 'package:spot_hub/configurations/BigText.dart';
import 'package:spot_hub/configurations/Dimensions.dart';
import 'package:spot_hub/configurations/SmallText.dart';
import 'package:spot_hub/models/Chat/ChatMessages.dart';
import 'package:spot_hub/models/UserModels/UserClass.dart';
import 'package:spot_hub/screens/Loading.dart';
import 'package:spot_hub/screens/UserLogin/User/SpotFlicks/spot_flicks.dart';
import 'package:spot_hub/screens/UserLogin/chat/ChatScreen.dart';
import 'package:spot_hub/widgets/Team/MemberDetails.dart';
import 'package:intl/intl.dart';

class MessengerScreen extends StatefulWidget {
  const MessengerScreen({super.key});

  @override
  State<MessengerScreen> createState() => _MessengerScreenState();
}

class _MessengerScreenState extends State<MessengerScreen> {
  // Future<String> getNameofUser(id)  async {
  //   getSpecificUserData(id).then((value) {
  //     //  setState(() {
  //       String name="";

  //       name=value.username.toString();
  //     return name;

  //     // imageAddress=value.image.toString();
  //   });
  // }

  String _name = "Spothub user";
  int FriendShipStatus = 0;
  final DateFormat Dateformatter = DateFormat('HH:mm');
  // final DateFormat InitiateDateFormat = DateFormat('HH:mm');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.PrimaryColor,
        title: BigText(
          text: "Chat",
          color: Colors.white,
        ),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: ((context) => SpotFlicks())));
              },
              icon: Icon(Icons.movie))
        ],
      ),
      body: Column(children: [
        const SizedBox(
          height: 15,
        ),
        Container(
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.only(left: Dimensions.width15),
          child: SmallText(
            text: "ALL USERS",
            iscentre: false,
          ),
        ),
        Container(
          alignment: Alignment.centerLeft,
          margin: const EdgeInsets.symmetric(vertical: 3.0),
          height: 110.0,
          child: StreamBuilder(
              stream: SpotHubUsers(),
              builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                return snapshot.hasData
                    ? ListView(
                        shrinkWrap: true,
                        // This next line does the trick.
                        scrollDirection: Axis.horizontal,
                        children: snapshot.data!.docs.map((e) {
                          // if()

                          return GestureDetector(
                            onTap: () {
                              showModalBottomSheet(
                                  enableDrag: true,
                                  context: context,
                                  shape: const RoundedRectangleBorder(
                                    // <-- SEE HERE
                                    borderRadius: BorderRadius.vertical(
                                      top: Radius.circular(25.0),
                                    ),
                                  ),
                                  builder: (BuildContext bc) {
                                    return
                                        //Text(e["PhoneNo"]);
                                        MemberDetails(
                                            Detailsof: "Profile",
                                            Link: NetworkImage(e["image"]),
                                            title: e["username"],
                                            role: e["PhoneNo"],
                                            post: e["IsBussiness"] == true
                                                ? "Bussiness"
                                                : "User",
                                            isCentral: false,
                                            phoneno: e["UserId"],
                                            email: e["email"],
                                            portfolio: "",
                                            isPortfolio: false,
                                            isChat: FriendShipStatus == 2
                                                ? true
                                                : false,
                                            desc: e["Address"]);
                                  });

                              // if( e["UserId"]==FirebaseAuth.instance.currentUser!.uid)
                              // {}
                              // else{

                              // Navigator.push(
                              //     context,
                              //     MaterialPageRoute(
                              //         builder: ((context) => ChatScreen(
                              //             ChatUserId: e["UserId"],
                              //             InitiateDate:
                              //                 Timestamp.now().toString()
                              //             //   message: "Intiating Chat..."

                              //             ))));
                              // }
                            },
                            child: e["UserId"] !=
                                    FirebaseAuth.instance.currentUser!.uid
                                ? Container(
                                    padding: EdgeInsets.all(10),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        CircleAvatar(
                                            radius: 30,
                                            backgroundImage:
                                                NetworkImage(e['image'])
                                            //  AssetImage(),
                                            ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        SmallText(text: e['username'])
                                      ],
                                    ),
                                  )
                                : SizedBox(),
                          );
                        }).toList())
                    : Container(
                        padding: EdgeInsets.all(10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                border: Border.all(
                                    width: 2.0,
                                    color: Color.fromARGB(255, 237, 237, 237)),
                              ),
                              alignment: Alignment.center,
                              child: Icon(Icons.add),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            SmallText(text: "Register")
                          ],
                        ),
                      );
              }),
        ),
        const SizedBox(
          height: 5,
        ),
        Container(
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.only(left: Dimensions.width15),
          child: SmallText(
            text: "CHATS",
            iscentre: false,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: 3.0),
            constraints: BoxConstraints(minHeight: 100, maxHeight: 500),
            child: StreamBuilder(
                stream: ChatInitiatedUsers(),
                builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                  // if (snapshot.connectionState == ConnectionState.waiting) {
                  //   return Center(
                  //     child:
                  //         CircularProgressIndicator(), // or the data you want to show while loading...
                  //   );
                  // }

                  // if (snapshot.data!.docs.isEmpty) {
                  //   return Column(
                  //     mainAxisAlignment: MainAxisAlignment.center,
                  //     crossAxisAlignment: CrossAxisAlignment.center,
                  //     children: [
                  //       Icon(
                  //         Icons.hourglass_empty,
                  //         size: 50,
                  //         color: AppColors.PrimaryColor,
                  //       ),
                  //       SizedBox(
                  //         height: 20,
                  //       ),
                  //       BigText(text: "No Chats"),
                  //     ],
                  //   );
                  // } else {
                  return snapshot.hasData
                      ? ListView(
                          scrollDirection: Axis.vertical,
                          children: snapshot.data!.docs.map(
                            (e) {
                              /// String name="Spothub user";
                              String imageAddress;

                              return GestureDetector(
                                onTap: () async {
                                  await readAllMessages(e["ChatUserId"]);
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: ((context) => ChatScreen(
                                                ChatUserId: e["ChatUserId"],
                                              ))));
                                },
                                child: Container(
                                  padding: EdgeInsets.only(bottom: 5),
                                  decoration: BoxDecoration(
                                    border: Border(
                                      // top: BorderSide(width: 16.0, color: Colors.lightBlue.shade600),
                                      bottom: BorderSide(
                                          width: 2.0,
                                          color: Color.fromARGB(
                                              255, 237, 237, 237)),
                                    ),
                                  ),
                                  //  padding: EdgeInsets.all(10),
                                  child: ListTile(
                                    leading: CircleAvatar(
                                        radius: 30,
                                        backgroundImage:
                                            NetworkImage(e["ChatUserimage"])),
                                    // SizedBox(height: 5,),
                                    title: BigText(text: e["ChatUsername"]),
                                    subtitle:
                                        SmallText(text: e["LatestMessage"]),
                                    trailing: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      //   mainAxisAlignment: ma,
                                      children: [
                                        SmallText(
                                          text: Dateformatter.format(
                                              DateTime.parse(e["initiateTime"]
                                                  .toString())),

                                          //   "",
                                          //DateFormat DateTime.parse(e["initiateTime"].toString()),
                                          color: Colors.grey,
                                        ),
                                        e["unReadMessages"] == 0
                                            ? SizedBox(
                                                height: 1,
                                              )
                                            : Container(
                                                alignment: Alignment.center,
                                                width: 30,
                                                height: 30,
                                                padding:
                                                    const EdgeInsets.all(5),
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            50),
                                                    color:
                                                        AppColors.PrimaryColor),
                                                child: SmallText(
                                                  text: e["unReadMessages"]
                                                      .toString(),
                                                  color: Colors.white,
                                                ),
                                              )
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          ).toList())
                      : Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.hourglass_empty,
                              size: 50,
                              color: AppColors.PrimaryColor,
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            BigText(text: "No Chats"),
                          ],
                        );
                }),
          ),
        ),
      ]),
      // Container(
      //   margin: const EdgeInsets.symmetric(vertical: 3.0),
      //   height: 80.0,
      //   child: ListView(
      //     // This next line does the trick.
      //     scrollDirection: Axis.vertical,
      //     children: <Widget>[
      //       Container(
      //         padding: EdgeInsets.only(bottom: 5),
      //         decoration: BoxDecoration(
      //           border: Border(
      //             // top: BorderSide(width: 16.0, color: Colors.lightBlue.shade600),
      //             bottom: BorderSide(
      //                 width: 2.0,
      //                 color: Color.fromARGB(255, 237, 237, 237)),
      //           ),
      //         ),
      //         //  padding: EdgeInsets.all(10),
      //         child: ListTile(
      //           leading: CircleAvatar(
      //             radius: 30,
      //             backgroundImage: AssetImage("assets/images/arhumm3.jpg"),
      //           ),
      //           // SizedBox(height: 5,),
      //           title: BigText(text: "Arhum "),
      //           subtitle: SmallText(text: "Chat with Arhum "),
      //           trailing: Column(
      //             //   mainAxisAlignment: ma,
      //             children: [
      //               SmallText(
      //                 text: "11:00PM",
      //                 color: Colors.grey,
      //               ),
      //               Container(
      //                 alignment: Alignment.center,
      //                 width: 30,
      //                 height: 30,
      //                 padding: EdgeInsets.all(5),
      //                 decoration: BoxDecoration(
      //                     borderRadius: BorderRadius.circular(50),
      //                     color: AppColors.PrimaryColor),
      //                 child: SmallText(
      //                   text: "99+",
      //                   color: Colors.white,
      //                 ),
      //               )
      //             ],
      //           ),
      //         ),
      //       ),
      //       Container(
      //         padding: EdgeInsets.only(bottom: 5),
      //         decoration: BoxDecoration(
      //           border: Border(
      //             // top: BorderSide(width: 16.0, color: Colors.lightBlue.shade600),
      //             bottom: BorderSide(
      //                 width: 2.0,
      //                 color: Color.fromARGB(255, 237, 237, 237)),
      //           ),
      //         ),
      //         //  padding: EdgeInsets.all(10),
      //         child: ListTile(
      //           leading: CircleAvatar(
      //             radius: 30,
      //             backgroundImage: AssetImage("assets/images/arhumm3.jpg"),
      //           ),
      //           // SizedBox(height: 5,),
      //           title: BigText(text: "Arhum "),
      //           subtitle: SmallText(text: "Chat with Arhum "),
      //           trailing: Column(
      //             //   mainAxisAlignment: ma,
      //             children: [
      //               SmallText(
      //                 text: "11:00PM",
      //                 color: Colors.grey,
      //               ),
      //               Container(
      //                 alignment: Alignment.center,
      //                 width: 30,
      //                 height: 30,
      //                 padding: EdgeInsets.all(5),
      //                 decoration: BoxDecoration(
      //                     borderRadius: BorderRadius.circular(50),
      //                     color: AppColors.PrimaryColor),
      //                 child: SmallText(
      //                   text: "99+",
      //                   color: Colors.white,
      //                 ),
      //               )
      //             ],
      //           ),
      //         ),
      //       )
      //     ],
      //   ),
      // ),
      //  ],
    );
    //);
  }
}
