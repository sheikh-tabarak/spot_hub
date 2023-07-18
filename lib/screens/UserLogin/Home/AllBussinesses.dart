import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:spot_hub/configurations/AppColors.dart';
import 'package:spot_hub/configurations/BigText.dart';
import 'package:spot_hub/configurations/SmallText.dart';
import 'package:spot_hub/models/BusinessModels/Bussiness.dart';
import 'package:spot_hub/models/Global/ProductsData.dart';
import 'package:spot_hub/widgets/default_widgets/NoData.dart';
import 'package:spot_hub/widgets/popup_widgets/BussinessProfile.dart';
import 'package:spot_hub/widgets/popup_widgets/ProductContact.dart';

class AllBussinesses extends StatefulWidget {
  String Results;
  final bool isLoggedin;
  AllBussinesses({super.key, this.Results = "", required this.isLoggedin});

  @override
  State<AllBussinesses> createState() => _AllBussinessesState();
}

class _AllBussinessesState extends State<AllBussinesses> {
  TextEditingController SearchTextControl = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: SmallText(
          text: "Searching \"${SearchTextControl.text}\"",
          size: 12,
          color: Colors.white,
        ),
        backgroundColor: AppColors.PrimaryColor,
      ),
      body: SingleChildScrollView(
          child: Column(children: [
        Container(
          margin: EdgeInsets.all(10),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  onChanged: (value) {
                    setState(() {
                      widget.Results = value;
                    });
                  },
                  controller: SearchTextControl,
                  decoration: const InputDecoration(
                    hintText: "Search for bussiness",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          bottomLeft: Radius.circular(10)),
                    ),
                  ),
                ), // TextField widget
              ), // Expanded widget
              // SizedBox widget
              Container(
                margin: EdgeInsets.zero,
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: AppColors.PrimaryColor,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(10),
                      bottomRight: Radius.circular(10)),
                ),
                child: IconButton(
                  //   color: AppColors.PrimaryColor,
                  icon: Icon(
                    Icons.search,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    // Handle the search button press here
                  },
                ),
              ), // IconButton widget
            ],
          ), // Row widget
        ),
        StreamBuilder(
            stream: AllBussinessesofSpothub(),
            builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
              return snapshot.hasData
                  ? ListView(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      // This next line does the trick.
                      scrollDirection: Axis.vertical,
                      children: snapshot.data!.docs.map((e) {
                        if (e["BussinessName"]
                            .toString()
                            .contains(widget.Results)) {
                          return GestureDetector(
                              onTap: () {},
                              child: Container(
                                margin: EdgeInsets.all(10),
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 1,
                                      color: const Color.fromARGB(
                                          255, 160, 160, 160)),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Column(
                                  children: [
                                    ListTile(
                                      onTap: () {
                                        showModalBottomSheet(
                                            isScrollControlled: true,
                                            enableDrag: true,
                                            shape: const RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.vertical(
                                                top: Radius.circular(15.0),
                                              ),
                                            ),
                                            context: context,
                                            builder: (context) {
                                              return Container(
                                                  // padding: const EdgeInsets.all(10),
                                                  child: BussinessProfile(
                                                isLoggedIn: widget.isLoggedin,
                                                B: Bussiness(
                                                    BussinessId:
                                                        e['BussinessId'],
                                                    BussinessImageUrl:
                                                        e['BussinessImageUrl'],
                                                    BussinessName:
                                                        e['BussinessName'],
                                                    BussinessEmail:
                                                        e['BussinessEmail'],
                                                    BussinessCity:
                                                        e['BussinessCity'],
                                                    BussinessAddress:
                                                        e['BussinessAddress'],
                                                    BussinessPhone:
                                                        e['BussinessPhone'],
                                                    BussinessType:
                                                        e['BussinessType'],
                                                    BussinessWebsite:
                                                        e['BussinessWebsite'],
                                                    Reports: e['Reports']),
                                              ));
                                            });
                                      },
                                      leading: CircleAvatar(
                                        backgroundImage: NetworkImage(
                                            e['BussinessImageUrl']),
                                      ),
                                      title: BigText(text: e['BussinessName']),
                                      subtitle:
                                          SmallText(text: e['BussinessEmail']),
                                    ),
                                    Container(
                                      decoration: const BoxDecoration(
                                          border: Border(
                                              top: BorderSide(
                                                  width: 1,
                                                  color: Color.fromARGB(
                                                      255, 212, 212, 212)))),
                                      padding: const EdgeInsets.all(10),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          GestureDetector(
                                            onTap: () {
                                              showModalBottomSheet(
                                                  enableDrag: true,
                                                  shape:
                                                      const RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.vertical(
                                                      top:
                                                          Radius.circular(15.0),
                                                    ),
                                                  ),
                                                  context: context,
                                                  builder: (context) {
                                                    return Container(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(10),
                                                        child: ProductContact(
                                                          BussinessName: e[
                                                              'BussinessName'],
                                                          Email: e[
                                                              'BussinessEmail'],
                                                          Phone: e[
                                                              'BussinessPhone'],
                                                          website: e[
                                                              'BussinessWebsite'],
                                                        ));
                                                  });
                                            },
                                            child: const Row(
                                              children: [
                                                Icon(
                                                  Icons.web,
                                                  size: 22,
                                                ),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                Icon(Icons.mail, size: 22),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                Icon(Icons.phone, size: 22),
                                              ],
                                            ),
                                          ),
                                          Row(
                                            children: [
                                              SmallText(
                                                text: e['BussinessCity'],
                                                color: AppColors.PrimaryColor,
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              )

                              // Text(
                              //     "${e['BussinessName']}+ ${e['BussinessImageUrl']} +  ${e['BussinessPhone']} +  ${e['BussinessType']} +  ${e['BussinessWebsite']}"),
                              );
                        }
                        return SizedBox();
                      }).toList())
                  : NoData();
            }),
      ])),
    );
  }
}
