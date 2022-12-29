// ignore_for_file: avoid_print, file_names

import 'package:flutter/material.dart';
import 'package:spot_hub/configurations/AppColors.dart';
import 'package:spot_hub/models/UserModels/User.dart';
import 'package:spot_hub/screens/UserView/Admin/Signup.dart';
import 'package:spot_hub/screens/UserView/Home/MainPage.dart';
import 'package:spot_hub/widgets/PrimayButton.dart';
import 'package:spot_hub/widgets/PlaneTextField.dart';

import '../../../configurations/Dimensions.dart';
import '../../../configurations/SmallText.dart';
import '../Customer/MainHome.dart';
import '../../../models/DummyData.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String onetimeusername = '';
  String onetimepassword = '';

  // User U = new User(
  //     image: '',
  //     username: '',
  //     password: '',
  //     email: '',
  //     PhoneNo: '',
  //     Intrests: '');

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    User Ue;
    return Scaffold(
      backgroundColor: AppColors.darkBackgroundColor,
      body: Container(
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Image(
                    width: 180,
                    height: 180,
                    image: AssetImage('assets/images/logo.png')),
                const SizedBox(
                  height: 40,
                ),
                PlaneTextField(
                  icon: Icons.email,
                  placeholder: 'Email',
                  controller: emailController,
                ),
                PlaneTextField(
                  icon: Icons.lock,
                  placeholder: 'Password',
                  controller: passwordController,
                ),
                PrimaryButton(
                    icon: Icons.login,
                    TapAction: () => {
                          for (int i = 0; i < DummyUsers.length; i++)
                            {
                              if (DummyUsers[i].email == emailController.text)
                                {
                                  setState(() => {
                                        onetimeusername = DummyUsers[i].email,
                                        onetimepassword =
                                            DummyUsers[i].password,

                                        if (onetimepassword ==
                                            passwordController.text)
                                          {
                                            Navigator.pushReplacement(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) => MainPage(
                                                    MainUser: User(
                                                        image:
                                                            DummyUsers[i].image,
                                                        username: DummyUsers[i]
                                                            .username,
                                                        password: DummyUsers[i]
                                                            .password,
                                                        email:
                                                            DummyUsers[i].email,
                                                        PhoneNo: DummyUsers[i]
                                                            .PhoneNo,
                                                        Intrests: DummyUsers[i]
                                                            .Intrests),
                                                    isLoggedin: true),

                                                    
                                              ),
                                            ),
                                            //  Ue = User(
                                            // image: DummyUsers[i].image,
                                            // username: DummyUsers[i].username,
                                            // password: DummyUsers[i].password,
                                            // email: DummyUsers[i].email,
                                            // PhoneNo: DummyUsers[i].PhoneNo,
                                            // Intrests: DummyUsers[i].Intrests),
                                          }
                                        // ignore: unnecessary_new
                                        // U = new User(
                                        //     image: DummyUsers[i].image,
                                        //     username: DummyUsers[i].username,
                                        //     password: DummyUsers[i].password,
                                        //     email: DummyUsers[i].email,
                                        //     PhoneNo: DummyUsers[i].PhoneNo,
                                        //     Intrests: DummyUsers[i].Intrests),
                                      }),
                                }
                              else
                                {}
                            },
                          if (onetimeusername != '')
                            {
                              // Navigator.pushReplacement(
                              //     context,
                              //     MaterialPageRoute(
                              //         builder: (context) => MainPage()))
                            }
                          else
                            {
                              print(
                                  'Entered Email: ${emailController.text},\nEntered Password: ${passwordController.text}')
                            },
                        },
                    text: 'Login',
                    color: AppColors.PrimaryColor),
                SizedBox(
                  height: Dimensions.height30,
                ),
                Center(
                  child: SmallText(
                    text: 'Don\'t have an account ?',
                    color: const Color.fromARGB(255, 174, 174, 174),
                  ),
                ),
                SizedBox(
                  height: Dimensions.height15,
                ),
                PrimaryButton(
                    icon: Icons.account_circle,
                    TapAction: () => {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Signup()))
                        },
                    text: 'Sign Up',
                    color: AppColors.SecodaryColor),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
