// ignore_for_file: non_constant_identifier_names
import 'dart:io';

import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:spot_hub/configurations/AppColors.dart';
import 'package:spot_hub/configurations/SmallText.dart';
import 'package:spot_hub/models/UserModels/UserClass.dart';
import 'package:spot_hub/screens/UserView/Admin/Login.dart';
import 'package:spot_hub/screens/UserView/User/Account/CustomerAccount.dart';
import 'package:spot_hub/screens/UserView/User/DevelopersTeam.dart';
import 'package:spot_hub/screens/UserView/User/MainSearch.dart';
import 'package:spot_hub/screens/UserView/User/SearchPage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:spot_hub/screens/UserView/welcome.dart';
import 'screens/ResturantsView/Admin/AddBussiness/BussinessForm.dart';
import 'screens/UserView/User/Account/EditAccountDetails.dart';
import 'screens/UserView/Home/MainPage.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MyApp());
}

// void main() {
//   runApp(const MyApp());
// }

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  double img_height = 200;
  double img_width = 200;
 var isDeviceConnected = false;
  @override
  void initState() {
    super.initState();
   // InternetConnectionStatus.connected;
    for (var i = 1000; i > 200; i--) {
      img_height = i.toDouble();
      img_width = i.toDouble();
    }
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
    // builder: (context, child) {
      
    //     return StreamBuilder<ConnectivityResult>(
    //         stream: InternetConnectionService().connectionStatusController.stream,
    //         builder: (context, snapshot) {
    //             final conenctivityResult = snapshot.data;
    //             if (connectivityResult == ConnectivityResult.none || connectivityResult == null) return NoInternetScreen();

    //             return 
                home:
                Scaffold(
          body: 
          Login()
         
         
//MainPage(PI:1,MainUser: MainUser, isLoggedin: isLoggedin)
          //isDeviceConnected==true?
         // CustomerAccount()
          //:Text("Out of Internet"),
          //   MainUser: UserClass(
          //       IsBussiness: true,
          //       image: "image",
          //       username: "username",
          //       password: "password",
          //       email: "email",
          //       PhoneNo: "PhoneNo",
          //       Intrests: "Intrests"),
          // 
          
        )
        
        );
    }}

    
    
    
    // MaterialApp(
    //     debugShowCheckedModeBanner: false,
    //     title: 'Spot Hub',
    //     // theme: ThemeData(
    //     //   primarySwatch: Colors.blue,
    //     // ),
    //     theme: ThemeData.light().copyWith(
    //       colorScheme: ColorScheme.fromSeed(
    //           seedColor: AppColors.PrimaryColor,
    //           primary: AppColors.PrimaryColor),
    //     ),
     

            // BussinessForm()
            //  MainSearch()
            // SearchPage(searchTitle: 'Burger',)
            // DevelopersTeam()
            //AddReview(ProductToReview: DummyProducts[1]),
            // RatingSlider(title: "How was the taste",)
            //   const MainPage(MainUser: User(image:"assets/images/logo.png" ,username: "Guest", password: "password", email: "guest@spothub.com", PhoneNo: "PhoneNo", Intrests: "Intrests"),isLoggedin: false,),

            // AnimatedSplashScreen(
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
            //               text: 'By HAT',
            //               size: 11,
            //               color: Colors.white,
            //               weight: FontWeight.w100,
            //             )
            //           ],
            //         ),
            //       ),
            //       nextScreen:

              
        //   splashTransition: SplashTransition.fadeTransition,
        //      backgroundColor: AppColors.darkBackgroundColor),

 
