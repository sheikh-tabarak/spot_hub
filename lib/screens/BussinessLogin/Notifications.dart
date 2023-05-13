import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:spot_hub/configurations/AppColors.dart';
import 'package:spot_hub/configurations/BigText.dart';
import 'package:spot_hub/configurations/SmallText.dart';
import 'package:spot_hub/widgets/others/PrimayButton.dart';

class Notifications extends StatefulWidget {
  const Notifications({super.key});

  @override
  State<Notifications> createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  int _noOfNotication = 1;

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
      ),
      body: _noOfNotication == 0
          ? Center(
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
                    TextButton(onPressed: () {}, child: Text("Refresh"))
                  ],
                ),
              ),
            )
          : Container(
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SmallText(text: "7 May"),
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    decoration: BoxDecoration(
                      color: Colors.white,

                      // border: Border(
                      //   bottom: BorderSide(color: Colors.black),
                      // ),
                      //  [Border []
                      // (bottom: BorderSide(width: 2, color: Color.fromARGB(255, 190, 190, 190)))],
                    ),
                    
                    child: Column(
                      children: [
                        ListTile(
                          leading: Image(
                              image: AssetImage("assets/images/1desifood.png")),
                          title: BigText(text: "This is a notification"),
                          subtitle: SmallText(text: "8 hrs ago"),
                          trailing: Icon(Icons.arrow_forward_ios),
                        )
                      ],
                    ),
                  ),
                 Container(
                    margin: EdgeInsets.only(top: 10),
                    decoration: BoxDecoration(
                      color: Colors.white,

                      // border: Border(
                      //   bottom: BorderSide(color: Colors.black),
                      // ),
                      //  [Border []
                      // (bottom: BorderSide(width: 2, color: Color.fromARGB(255, 190, 190, 190)))],
                    ),
                    
                    child: Column(
                      children: [
                        ListTile(
                          leading: Image(
                              image: AssetImage("assets/images/1desifood.png")),
                          title: BigText(text: "This is a notification"),
                          subtitle: SmallText(text: "8 hrs ago"),
                          trailing: Icon(Icons.arrow_forward_ios),
                        )
                      ],
                    ),
                  ),
                
                ],
              ),
            ),
    );
  }
}
