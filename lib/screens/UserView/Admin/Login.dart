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
import '../../../models/DummyData.dart';

class Login extends StatefulWidget {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  //String errorMessage = "error message will go here";

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
                  controller: widget.emailController,
                ),
                PlaneTextField(
                  icon: Icons.lock,
                  placeholder: 'Password',
                  controller: widget.passwordController,
                ),
                // SizedBox(
                //   height: Dimensions.height5,
                // ),
                // SmallText(
                //   text: "error message will be there",
                //   color: Colors.red,
                // ),
                // SizedBox(
                //   height: Dimensions.height5,
                // ),
                PrimaryButton(
                    icon: Icons.login,
                    TapAction: () => {
                          onetimeusername = "",
                          onetimepassword = "",

                          for (int i = 0; i < DummyUsers.length; i++)
                            {
                              if (DummyUsers[i].email ==
                                  widget.emailController.text)
                                {
                                  setState(() => {
                                        onetimeusername = DummyUsers[i].email,
                                        onetimepassword =
                                            DummyUsers[i].password,
                                        if (onetimepassword ==
                                            widget.passwordController.text)
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
                                          }
                                        else
                                          {
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(SnackBar(
                                              clipBehavior: Clip.hardEdge,
                                              dismissDirection:
                                                  DismissDirection.down,
                                              content: SmallText(
                                                text: "Wrong Passoword",
                                                color: Colors.white,
                                              ),
                                              duration: const Duration(
                                                  milliseconds: 500),
                                              backgroundColor: Colors.red,
                                              //margin: EdgeInsets.all(10),
                                            ))
                                          }
                                      }),
                                }
                              else
                                {}
                            },

                          if (onetimeusername == '')
                            {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(
                                content: SmallText(
                                  text: "No User Exists",
                                  color: Colors.white,
                                ),
                                duration: const Duration(milliseconds: 500),
                                backgroundColor: Colors.red,
                              ))

                              // Navigator.pushReplacement(
                              //     context,
                              //     MaterialPageRoute(
                              //         builder: (context) => MainPage()))
                            }
                          // else
                          //   {
                          //     print(
                          //         'Entered Email: ${emailController.text},\nEntered Password: ${passwordController.text}')
                          //   },
                        },
                    text: 'Login',
                    color: AppColors.PrimaryColor),
                SizedBox(
                  height: Dimensions.height30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SmallText(
                      text: 'Don\'t have an account ?',
                      color: const Color.fromARGB(255, 174, 174, 174),
                    ),
                    SizedBox(
                      width: Dimensions.height10,
                    ),
                    GestureDetector(
                        onTap: () => {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const MainPage(
                                      MainUser: User(
                                          image:
                                              'https://img.freepik.com/free-vector/businessman-character-avatar-isolated_24877-60111.jpg?w=740&t=st=1677081971~exp=1677082571~hmac=b13326377bea0999c1b16be27d4abd1cc79cf557b219e67e462f76e24ef5516e',
                                          username: "Guest",
                                          password: "password",
                                          email: "guest@spothub.com",
                                          PhoneNo: "PhoneNo",
                                          Intrests: "Intrests"),
                                      isLoggedin: false,
                                    ),
                                  ))
                            },
                        child: SmallText(
                          text: "Guest Mode",
                          color: AppColors.PrimaryColor,
                        ))
                  ],
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
