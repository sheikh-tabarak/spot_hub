import 'package:flutter/material.dart';
import 'package:spot_hub/configurations/AppColors.dart';
import 'package:spot_hub/configurations/Dimensions.dart';
import 'package:spot_hub/configurations/SmallText.dart';
import 'package:spot_hub/screens/UserLogin/Admin/Login.dart';
import 'package:spot_hub/screens/UserLogin/Admin/Signup.dart';
import 'package:spot_hub/widgets/others/PrimayButton.dart';

class NoLogin extends StatelessWidget {
  const NoLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,

            children: [
              Padding(
                padding: const EdgeInsets.only(
                    top: 40, bottom: 15, right: 15, left: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(
                      "assets/images/logo.png",
                      width: 70,
                      height: 70,
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: SmallText(
                        text: "Cancel",
                        color: AppColors.PrimaryColor,
                      ),
                    )
                  ],
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: Dimensions.height30,
                  ),
                  SmallText(
                      text: 'Log in using your email address and password'),
                  SizedBox(
                    height: Dimensions.height10,
                  ),
                  Image.asset(
                    'assets/images/nologin.png',
                    width: 300,
                    height: 300,
                  ),
                  SizedBox(
                    height: Dimensions.height10,
                  ),
                  SmallText(
                    text:
                        'I agreed to all terms and conditions for signing up\nRead terms and conditions',
                    color: const Color.fromARGB(255, 184, 184, 184),
                  ),

                  SizedBox(
                    height: Dimensions.height30,
                  ),

                  PrimaryButton(
                      TapAction: () {},
                      text: 'Continue with Google',
                      color: Colors.white,
                      icon: Icons.g_mobiledata_outlined),

                  Row(
                    verticalDirection: VerticalDirection.down,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.PrimaryColor,
                              //foregroundColor: Colors.white,
                              fixedSize: const Size(180, 50)
                              // maximumSize: Size(250, 50)
                              ),
                          onPressed: () {
                           Navigator.pushReplacement(
                              context,
                              PageRouteBuilder(
                                pageBuilder:
                                    (context, animation, secondaryAnimation) =>
                                        Login(),
                                transitionsBuilder: (context, animation,
                                        secondaryAnimation, child) =>
                                    SlideTransition(
                                  position: Tween<Offset>(
                                    begin: const Offset(1, 0),
                                    end: Offset.zero,
                                  ).animate(animation),
                                  child: child,
                                ),
                              ),
                            );

                            //       Login();
                          },
                          child: SmallText(
                            text: 'Login',
                            color: Colors.white,
                          )),

                      SizedBox(
                        width: Dimensions.width15,
                      ),

                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.PrimaryColor,
                            //   foregroundColor: Colors.white,
                            fixedSize: const Size(180, 50),
                            //  maximumSize: Size(250, 50)
                          ),
                          onPressed: () {
                            Navigator.pushReplacement(
                              context,
                              PageRouteBuilder(
                                pageBuilder:
                                    (context, animation, secondaryAnimation) =>
                                         Signup(),
                                transitionsBuilder: (context, animation,
                                        secondaryAnimation, child) =>
                                    SlideTransition(
                                  position: Tween<Offset>(
                                    begin: const Offset(1, 0),
                                    end: Offset.zero,
                                  ).animate(animation),
                                  child: child,
                                ),
                              ),
                            );
                          },
                          child:
                              SmallText(text: 'Sign up', color: Colors.white))

                      // PrimaryButton(TapAction: (){}, text: 'Login', color: AppColors.PrimaryColor, icon: Icons.login),
                      // PrimaryButton(TapAction: (){}, text: 'Sign up', color: AppColors.SecodaryColor, icon: Icons.app_registration_rounded),
                    ],
                  )
                  //   Center(child: SmallText(text: 'I agreed to all terms and conditions for signing up\nRead terms and conditions',color: Color.fromARGB(255, 183, 183, 183),)),
                ],
              ),
            ]),
      ),
    );
  }
}
