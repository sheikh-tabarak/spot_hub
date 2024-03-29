import 'package:flutter/material.dart';
import 'package:spot_hub/configurations/AppColors.dart';
import 'package:spot_hub/configurations/BigText.dart';
import 'package:spot_hub/configurations/Dimensions.dart';
import 'package:spot_hub/configurations/SmallText.dart';
import 'package:spot_hub/models/UserModels/Authentication.dart';
import 'package:spot_hub/widgets/default_widgets/Loading.dart';
import 'package:spot_hub/screens/UserLogin/admin/Login.dart';
import 'package:spot_hub/screens/UserLogin/admin/Signup.dart';
import 'package:spot_hub/screens/UserLogin/home/MainPage.dart';
import 'package:spot_hub/widgets/primary_widgets/PlaneTextField.dart';
import 'package:spot_hub/widgets/primary_widgets/PrimayButton.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({super.key});

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  TextEditingController _emailController = TextEditingController();
  String thisiserror = "";
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkBackgroundColor,
      body: isLoading == true
          ? Loading(
              message: "Sending the reset link to email...",
            )
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
                      BigText(
                        text: "Forget Password",
                        size: 20,
                        color: AppColors.PrimaryColor,
                      ),
                      const SizedBox(
                        height: 15,
                      ),

                      Container(
                        margin: const EdgeInsets.only(left: 12, right: 12),
                        padding: const EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          color:
                              thisiserror == "" ? Colors.black : Colors.green,
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
                              Icons.check_circle,
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
                        isEnabled: thisiserror == "" ? true : false,
                        onChange: (value) => {
                          setState(() {
                            thisiserror = "";
                          })
                        },
                        icon: Icons.email,
                        placeholder: 'Email',
                        controller: _emailController,
                      ),
                      // PlaneTextField(
                      //   onChange: (value) => {
                      //     setState(() {
                      //       thisiserror = "";
                      //     })
                      //   },
                      //   icon: Icons.lock,
                      //   placeholder: 'Password',
                      //   controller: _passwordController,
                      // ),
                      PrimaryButton(
                          icon: Icons.login,
                          TapAction: () async {
                            //  QuickAlert.show(

                            //   context: context,
                            //   type: QuickAlertType.loading,
                            //   text: LoadingMessage,
                            //   backgroundColor:Colors.white,
                            //   autoCloseDuration:Duration()
                            // );

                            setState(() {
                              isLoading = true;
                            });

                            await resetmypassword(_emailController.text);

                            setState(() {
                              thisiserror =
                                  "Reset Password link sent to your email";

                              isLoading = false;
                            });

                            // if (_emailController.text.isEmpty ||
                            //     _passwordController.text.isEmpty) {
                            //   setState(() {
                            //     thisiserror = "One or more fields are empty";
                            //     widget.isLoading = false;
                            //   });
                            // } else {
                            //   bool shouldLogin = await signIn(
                            //       _emailController.text,
                            //       _passwordController.text);

                            //   if (shouldLogin) {
                            //     setState(() {
                            //       LoadingMessage = "Logged In Successfully";
                            //     });
                            //     Navigator.pushReplacement(
                            //         context,
                            //         MaterialPageRoute(
                            //             builder: (context) => MainPage(
                            //                 PI: 0,
                            //                 MainUser: UserClass(
                            //                     IsBussiness: false,
                            //                     image: "image",
                            //                     username: "username",
                            //                     password: "password",
                            //                     email: "email",
                            //                     PhoneNo: "PhoneNo",
                            //                     Intrests: "Intrests",
                            //                     Address: 'address',
                            //                     UserId: "userid"),
                            //                 isLoggedin: true)));
                            //   } else {
                            //     setState(() {
                            //       thisiserror = message.toString().replaceRange(
                            //           message.toString().indexOf("["),
                            //           message.toString().indexOf("]") + 2,
                            //           "");
                            //       widget.isLoading = false;

                            //       print("this is after > " + thisiserror);
                            //     });
                            //   }
                            // }
                            // onetimeusername = "",
                            // onetimepassword = "",

                            // for (int i = 0; i < DummyUsers.length; i++)
                            //   {
                            //     if (DummyUsers[i].email ==
                            //         widget._emailController.text)
                            //       {
                            //         setState(() => {
                            //               onetimeusername = DummyUsers[i].email,
                            //               onetimepassword =
                            //                   DummyUsers[i].password,
                            //               if (onetimepassword ==
                            //                   widget._passwordController.text)
                            //                 {
                            //                   Navigator.pushReplacement(
                            //                     context,
                            //                     MaterialPageRoute(
                            //                       builder: (context) => MainPage(
                            //                           MainUser: User(
                            //                               image:
                            //                                   DummyUsers[i].image,
                            //                               username: DummyUsers[i]
                            //                                   .username,
                            //                               password: DummyUsers[i]
                            //                                   .password,
                            //                               email:
                            //                                   DummyUsers[i].email,
                            //                               PhoneNo: DummyUsers[i]
                            //                                   .PhoneNo,
                            //                               Intrests: DummyUsers[i]
                            //                                   .Intrests,
                            //                               IsBussiness: false),
                            //                           isLoggedin: true),
                            //                     ),
                            //                   ),
                            //                 }
                            //               else
                            //                 {
                            //                   ScaffoldMessenger.of(context)
                            //                       .showSnackBar(SnackBar(
                            //                     clipBehavior: Clip.hardEdge,
                            //                     dismissDirection:
                            //                         DismissDirection.down,
                            //                     content: SmallText(
                            //                       text: "Wrong Passoword",
                            //                       color: Colors.white,
                            //                     ),
                            //                     duration: const Duration(
                            //                         milliseconds: 500),
                            //                     backgroundColor: Colors.red,
                            //                     //margin: EdgeInsets.all(10),
                            //                   ))
                            //                 }
                            //             }),
                            //       }
                            //     else
                            //       {}
                            //   },

                            // if (onetimeusername == '')
                            //   {
                            //     ScaffoldMessenger.of(context)
                            //         .showSnackBar(SnackBar(
                            //       content: SmallText(
                            //         text: "No User Exists",
                            //         color: Colors.white,
                            //       ),
                            //       duration: const Duration(milliseconds: 500),
                            //       backgroundColor: Colors.red,
                            //     ))

                            //     // Navigator.pushReplacement(
                            //     //     context,
                            //     //     MaterialPageRoute(
                            //     //         builder: (context) => MainPage()))
                            //   }
                            // else
                            //   {
                            //     print(
                            //         'Entered Email: ${_emailController.text},\nEntered Password: ${_passwordController.text}')
                            //   },
                          },
                          text: 'Send Email',
                          color: AppColors.PrimaryColor),
                      SizedBox(
                        height: Dimensions.height30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SmallText(
                            text: 'Have a password ?',
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
                                          builder: (context) => Login(),
                                        ))
                                  },
                              child: SmallText(
                                text: "Login",
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
                          text: 'Sign up',
                          color: AppColors.SecodaryColor),
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}
