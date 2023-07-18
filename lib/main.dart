// ignore_for_file: non_constant_identifier_names

import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:spot_hub/configurations/SmallText.dart';
import 'screens/UserLogin/admin/Login.dart';

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
        home: Scaffold(
          body: AnimatedSplashScreen(
            splashTransition: SplashTransition.scaleTransition,
            backgroundColor: Colors.black,
            splashIconSize: double.infinity, //Dimensions.screenHeight,
            duration: 1000,
            splash: AnimatedContainer(
              duration: const Duration(milliseconds: 500),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image(
                      width: img_width,
                      height: img_height,
                      image: const AssetImage('assets/images/logo.png')),
                  const SizedBox(height: 10),
                  SmallText(
                    text: 'By Spothub Team',
                    size: 11,
                    color: Colors.white,
                    weight: FontWeight.w100,
                  )
                ],
              ),
            ),
            nextScreen: Login(),
//  splashTransition: SplashTransition.fadeTransition,
            //  backgroundColor: AppColors.darkBackgroundColor
          ),
        ));
  }
}
