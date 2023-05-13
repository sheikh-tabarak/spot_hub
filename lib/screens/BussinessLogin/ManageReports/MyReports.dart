import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:spot_hub/configurations/AppColors.dart';
import 'package:spot_hub/configurations/BigText.dart';
import 'package:spot_hub/configurations/SmallText.dart';
import 'package:spot_hub/models/BusinessModels/Reports.dart';
import 'package:spot_hub/screens/BussinessLogin/ManageReports/NewReport.dart';
import 'package:spot_hub/screens/BussinessLogin/ManageReports/widgets/SingleReportPopup.dart';

class MyReports extends StatefulWidget {
  const MyReports({super.key});

  @override
  State<MyReports> createState() => _MyReportsState();
}

class _MyReportsState extends State<MyReports> {
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 221, 221, 221),
        appBar: AppBar(
          backgroundColor: AppColors.PrimaryColor,
          title: BigText(
            text: "My Reports",
            color: Colors.white,
          ),
          actions: [
            //  InkWell(

            IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => NewReport()));
              },
            ),
            //  )
          ],
        ),
        body: isLoading == false
            ? SingleChildScrollView(
                physics: AlwaysScrollableScrollPhysics(),
                child: StreamBuilder(
                    stream: ReportsforBusiness(),
                    builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                      return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 20,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 10.0),
                              child: SmallText(
                                text: "All Requests",
                                iscentre: false,
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            snapshot.hasData
                                ? ListView(
                                    shrinkWrap: true,
                                    physics: NeverScrollableScrollPhysics(),
                                    children: snapshot.data!.docs.map((e) {
                                      return GestureDetector(
                                        onHorizontalDragEnd: (details) {
                                          print(details);
                                          printInfo();
                                        },
                                        onTap: () async {
                                         // String Load;


                                          await GetSingleReport(e['ReportId'])
                                              .then((value) {
                                          //  value.ReportId;

                                            showBottomSheet(
                                                context: context,
                                                shape:
                                                    const RoundedRectangleBorder(
                                                  // <-- SEE HERE
                                                  borderRadius:
                                                      BorderRadius.vertical(
                                                    top: Radius.circular(25.0),
                                                  ),
                                                ),
                                                elevation: 8,
                                                //  shape:Border.symmetric(),
                                                enableDrag: true,
                                                builder: (BuildContext
                                                        _context) =>
                                                    SingleReportPopup(
                                                        RTitle:
                                                            value.ReportTitle,
                                                        RBody: value.ReportBody,
                                                        RRespnse: value
                                                            .ReportResponse,
                                                        Rstatus: value
                                                            .ReportStatus));
                                         
                                          });
                                        },
                                        child: Container(
                                          padding: EdgeInsets.only(
                                              top: 5,
                                              bottom: 5,
                                              left: 10,
                                              right: 10),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                          child: ListTile(
                                            tileColor: Colors.white,
                                            leading: Container(
                                                width: 10,
                                                //  height: 30,
                                                color: e['ReportStatus']
                                                            .toString() ==
                                                        "Active"
                                                    ? Color.fromARGB(
                                                        255, 254, 204, 25)
                                                    : e['ReportStatus']
                                                                .toString() ==
                                                            "Solved"
                                                        ? Colors.green
                                                        : e['ReportStatus']
                                                                    .toString() ==
                                                                "Refused"
                                                            ? Colors.red
                                                            : Colors.black),
                                            title: BigText(
                                                text: e['ReportTitle']
                                                    .toString()),
                                            subtitle: SmallText(
                                                text:
                                                    e['ReportBody'].toString()),
                                            trailing: Icon(
                                              e['ReportStatus'].toString() ==
                                                      "Active"
                                                  ? Icons.pending_actions
                                                  : e['ReportStatus']
                                                              .toString() ==
                                                          "Solved"
                                                      ? Icons.check_circle
                                                      : e['ReportStatus']
                                                                  .toString() ==
                                                              "Refused"
                                                          ? Icons.cancel
                                                          : Icons.circle,
                                              color: e['ReportStatus']
                                                          .toString() ==
                                                      "Active"
                                                  ? Color.fromARGB(
                                                      255, 254, 204, 25)
                                                  : e['ReportStatus']
                                                              .toString() ==
                                                          "Solved"
                                                      ? Colors.green
                                                      : e['ReportStatus']
                                                                  .toString() ==
                                                              "Refused"
                                                          ? Colors.red
                                                          : Colors.black,
                                            ),
                                          ),
                                        ),
                                      );
                                    }).toList())
                                : Center(
                                    child: BigText(text: "No Report yet"),
                                  ),
                            // )
                          ]);
                    }),
              )
            : Center(child: BigText(text: "Error")));
  }
}
