// ignore_for_file: use_build_context_synchronously

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:spot_hub/configurations/AppColors.dart';
import 'package:spot_hub/configurations/BigText.dart';
import 'package:spot_hub/configurations/Dimensions.dart';
import 'package:spot_hub/configurations/SmallText.dart';
import 'package:spot_hub/models/Chat/ChatMessages.dart';
import 'package:spot_hub/models/Chat/ChatProvider.dart';
import 'package:spot_hub/models/UserModels/UserClass.dart';
import 'package:spot_hub/widgets/default_widgets/Loading.dart';
import 'package:spot_hub/widgets/primary_widgets/BoxedTextField.dart';
import 'package:spot_hub/widgets/primary_widgets/PrimayButton.dart';

class ChatScreen extends StatefulWidget {
  final String ChatUserId;
  //final String InitiateDate;

  const ChatScreen({
    super.key,
    required this.ChatUserId,
    //   required this.InitiateDate
  });

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  bool _isLoading = false;
  bool _sending = false;
  final DateFormat Dateformatter = DateFormat('dd/MM HH:mm');
  String userImage = "";
  String Username = "";
  TextEditingController _ChatMessageController = TextEditingController();

  @override
  initState() {
    super.initState();

    try {
      getSpecificUserData(widget.ChatUserId).then((value) {
        setState(() {
          userImage = value.image;
          Username = value.username;
        });

        // print("$userImage => $Username");
      });
    } catch (e) {}
  }

  @override
  Widget build(BuildContext context) {
    return _isLoading == true
        ? const Loading(message: "Deleting your chat")
        : Scaffold(
            extendBody: true,
            appBar: AppBar(
              backgroundColor: AppColors.PrimaryColor,
              title: BigText(
                text: Username,
                color: Colors.white,
              ),
              actions: [
                IconButton(
                    onPressed: () async {
                      setState(() {
                        _isLoading = true;
                      });
                      await Deletechat(widget.ChatUserId);

                      Navigator.pop(context);

                      setState(() {
                        _isLoading = false;
                      });
                    },
                    icon: const Icon(Icons.delete))
              ],
            ),
            body:
                //  BigText(text: "text"),

                Container(
              alignment: Alignment.bottomCenter,
              padding: const EdgeInsets.only(left: 8.0, right: 8.0, bottom: 74),
              child: Container(
                alignment: Alignment.bottomCenter,
                //height: 500,
                padding: const EdgeInsets.all(5.0),
                child: StreamBuilder(
                    stream: GetAllChatwithUser(widget.ChatUserId),
                    builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                      return snapshot.hasData
                          ? ListView(
                              reverse: true,
                              shrinkWrap: true,
                              // This next line does the trick.
                              //  scrollDirection: Axis.vertical,
                              children: snapshot.data!.docs.reversed.map((e) {
                                return
                                    //BigText(text: "text");
                                    // Container(
                                    //   height: 500,
                                    //   child:

                                    e["isSent"] == false
                                        ? Column(
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    bottom: 5.0),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    CircleAvatar(
                                                      backgroundImage:
                                                          NetworkImage(
                                                              userImage),
                                                      radius: 20,
                                                    ),
                                                    Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Container(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(15),
                                                          decoration: const BoxDecoration(
                                                              color:
                                                                  Color.fromARGB(
                                                                      255,
                                                                      236,
                                                                      236,
                                                                      236),
                                                              borderRadius: BorderRadius.only(
                                                                  topLeft: Radius
                                                                      .circular(
                                                                          20),
                                                                  topRight: Radius
                                                                      .circular(
                                                                          20),
                                                                  bottomRight: Radius
                                                                      .circular(
                                                                          20))),
                                                          child: Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              SmallText(
                                                                text: Username,
                                                                color: AppColors
                                                                    .PrimaryColor,
                                                              ),
                                                              SmallText(
                                                                  text: e[
                                                                      "content"]),
                                                            ],
                                                          ),
                                                        ),
                                                        const SizedBox(
                                                          height: 4,
                                                        ),
                                                        SmallText(
                                                          iscentre: false,
                                                          text: Dateformatter.format(
                                                              DateTime.parse(e[
                                                                      "timestamp"]
                                                                  .toString()))
                                                          //" 20 Jan 10:00 AM"
                                                          ,
                                                          color: Colors.grey,
                                                          size: 3,
                                                        ),
                                                      ],
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ],
                                          )
                                        : Padding(
                                            padding: const EdgeInsets.only(
                                                bottom: 5.0),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children: [
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.end,
                                                  children: [
                                                    Container(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              15),
                                                      decoration: BoxDecoration(
                                                          color: AppColors
                                                              .PrimaryColor,
                                                          borderRadius:
                                                              const BorderRadius
                                                                      .only(
                                                                  topLeft: Radius
                                                                      .circular(
                                                                          20),
                                                                  topRight: Radius
                                                                      .circular(
                                                                          20),
                                                                  bottomLeft: Radius
                                                                      .circular(
                                                                          20))),
                                                      child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          //  SmallText(text: "Me", color: ,),
                                                          SmallText(
                                                            text: e["content"],
                                                            color: Colors.white,
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    const SizedBox(
                                                      height: 4,
                                                    ),
                                                    SmallText(
                                                      iscentre: false,
                                                      text: Dateformatter.format(
                                                          DateTime.parse(
                                                              e["timestamp"]
                                                                  .toString()))
                                                      // "20 Jan 10:00 AM ",
                                                      ,
                                                      color: Colors.grey,
                                                      size: 3,
                                                    ),
                                                  ],
                                                )
                                              ],
                                            ),
                                          );
                              }).toList())
                          : Container(
                              alignment: Alignment.center,
                              padding:
                                  EdgeInsets.only(left: Dimensions.width15),
                              child: SmallText(
                                text: "Fetching your chat ... ",
                                iscentre: false,
                              ),
                            );
                    }),

                // Row(
                //   mainAxisAlignment: MainAxisAlignment.start,
                //   children: [
                //     CircleAvatar(
                //       backgroundImage: AssetImage(userImage),
                //       radius: 20,
                //     ),
                //     Container(
                //       padding: EdgeInsets.all(15),
                //       decoration: BoxDecoration(
                //           color: const Color.fromARGB(255, 236, 236, 236),
                //           borderRadius: BorderRadius.only(
                //               topLeft: Radius.circular(20),
                //               topRight: Radius.circular(20),
                //               bottomRight: Radius.circular(20))),
                //       child: Column(
                //         crossAxisAlignment: CrossAxisAlignment.start,
                //         children: [
                //           SmallText(
                //             text: userImage,
                //             color: AppColors.PrimaryColor,
                //           ),
                //           SmallText(text: "This is Message Body")
                //         ],
                //       ),
                //     )
                //   ],
                // ),
              ),
            ),

            floatingActionButton:

                // Padding(
                //       padding: EdgeInsets.zero,
                //       child:BigText(text: "text")
                // )

//          BottomAppBar(
// height:13
//             //     clipBehavior: Clip.antiAlias,
//             child:
                // Container(
                //   height: 50,
                //   child: Column(
                //     //mainAxisAlignment: MainAxisAlignment.end,
                //     children: [
                //       BoxedTextField(placeholder: "This", icon: Icons.abc_rounded, controller: _ChatMessageController, TapAction: (){})
                // ,
                //       BigText(text: "text"),
                //     ],
                //   ),
                // )

                // PrimaryButton(
                //     TapAction: () {},
                //     text: "text",
                //     color: Colors.red,
                //     icon: Icons.ac_unit_outlined)

                Padding(
              padding: EdgeInsets.zero,
              // notchMargin: 0,
              child: Container(
                padding: const EdgeInsets.only(left: 30),
                alignment: Alignment.center,
                // margin: EdgeInsets.all(5.0),
                height: 51,
                child: Row(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(35.0),
                          boxShadow: const [
                            BoxShadow(
                                offset: Offset(0, 3),
                                blurRadius: 5,
                                color: Colors.grey)
                          ],
                        ),
                        child: Row(
                          children: [
                            IconButton(
                                icon: Icon(
                                  Icons.face,
                                  color: AppColors.PrimaryColor,
                                ),
                                onPressed: () {}),
                            Expanded(
                              child: TextField(
                                controller: _ChatMessageController,
                                decoration: const InputDecoration(
                                    hintText: "Type Something...",
                                    hintStyle: TextStyle(
                                        color:
                                            Color.fromARGB(255, 151, 151, 151)),
                                    border: InputBorder.none),
                              ),
                            ),
                            IconButton(
                              icon: Icon(Icons.photo_camera,
                                  color: AppColors.PrimaryColor),
                              onPressed: () {},
                            ),
                            IconButton(
                              icon: Icon(Icons.attach_file,
                                  color: AppColors.PrimaryColor),
                              onPressed: () {},
                            )
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(width: 15),
                    Container(
                      padding: const EdgeInsets.all(15.0),
                      decoration: BoxDecoration(
                          color: AppColors.PrimaryColor,
                          shape: BoxShape.circle),
                      child: InkWell(
                        onTap: () async {
                          if (_ChatMessageController.text != "") {
                            String Temp = _ChatMessageController.text;
                            setState(() {
                              _sending == true;
                              _ChatMessageController.text = "";
                            });

                            await sendMessage(widget.ChatUserId, Temp);

                            setState(() {
                              _sending == false;
                            });
                          } else {
                            Fluttertoast.showToast(
                                msg: "Type something to send");
                          }
                        },
                        child: _sending == true
                            ? Container(
                                width: 15,
                                height: 15,
                                child: const CircularProgressIndicator(
                                  strokeWidth: 2,
                                  color: Colors.white,
                                ),
                              )
                            : const Icon(
                                Icons.send,
                                color: Colors.white,
                              ),
                        // onLongPress: () {

                        // },
                      ),
                    )
                  ],
                ),
              ),
            ),

            //  )
          );
  }
}
