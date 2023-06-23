// ignore_for_file: non_constant_identifier_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:spot_hub/screens/BussinessLogin/ManageBussiness/BussinessHome.dart';
import 'package:spot_hub/screens/BussinessLogin/ManageProducts/ScrapProducts.dart';
import 'package:spot_hub/screens/BussinessLogin/ManageReports/MyReports.dart';
import 'package:spot_hub/screens/BussinessLogin/ManageProducts/AddProduct.dart';
import 'package:spot_hub/screens/UserLogin/Admin/ForgetPassword.dart';
import 'package:spot_hub/screens/UserLogin/Home/MainPage.dart';
import 'package:spot_hub/screens/UserLogin/User/MainHome.dart';

import 'screens/BussinessLogin/ManageBussiness/AddNewBussiness.dart';
import 'screens/BussinessLogin/ScrapBussiness.dart';
import 'screens/UserLogin/Admin/Login.dart';
import 'screens/UserLogin/SearchFrame/MainSearch.dart';
import 'screens/UserLogin/chat/ChatScreen.dart';

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
        home: Scaffold(body: Login()
            //  BussinessHome()
            //      MainPage(isLoggedin: true,PI: 2,)
            //          ChatScreen(
            //   ChatUserId: "pcWl3UXJKKNz5H0Evlb6Xftl0523", InitiateDate: Timestamp.now().toString(),
            // )
            // BussinessHome(PageIndex: 0,)

            ));
  }
}

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
