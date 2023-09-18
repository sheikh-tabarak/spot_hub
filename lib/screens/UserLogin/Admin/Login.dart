// ignore_for_file: avoid_print, file_names, unused_import

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:overlay_loader_with_app_icon/overlay_loader_with_app_icon.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';
import 'package:spot_hub/configurations/AppColors.dart';
import 'package:spot_hub/configurations/BigText.dart';
import 'package:spot_hub/models/UserModels/Authentication.dart';
import 'package:spot_hub/models/UserModels/UserClass.dart';
import 'package:spot_hub/widgets/default_widgets/Loading.dart';
import 'package:spot_hub/screens/UserLogin/admin/ForgetPassword.dart';
import 'package:spot_hub/screens/UserLogin/admin/Signup.dart';
import 'package:spot_hub/screens/UserLogin/home/MainPage.dart';
import 'package:spot_hub/widgets/primary_widgets/PrimayButton.dart';
import 'package:spot_hub/widgets/primary_widgets/PlaneTextField.dart';
import '../../../configurations/Dimensions.dart';
import '../../../configurations/SmallText.dart';
import '../../../models/DummyData.dart';

class Login extends StatefulWidget {
  bool isLoading = false;
  Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  String thisiserror = "";
  String LoadingMessage = "Logging in";

  @override
  initState() {
    // _emailController.text = "tabarakyaseen@gmail.com";
    // _passwordController.text = "12341234";
  }

  @override
  Widget build(BuildContext context) {
    UserClass Ue;
    return Scaffold(
      backgroundColor: AppColors.darkBackgroundColor,
      body: widget.isLoading == true
          ?
          // Center(child: SizedBox(width: 1,),)
          //  QuickAlert.show(

          //                           context: context,
          //                           type: QuickAlertType.loading,
          //                           text: 'Account Registered Successfully!',
          //                         //  confirmBtnText:"Login",
          //                        //   confirmBtnColor: AppColors.PrimaryColor,
          //                           // onConfirmBtnTap: () {
          //                           //   Navigator.pushReplacement(context, MaterialPageRoute(builder: ((context) => Login())));
          //                           // },

          //                           backgroundColor:Colors.white
          //                         )
          Loading(
              message: LoadingMessage,
            )

          //       OverlayLoaderWithAppIcon(
          //         borderRadius:20,
          //         circularProgressColor:AppColors.PrimaryColor,
          //         overlayOpacity: 1,
          //         //appIconSize: 10,
          //         overlayBackgroundColor: Colors.black,
          //     isLoading: true,
          //     appIcon:  Icon(Icons.stop_circle,color: AppColors.PrimaryColor,),
          //    // Image.asset('assets/images/appicon.png',width: 10,),
          //     child: Container(
          //    child: Text("")
          // ))
          : Container(
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
                      const SizedBox(
                        height: 30,
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 12, right: 12),
                        padding: const EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          color: thisiserror == "" ? Colors.black : Colors.red,
                          borderRadius: BorderRadius.circular(7),
                        ),
                        child: Row(
                          //  crossAxisAlignment: WrapCrossAlignment.center,
                          // alignment: WrapAlignment.spaceEvenly,
                          // direction: Axis.horizontal,
                          //    mainAxisSize: MainAxisSize.min,
                          verticalDirection: VerticalDirection.down,
                          textDirection: TextDirection.ltr,
                          //   crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.error,
                              color: thisiserror == ""
                                  ? Colors.black
                                  : Colors.white,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: SmallText(
                                iscentre: false,
                                text: thisiserror,
                                color: const Color.fromARGB(255, 255, 255, 255),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      PlaneTextField(
                        onChange: (value) => {
                          setState(() {
                            thisiserror = "";
                          })
                        },
                        icon: Icons.email,
                        placeholder: 'Email',
                        controller: _emailController,
                      ),

                      PlaneTextField(
                        isPassword: true,
                        onChange: (value) => {
                          setState(() {
                            thisiserror = "";
                          })
                        },
                        icon: Icons.lock,
                        placeholder: 'Password',
                        controller: _passwordController,
                      ),

                      // PlaneTextField(
                      //   isPassword: true,
                      //   onChange: (value) => {
                      //     setState(() {
                      //       thisiserror = "";
                      //     })
                      //   },
                      //   icon: Icons.lock,
                      //   placeholder: ' Confirm Password',
                      //   controller: _passwordController,
                      // ),

                      PrimaryButton(
                          icon: Icons.login,
                          TapAction: () async {
                            setState(() {
                              widget.isLoading = true;
                            });
                            if (_emailController.text.isEmpty ||
                                _passwordController.text.isEmpty) {
                              setState(() {
                                thisiserror = "One or more fields are empty";
                                widget.isLoading = false;
                              });
                            } else {
                              bool shouldLogin = await signIn(
                                  _emailController.text,
                                  _passwordController.text);

                              if (shouldLogin) {
                                setState(() {
                                  LoadingMessage = "Logged In Successfully";
                                });
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => MainPage(
                                            PI: 0,
                                            MainUser: UserClass(
                                                IsBussiness: false,
                                                image: "image",
                                                username: "username",
                                                password: "password",
                                                email: "email",
                                                PhoneNo: "PhoneNo",
                                                Intrests: "Intrests",
                                                Address: 'address',
                                                UserId: "userid"),
                                            isLoggedin: true)));
                              } else {
                                setState(() {
                                  thisiserror = message.toString().replaceRange(
                                      message.toString().indexOf("["),
                                      message.toString().indexOf("]") + 2,
                                      "");
                                  widget.isLoading = false;

                                  print("this is after > $thisiserror");
                                });
                              }
                            }
                          },
                          text: 'Login',
                          color: AppColors.PrimaryColor),

                      GestureDetector(
                        onTap: () async {
                          Fluttertoast.showToast(
                              msg: "Google Signin is not enabled yet");

                          //   await signInWithGoogle();
                          // await RegisterNewUser(
                          //     "https://upload.wikimedia.org/wikipedia/commons/thumb/1/12/User_icon_2.svg/330px-User_icon_2.svg.png",
                          //     _nameController.text,
                          //     _passwordController.text,
                          //     _emailController.text,
                          //     _phoneController.text,
                          //     _CurrentAddress);
                        },
                        child: Container(
                          height: 50,
                          width: double.infinity,
                          margin: const EdgeInsets.all(15),
                          // padding: EdgeInsets.all(15),
                          decoration: BoxDecoration(
                            image: const DecorationImage(
                                image: AssetImage("assets/images/google.png"),
                                fit: BoxFit.cover),
                            borderRadius: BorderRadius.circular(10),
                          ),

                          child: const SizedBox(),
                        ),
                      ),

                      // Image(image: AssetImage("assets/images/google.png")),
                      // Container(
                      //   margin: EdgeInsets.only(
                      //       top: 20, bottom: 20, right: 30, left: 30),
                      //   padding: EdgeInsets.all(15),
                      //   decoration: BoxDecoration(
                      //       border: Border.all(width: 2, color: Colors.grey),
                      //       borderRadius: BorderRadius.circular(50)),
                      //   child: Row(
                      //     children: [
                      //       Image(image: NetworkImage("url")),
                      //       BigText(text: "Sign in with Google")
                      //     ],
                      //   ),
                      // ),

                      SizedBox(
                        height: Dimensions.height10,
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
                                          builder: (context) => MainPage(
                                            PI: 0,
                                            isLoggedin: false,
                                          ),
                                        ))
                                  },
                              child: SmallText(
                                text: "Guest Mode",
                                color: AppColors.PrimaryColor,
                              )),
                        ],
                      ),
                      SizedBox(
                        height: Dimensions.height10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SmallText(
                            text: 'Forget Password ?',
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
                                          builder: (context) =>
                                              const ForgetPassword(),
                                        ))
                                  },
                              child: SmallText(
                                text: "Reset it",
                                color: AppColors.PrimaryColor,
                              )),
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
                                        builder: (context) => Signup()))
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
