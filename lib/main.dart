// ignore_for_file: non_constant_identifier_names

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:spot_hub/screens/BussinessLogin/ManageBussiness/BussinessHome.dart';
import 'package:spot_hub/screens/BussinessLogin/ManageReports/MyReports.dart';
import 'package:spot_hub/screens/BussinessLogin/ManageProducts/AddProduct.dart';

import 'screens/BussinessLogin/ManageBussiness/AddNewBussiness.dart';
import 'screens/BussinessLogin/ScrapBussiness.dart';
import 'screens/UserLogin/Admin/Login.dart';
import 'screens/UserLogin/SearchFrame/MainSearch.dart';

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
    return  MaterialApp(
        debugShowCheckedModeBanner: false,
        // builder: (context, child) {

        //     return StreamBuilder<ConnectivityResult>(
        //         stream: InternetConnectionService().connectionStatusController.stream,
        //         builder: (context, snapshot) {
        //             final conenctivityResult = snapshot.data;
        //             if (connectivityResult == ConnectivityResult.none || connectivityResult == null) return NoInternetScreen();

        //             return
        home: Scaffold(body: MyReports()

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
