import 'package:flutter/material.dart';
import 'package:spot_hub/configurations/AppColors.dart';
import 'package:spot_hub/configurations/Dimensions.dart';
import 'package:spot_hub/configurations/SmallText.dart';
import 'package:spot_hub/models/Chat/ChatProvider.dart';
import 'package:spot_hub/screens/Loading.dart';
import 'package:spot_hub/screens/UserLogin/chat/ChatScreen.dart';
import 'package:spot_hub/widgets/Team/IconBox.dart';

class MemberDetails extends StatefulWidget {
  final String Detailsof;
  final ImageProvider Link;
  final String title;
  String role;
  final String post;
  final String phoneno;
  final String email;
  bool isPortfolio;
  bool isChat;
  int requestStatus;
  final String portfolio;
  final String desc;

  final bool isCentral;
  MemberDetails({
    super.key,
    required this.Detailsof,
    required this.Link,
    required this.title,
    this.role = "0",
    required this.post,
    required this.isCentral,
    required this.phoneno,
    required this.email,
    required this.portfolio,
    required this.desc,
    this.isPortfolio = true,
    this.isChat = false,
    this.requestStatus = 0,
  });

  @override
  State<MemberDetails> createState() => _MemberDetailsState();
}

class _MemberDetailsState extends State<MemberDetails> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return isLoading == true
        ? Loading(message: "intiating Chat")
        : Container(
            padding: EdgeInsets.all(Dimensions.height40),
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20))),
            child: Column(
              children: [
                Stack(
                  children: [
                    Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: AppColors.PrimaryColor, width: 2),
                          borderRadius: BorderRadius.circular(100),
                          image: DecorationImage(
                              image: widget.Link, fit: BoxFit.cover)),
                      child: Container(),
                    ),
                    SizedBox(
                      width: 100,
                      height: 110,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Container(
                            alignment: Alignment.center,
                            padding: const EdgeInsets.all(3),
                            margin: const EdgeInsets.only(top: 10, bottom: 0),
                            width: 70,
                            height: 20,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(
                                    width: 1, color: AppColors.PrimaryColor),
                                borderRadius: BorderRadius.circular(20)),
                            child: SmallText(
                              text: widget.post,
                              color: AppColors.PrimaryColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: Dimensions.height15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SmallText(
                      text: widget.title,
                      size: 22,
                      color: AppColors.PrimaryColor,
                    ),
                    SmallText(
                      text: " (${widget.role}) ",
                      size: 20,
                    ),
                  ],
                ),
                SizedBox(
                  height: Dimensions.height15,
                ),
                widget.Detailsof == "DevTeam"
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconBox(
                            BoxIcon: Icons.phone,
                            BoxText: "Call",
                            BoxWidth: 30,
                            BoxLink: "tel:${widget.phoneno}",
                          ),
                          IconBox(
                            BoxIcon: Icons.email,
                            BoxText: "Email",
                            BoxWidth: 30,
                            BoxLink: "mailto:${widget.email}",
                          ),
                          widget.isPortfolio
                              ? IconBox(
                                  BoxIcon: Icons.link,
                                  BoxText: "Portfolio",
                                  BoxWidth: 30,
                                  BoxLink: widget.portfolio,
                                )
                              : SizedBox(
                                  width: 1,
                                ),
                          // widget.isChat
                          //     ? IconBox(
                          //         BoxIcon: Icons.chat,
                          //         BoxText: "Chat",
                          //         BoxWidth: 30,
                          //         BoxLink: widget.portfolio,
                          //       )
                          //     : SizedBox(
                          //         width: 1,
                          //       )
                        ],
                      )
                    : widget.Detailsof == "Profile"
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              // InkWell(
                              //   onTap: () {
                              //     if (widget.requestStatus == 0) {
                              //       setState(() {
                              //         widget.requestStatus = 1;
                              //       });
                              //     }
                              //     print("requested");
                              //   },
                              //   child: Container(
                              //       margin: EdgeInsets.only(
                              //           left: Dimensions.width5,
                              //           right: Dimensions.width5),
                              //       padding: EdgeInsets.all(10),
                              //       decoration: BoxDecoration(
                              //         color: const Color.fromARGB(255, 242, 242, 242),
                              //         borderRadius: BorderRadius.circular(40),
                              //       ),
                              //       child: widget.requestStatus == 0
                              //           ? Icon(
                              //               Icons.people,
                              //               color: Colors.black,
                              //             )
                              //           : widget.requestStatus == 1
                              //               ? Icon(
                              //                   Icons.forward,
                              //                   color: AppColors.PrimaryColor,
                              //                 )
                              //               : widget.requestStatus == 2
                              //                   ? Icon(
                              //                       Icons.switch_account,
                              //                       color: AppColors.PrimaryColor,
                              //                     )
                              //                   : Icon(
                              //                       Icons.abc,
                              //                       color: AppColors.PrimaryColor,
                              //                     )),
                              // ),

//  widget.requestStatus==1?
                              InkWell(
                                onTap: () async {
                                  setState(() {
                                    isLoading = true;
                                  });
                                  await initiateChat(widget.phoneno);

                                  setState(() {
                                    isLoading = false;
                                  });
                                  Navigator.pop(context);
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: ((context) => ChatScreen(
                                              ChatUserId: widget.phoneno))));

                                  print("clicked");
                                },
                                child: Container(
                                    margin: EdgeInsets.only(
                                        left: Dimensions.width5,
                                        right: Dimensions.width5),
                                    padding: const EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                      color: const Color.fromARGB(
                                          255, 242, 242, 242),
                                      borderRadius: BorderRadius.circular(40),
                                    ),
                                    child: Icon(
                                      Icons.chat,
                                      color: Colors.black,
                                    )),
                              )
                            ],
                          )
                        : SizedBox(
                            width: 1,
                          ),
                Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(25),
                  child: SmallText(iscentre: true, text: widget.desc),
                )
              ],
            ),
          );
  }
}
