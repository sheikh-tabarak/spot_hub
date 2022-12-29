import 'package:flutter/material.dart';
import 'package:spot_hub/configurations/AppColors.dart';
import 'package:spot_hub/models/UserModels/User.dart';
import 'package:spot_hub/screens/UserView/Admin/RecordIntrests.dart';
import 'package:spot_hub/screens/UserView/Customer/ScrollableProductDetailPage.dart';
import 'package:spot_hub/screens/UserView/Home/MainPage.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
      home: MainPage(MainUser: User(image:'https://cdn.iconscout.com/icon/free/png-256/avatar-370-456322.png' ,username: "username", password: "password", email: "email@xyz.com", PhoneNo: "PhoneNo", Intrests: "Intrests"),isLoggedin: false,),
      // AnimatedSplashScreen(
      //       splashIconSize: double.infinity, //Dimensions.screenHeight,
      //       duration: 1000,
      //       splash: Container(
      //         child: Column(
      //           crossAxisAlignment: CrossAxisAlignment.center,
      //           mainAxisAlignment: MainAxisAlignment.center,
      //           children: [
      //             Image(
      //                 width: 200,
      //                 height: 200,
      //                 image: AssetImage('assets/images/logo.png')),

      //             SizedBox(height: 10),
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
      //       splashTransition: SplashTransition.fadeTransition,
      //       backgroundColor: AppColors.darkBackgroundColor),
    );
  }
}
