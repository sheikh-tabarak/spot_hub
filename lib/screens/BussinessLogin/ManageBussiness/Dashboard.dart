import 'dart:ffi';

import 'package:countup/countup.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spot_hub/configurations/AppColors.dart';
import 'package:spot_hub/configurations/BigText.dart';
import 'package:spot_hub/configurations/SmallText.dart';
import 'package:spot_hub/models/BusinessModels/Bussiness.dart';
import 'package:spot_hub/models/BusinessModels/Product.dart';
import 'package:spot_hub/screens/BussinessLogin/BussinessHome.dart';
import 'package:spot_hub/screens/BussinessLogin/ManageProducts/ScrapProducts.dart';
import 'package:spot_hub/widgets/default_widgets/Loading.dart';
import 'package:spot_hub/widgets/default_widgets/NoData.dart';

class Dashboard extends StatefulWidget {
  final Bussiness CurrentBussiness;
  Dashboard({super.key, required this.CurrentBussiness});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  double _rating_total = 0;

  int Total = 0;
  int _touchedIndex = -1;
  double _noOfProducts = 3;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return isLoading == true
        ? const Loading(message: "Loading your data")
        : Scaffold(
            backgroundColor: const Color.fromARGB(255, 231, 231, 231),
            body: Container(
              margin: const EdgeInsets.all(
                15,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Wrap(children: [
                    Material(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(15)),
                        elevation: 8,
                        child: Container(
                            height: 70,
                            // width: 185,
                            // padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              // color: AppColors.PrimaryColor,
                            ),
                            child: ListTile(
                              leading: Icon(
                                Icons.web,
                                color: AppColors.PrimaryColor,
                                size: 25,
                              ),
                              title: BigText(text: "Already have the store ?"),
                              subtitle: SmallText(
                                  text: "Transfer your products here"),
                              trailing: InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: ((context) => ScrapProducts(
                                                website: widget.CurrentBussiness
                                                    .BussinessWebsite,
                                              ))));
                                },
                                child: Container(
                                  height: 40,
                                  width: 40,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    color: AppColors.PrimaryColor,
                                    borderRadius: BorderRadius.circular(50),
                                  ),
                                  child: const Icon(
                                    Icons.get_app_rounded,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            )))
                  ]),
                  const SizedBox(
                    height: 15,
                  ),
                  _noOfProducts == 0
                      ? Wrap(children: [
                          Material(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(15)),
                              elevation: 8,
                              child: Container(
                                  height: 70,
                                  // width: 185,
                                  // padding: EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    // color: AppColors.PrimaryColor,
                                  ),
                                  child: ListTile(
                                    leading: Icon(
                                      Icons.hourglass_empty,
                                      color: AppColors.PrimaryColor,
                                      size: 25,
                                    ),
                                    title: BigText(
                                        text: "No Products for bussiness"),
                                    subtitle: SmallText(
                                        text:
                                            "Click to add your first product "),
                                  )))
                        ])
                      : const SizedBox(
                          height: 0,
                        ),
                  const SizedBox(
                    height: 15,
                  ),
                  BigText(
                    text:
                        "Good Morning, ${widget.CurrentBussiness.BussinessName}",
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  SmallText(text: "Here are your bussiness Statistics"),
                  const SizedBox(
                    height: 15,
                  ),
                  StreamBuilder(
                      stream: ProductsofBussiness(
                          widget.CurrentBussiness.BussinessId),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          if (snapshot.data!.docs.isNotEmpty) {
                            snapshot.data!.docs.forEach(
                              (element) {
                                if (element["rating"] == 0) {
                                  _rating_total = _rating_total + 5;
                                } else {
                                  _rating_total =
                                      _rating_total + element["rating"];
                                }
                              },
                            );

                            _rating_total = _rating_total /
                                snapshot.data!.docs.length
                                    .toInt()
                                    .floorToDouble();

                            return Wrap(
                              children: [
                                Material(
                                  elevation: 8,
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(15)),
                                  child: Container(
                                    height: 260,
                                    width: 170,
                                    padding: const EdgeInsets.all(20),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      color: AppColors.PrimaryColor,
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Countup(
                                            begin: 0,
                                            end: snapshot.data!.docs.length
                                                .toInt()
                                                .floorToDouble(),
                                            duration:
                                                const Duration(seconds: 3),
                                            separator: ',',
                                            style: const TextStyle(
                                              fontFamily: 'Poppins',
                                              fontSize: 30,
                                              color: Colors.white,
                                              fontWeight: FontWeight.w700,
                                            )),
                                        SmallText(
                                          text: "Total Products",
                                          color: Colors.white,
                                        ),
                                        const SizedBox(
                                          height: 30,
                                        ),

                                        Countup(
                                            begin: 0,
                                            end: widget.CurrentBussiness.Reports
                                                .toInt()
                                                .floorToDouble(),
                                            duration:
                                                const Duration(seconds: 3),
                                            separator: ',',
                                            style: const TextStyle(
                                              fontFamily: 'Poppins',
                                              fontSize: 20,
                                              color: Colors.white,
                                              fontWeight: FontWeight.w700,
                                            )),
                                        SmallText(
                                          text: "Total Reports",
                                          color: Colors.white,
                                        ),
                                        const SizedBox(
                                          height: 30,
                                        ),
                                        // Row(
                                        //   mainAxisAlignment:
                                        //       MainAxisAlignment.spaceBetween,
                                        //   children: [
                                        //     Column(
                                        //       children: [
                                        //         Countup(
                                        //             begin: 0,
                                        //             end: Total.toDouble(),
                                        //             duration: const Duration(
                                        //                 seconds: 3),
                                        //             separator: ',',
                                        //             style: const TextStyle(
                                        //               fontFamily: 'Poppins',
                                        //               fontSize: 20,
                                        //               color: Colors.white,
                                        //               fontWeight:
                                        //                   FontWeight.w300,
                                        //             )),
                                        //         SmallText(
                                        //           text: "Active ",
                                        //           color: Colors.white,
                                        //         ),
                                        //       ],
                                        //     ),
                                        //     Column(
                                        //       children: [
                                        //         Countup(
                                        //             begin: 0,
                                        //             end: 0,
                                        //             duration: const Duration(
                                        //                 seconds: 3),
                                        //             separator: ',',
                                        //             style: const TextStyle(
                                        //               fontFamily: 'Poppins',
                                        //               fontSize: 20,
                                        //               color: Colors.white,
                                        //               fontWeight:
                                        //                   FontWeight.w300,
                                        //             )),
                                        //         SmallText(
                                        //           text: "Pending ",
                                        //           color: Colors.white,
                                        //         ),
                                        //       ],
                                        //     ),

                                        //   ],
                                        // ),
                                        Expanded(
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  const Icon(
                                                    Icons.inventory,
                                                    color: Colors.white,
                                                  ),
                                                  IconButton(
                                                    icon: const Icon(
                                                      Icons.arrow_forward,
                                                      color: Colors.white,
                                                    ),
                                                    onPressed: () {
                                                      Navigator.pushReplacement(
                                                          context,
                                                          MaterialPageRoute(
                                                              builder: ((context) =>
                                                                  BussinessHome(
                                                                    PageIndex:
                                                                        1,
                                                                  ))));
                                                    },
                                                  ),
                                                ],
                                              )
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                Column(
                                  children: [
                                    Container(
                                      margin: const EdgeInsets.only(
                                        left: 10,
                                      ),
                                      child: Material(
                                        elevation: 8,
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(15)),
                                        child: Container(
                                          height: 125,
                                          width: 170,
                                          padding: const EdgeInsets.all(15),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            color: AppColors.SecodaryColor,
                                          ),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              const Icon(
                                                Icons.arrow_downward,
                                                color: Colors.white,
                                              ),
                                              const SizedBox(
                                                height: 5,
                                              ),
                                              Row(
                                                children: [
                                                  Text(
                                                      style: const TextStyle(
                                                        fontFamily: 'Poppins',
                                                        fontSize: 25,
                                                        color: Colors.white,
                                                        fontWeight:
                                                            FontWeight.w700,
                                                      ),
                                                      _rating_total
                                                          .toPrecision(2)
                                                          .toString()),
                                                  // BigText(text: "4.7",color: Colors.white,size: 25,),
                                                  SizedBox(
                                                    width: 10,
                                                  ),
                                                  Icon(
                                                    Icons.star,
                                                    color: Colors.white,
                                                  ),
                                                ],
                                              ),
                                              SmallText(
                                                text: "Bussiness Rating",
                                                color: Colors.white,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      margin: const EdgeInsets.only(
                                        left: 10,
                                        top: 10,
                                      ),
                                      child: Material(
                                        elevation: 8,
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(15)),
                                        child: Container(
                                          height: 125,
                                          width: 170,
                                          padding: const EdgeInsets.all(15),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                              color: const Color.fromARGB(
                                                  255, 30, 166, 244)
                                              //  Color.fromRGBO(30, 166, 244, 100),
                                              ),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              const Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                children: [
                                                  Icon(
                                                    Icons.arrow_outward_sharp,
                                                    color: Colors.white,
                                                  ),
                                                ],
                                              ),
                                              const Row(
                                                children: [
                                                  Text(
                                                      style: TextStyle(
                                                        fontFamily: 'Poppins',
                                                        fontSize: 25,
                                                        color: Colors.white,
                                                        fontWeight:
                                                            FontWeight.w700,
                                                      ),
                                                      "Monitize"),
                                                  // BigText(text: "4.7",color: Colors.white,size: 25,),
                                                  SizedBox(
                                                    width: 10,
                                                  ),
                                                  // Icon(
                                                  //   Icons.star,
                                                  //   color: Colors.white,
                                                  // ),
                                                ],
                                              ),
                                              SmallText(
                                                text: "Your bussiness",
                                                color: Colors.white,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            );
                          } else {
                            return NoData(
                              ImageLink: "assets/images/noproductsyet.png",
                              title: "NoProducts yet",
                              subtitle:
                                  "This store have no products yet,Click the plus icon on upper right cornet to add new product",
                            );
                          }
                        } else {
                          return NoData(
                            ImageLink: "assets/images/404yet.png",
                            title: "No available statistics",
                            subtitle:
                                "Eiether this Bussiness have no Product or have any problem",
                          );
                        }
                      }),
                ],
              ),
            )

            // Center(
            //   child:
            // ) ,
            );
  }

  // Future getProductData() async {
  //   // int Total1 = 0;
  //   await TotalProducts().then((value) {
  //     setState(() {
  //       Total = value.toInt();
  //     });
  //   });

  //   // print("Next Bhai saahib " + Total.toString());
  // }

  // List<PieChartSectionData> showingSections() {
  //   return List.generate(2, (i) {
  //     final isTouched = i == touchedIndex;
  //     final fontSize = isTouched ? 15.0 : 10.0;
  //     final radius = isTouched ? 30.0 : 20.0;
  //     const shadows = [Shadow(color: Colors.black, blurRadius: 2)];
  //     switch (i) {
  //       case 0:
  //         return PieChartSectionData(
  //           color: Color.fromARGB(255, 255, 197, 6),
  //           value: 10,
  //           title: '10',
  //           radius: radius,
  //           titleStyle: TextStyle(
  //             fontSize: fontSize,
  //             fontWeight: FontWeight.bold,
  //             color: Colors.white,
  //             shadows: shadows,
  //           ),
  //         );
  //       case 1:
  //         return PieChartSectionData(
  //           color: Colors.green,
  //           value: 90,
  //           title: '90',
  //           radius: radius,
  //           titleStyle: TextStyle(
  //             fontSize: fontSize,
  //             fontWeight: FontWeight.bold,
  //             color: Colors.white,
  //             shadows: shadows,
  //           ),
  //         );
  //       // case 2:
  //       //   return PieChartSectionData(
  //       //     color: AppColors.darkBackgroundColor,
  //       //     value: 15,
  //       //     title: '15%',
  //       //     radius: radius,
  //       //     titleStyle: TextStyle(
  //       //       fontSize: fontSize,
  //       //       fontWeight: FontWeight.bold,
  //       //       color: AppColors.PrimaryColor,
  //       //       shadows: shadows,
  //       //     ),
  //       //   );
  //       // case 3:
  //       //   return PieChartSectionData(
  //       //     color: AppColors.textColor,
  //       //     value: 15,
  //       //     title: '15%',
  //       //     radius: radius,
  //       //     titleStyle: TextStyle(
  //       //       fontSize: fontSize,
  //       //       fontWeight: FontWeight.bold,
  //       //       color: AppColors.PrimaryColor,
  //       //       shadows: shadows,
  //       //     ),
  //       //   );

  //       default:
  //         throw Error();
  //     }
  //   }
  //);
  // }
}
