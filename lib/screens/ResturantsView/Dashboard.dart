import 'package:countup/countup.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:spot_hub/configurations/AppColors.dart';
import 'package:spot_hub/configurations/BigText.dart';
import 'package:spot_hub/configurations/Dimensions.dart';
import 'package:spot_hub/configurations/SmallText.dart';
import 'package:spot_hub/screens/ResturantsView/Indicator.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int touchedIndex = -1;

  //final List<Sector> sectors;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      margin: EdgeInsets.all(
        15,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 15,
          ),
          BigText(
            text: "Good Morning, Bussiness Name!",
          ),
          SizedBox(
            height: 5,
          ),
          SmallText(text: "Here are your bussiness Statistics"),
          SizedBox(
            height: 15,
          ),
          Wrap(
            children: [
              Container(
                child: Material(
                  elevation: 8,
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                  child: Container(
                    height: 260,
                    width: 185,
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: AppColors.PrimaryColor,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Countup(
                            begin: 100,
                            end: 800,
                            duration: Duration(seconds: 3),
                            separator: ',',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 30,
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                            )),
                        SmallText(
                          text: "Total Products",
                          color: Colors.white,
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                Countup(
                                    begin: 100,
                                    end: 760,
                                    duration: Duration(seconds: 3),
                                    separator: ',',
                                    style: const TextStyle(
                                      fontFamily: 'Poppins',
                                      fontSize: 20,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w300,
                                    )),
                                SmallText(
                                  text: "Active ",
                                  color: Colors.white,
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Countup(
                                    begin: 1,
                                    end: 20,
                                    duration: Duration(seconds: 3),
                                    separator: ',',
                                    style: const TextStyle(
                                      fontFamily: 'Poppins',
                                      fontSize: 20,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w300,
                                    )),
                                SmallText(
                                  text: "Pending ",
                                  color: Colors.white,
                                ),
                              ],
                            ),
                          ],
                        ),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: const [
                                  Icon(
                                    Icons.inventory,
                                    color: Colors.white,
                                  ),
                                  Icon(
                                    Icons.arrow_forward,
                                    color: Colors.white,
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
              ),
              Column(
                children: [
                  Container(
                     margin: const EdgeInsets.only(
                          left: 10,
                        ),
                    child: Material(
                      elevation: 8,
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                      child: Container(
                        height: 125,
                        width: 185,
                        padding: EdgeInsets.all(15),
                       
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: AppColors.SecodaryColor,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.arrow_downward,
                              color: Colors.white,
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Row(
                              children: [
                                Text(
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontSize: 25,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w700,
                                    ),
                                    "4.8"),
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
                    margin: EdgeInsets.only(
                          left: 10,
                          top: 10,
                        ),
                    child: Material(
                       elevation: 8,
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      child: Container(
                        height: 125,
                        width: 185,
                        padding: EdgeInsets.all(15),
                        
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Color.fromARGB(255, 30, 166, 244)
                        //  Color.fromRGBO(30, 166, 244, 100),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Icon(Icons.arrow_outward_sharp, color: Colors.white,),
                                
                              ],
                            ),

                            Row(
                              children:const [
                                Text(
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontSize: 25,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w700,
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
              // Column(
              //   children: [
              //     AspectRatio(
              //       aspectRatio: 1,
              //       child: Row(
              //         children: <Widget>[
              //           Expanded(
              //             child:
              //                 // AspectRatio(
              //                 //   aspectRatio: 0.5,
              //                 //   child:
              //                 PieChart(
              //               swapAnimationCurve: Curves.linear,
              //               PieChartData(
              //                 pieTouchData: PieTouchData(
              //                   touchCallback:
              //                       (FlTouchEvent event, pieTouchResponse) {
              //                     setState(() {
              //                       if (!event.isInterestedForInteractions ||
              //                           pieTouchResponse == null ||
              //                           pieTouchResponse.touchedSection ==
              //                               null) {
              //                         touchedIndex = -1;
              //                         return;
              //                       }
              //                       touchedIndex = pieTouchResponse
              //                           .touchedSection!.touchedSectionIndex;
              //                     });
              //                   },
              //                 ),
              //                 borderData: FlBorderData(
              //                   show: false,
              //                 ),
              //                 sectionsSpace: 02,
              //                 centerSpaceRadius: 10,
              //                 sections: showingSections(),
              //               ),
              //             ),
              //             //),
              //           ),
              //           Column(
              //             mainAxisAlignment: MainAxisAlignment.end,
              //             crossAxisAlignment: CrossAxisAlignment.start,
              //             children: [
              //               // Indicator(
              //               //   color: Colors.red,
              //               //   text: 'First',
              //               //   isSquare: true,
              //               // ),
              //               SizedBox(
              //                 height: 4,
              //               ),
              //               // Indicator(
              //               //   color: Colors.yellow,
              //               //   text: 'Second',
              //               //   isSquare: true,
              //               // ),
              //               SizedBox(
              //                 height: 4,
              //               ),
              //               Indicator(
              //                 color: Colors.purple,
              //                 text: 'Pending',
              //                 isSquare: true,
              //               ),
              //               SizedBox(
              //                 height: 4,
              //               ),
              //               Indicator(
              //                 color: Colors.green,
              //                 text: 'Active',
              //                 isSquare: true,
              //               ),
              //               SizedBox(
              //                 height: 18,
              //               ),
              //             ],
              //           ),
              //           const SizedBox(
              //             width: 28,
              //           ),
              //         ],
              //       ),
              //     )
              //   ],
              // )
           
            ],
          ),
        ],
      ),
    )

        // Center(
        //   child:
        // ) ,
        );
  }

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
