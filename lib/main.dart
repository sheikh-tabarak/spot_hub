// ignore_for_file: non_constant_identifier_names

import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:spot_hub/configurations/AppColors.dart';
import 'package:spot_hub/configurations/SmallText.dart';
import 'package:spot_hub/models/UserModels/User.dart';
import 'package:spot_hub/screens/ResturantsView/Admin/AddBussiness/AddBussiness.dart';
import 'package:spot_hub/screens/UserView/Admin/Login.dart';
import 'package:spot_hub/screens/UserView/Customer/DevelopersTeam.dart';
import 'package:spot_hub/screens/UserView/Customer/MainSearch.dart';
import 'package:spot_hub/screens/UserView/Customer/SearchPage.dart';

import 'screens/ResturantsView/Admin/AddBussiness/BussinessForm.dart';
import 'screens/UserView/Home/MainPage.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  double img_height=200;
  double img_width=200;

  @override
  void initState() {
   
    super.initState();
    for (var i = 1000; i > 200; i--) {
      img_height=i.toDouble();
      img_width=i.toDouble();
    }
    

  }
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Spot Hub',
      // theme: ThemeData(
      //   primarySwatch: Colors.blue,
      // ),
      theme: ThemeData.light().copyWith(
        colorScheme: ColorScheme.fromSeed(
            seedColor: AppColors.PrimaryColor, primary: AppColors.PrimaryColor),
      ),
      // child:TextFormField()
//)

      //     theme: ThemeData(
      // colorScheme: ThemeData().colorScheme.copyWith(
      //   secondary: AppColors.PrimaryColor,
      // ),
// ),

      home:
      BussinessForm()
     //  MainSearch()
      // SearchPage(searchTitle: 'Burger',)
     // DevelopersTeam()
      //AddReview(ProductToReview: DummyProducts[1]),
     // RatingSlider(title: "How was the taste",)
  //   const MainPage(MainUser: User(image:"assets/images/logo.png" ,username: "Guest", password: "password", email: "guest@spothub.com", PhoneNo: "PhoneNo", Intrests: "Intrests"),isLoggedin: false,),
      
      // AnimatedSplassshScreen(
      //   splashTransition:SplashTransition.scaleTransition,
      //       splashIconSize: double.infinity, //Dimensions.screenHeight,
      //       duration: 1000,
      //       splash: AnimatedContainer(
      //         duration: const Duration(milliseconds: 500),
              
      //         child: Column(
      //           crossAxisAlignment: CrossAxisAlignment.center,
      //           mainAxisAlignment: MainAxisAlignment.center,
      //           children: [
      //             Image(
      //                 width: img_width,
      //                 height: img_height,
      //                 image: const AssetImage('assets/images/logo.png')),

      //             const SizedBox(height: 10),
      //             SmallText(
      //               text: 'By Tech Legion',
      //               size: 11,
      //               color: Colors.white,
      //               weight: FontWeight.w100,
      //             )
      //           ],
      //         ),
      //       ),
      //       nextScreen: Login(),
      //    //   splashTransition: SplashTransition.fadeTransition,
      //       backgroundColor: AppColors.darkBackgroundColor),

    );
  }
}
