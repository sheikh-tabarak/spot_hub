// ignore_for_file: avoid_print, file_names, prefer_final_fields

import 'package:flutter/material.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';
import 'package:spot_hub/extras/LocationFunctions.dart';
import 'package:spot_hub/configurations/AppColors.dart';
import 'package:spot_hub/configurations/BigText.dart';
import 'package:spot_hub/configurations/Dimensions.dart';
import 'package:spot_hub/configurations/SmallText.dart';
import 'package:spot_hub/models/UserModels/Authentication.dart';
import 'package:spot_hub/models/UserModels/UserClass.dart';
import 'package:spot_hub/widgets/default_widgets/Loading.dart';
import 'package:spot_hub/screens/UserLogin/admin/Login.dart';
import 'package:spot_hub/widgets/primary_widgets/BoxedTextField.dart';
import 'package:spot_hub/widgets/primary_widgets/PrimayButton.dart';
import 'package:spot_hub/widgets/primary_widgets/PlaneTextField.dart';

class Signup extends StatefulWidget {
  bool isLoading = false;
  Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

String _CurrentAddress = "N/A";

class _SignupState extends State<Signup> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  String thisiserror = "";
  String LoadingMessage = "Registring User";

  @override
  initState() {
    _emailController.text = "tabarakyaseen@gmail.com";
    _nameController.text = "sheikhtabarak";
    _passwordController.text = "12341234";
    _phoneController.text = "030001233";

    //  FetchCurrentLocation().then((value) {
    //   setState(() {
    //     _CurrentAddress = value;
    //   });
    //   _CurrentAddress = value;
    // });

    print(_CurrentAddress);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkBackgroundColor,
      body: widget.isLoading == true
          ? Loading(
              message: LoadingMessage,
            )
          : Container(
              alignment: Alignment.center,
              child: SingleChildScrollView(
                child: Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Image(
                          width: 130,
                          height: 130,
                          image: AssetImage('assets/images/logo.png')),
                      const SizedBox(
                        height: 30,
                      ),
                      BigText(
                        text: "Register a new account",
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
                        icon: Icons.account_box,
                        placeholder: 'Name',
                        controller: _nameController,
                      ),
                      PlaneTextField(
                        onChange: (value) => {
                          setState(() {
                            thisiserror = "";
                          })
                        },
                        icon: Icons.phone,
                        placeholder: 'Phone',
                        controller: _phoneController,
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
                        onChange: (value) => {
                          setState(() {
                            thisiserror = "";
                          })
                        },
                        icon: Icons.lock,
                        placeholder: 'Password',
                        controller: _passwordController,
                      ),
                      PrimaryButton(
                          icon: Icons.account_circle,
                          TapAction: () async {
                            setState(() {
                              widget.isLoading = true;
                            });
                            if (_nameController.text == "" ||
                                _passwordController.text == "" ||
                                _emailController.text == "" ||
                                _phoneController.text == "") {
                              setState(() {
                                widget.isLoading = false;
                                thisiserror = "One or more fields are empty";
                              });
                            } else {
                              bool shouldNavigate = await register(
                                  _emailController.text,
                                  _passwordController.text);

                              if (shouldNavigate) {
                                setState(() {
                                  LoadingMessage =
                                      "Fetching your current Location";
                                });
                                await FetchCurrentLocation().then((value) {
                                  setState(() {
                                    _CurrentAddress = value;
                                    //   print(_CurrentAddress);
                                  });
                                  //  print(_CurrentAddress);
                                  // _CurrentAddress = value;
                                });
                                // .timeout(Duration(seconds: 2), onTimeout: () {
                                //   _CurrentAddress = "Unable to Access";
                                //  });
                                setState(() {
                                  LoadingMessage = "Saving all Details";
                                });
                                await RegisterNewUser(
                                    "https://upload.wikimedia.org/wikipedia/commons/thumb/1/12/User_icon_2.svg/330px-User_icon_2.svg.png",
                                    _nameController.text,
                                    _passwordController.text,
                                    _emailController.text,
                                    _phoneController.text,
                                    _CurrentAddress);

                                setState(() {
                                  LoadingMessage = "Registed Successfully";
                                });

                                print(
                                    "${_emailController.text} Registered Successfully");

                                setState(() {
                                  widget.isLoading = false;
                                });

                                // ignore: use_build_context_synchronously
                                QuickAlert.show(
                                    context: context,
                                    type: QuickAlertType.success,
                                    text: 'Account Registered Successfully!',
                                    confirmBtnText: "Login",
                                    confirmBtnColor: AppColors.PrimaryColor,
                                    onConfirmBtnTap: () {
                                      Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                              builder: ((context) => Login())));
                                    },
                                    backgroundColor: Colors.white);
                              } else {
                                setState(() {
                                  widget.isLoading = false;
                                });

                                print("this is first > " + thisiserror);
                                thisiserror = message.toString().replaceRange(
                                    message.toString().indexOf("["),
                                    message.toString().indexOf("]") + 2,
                                    "");
                                print("this is after > " + thisiserror);

                                //    thisiserror = message;

                                // print(message);
                              }

                              // Navigator.push(context, MaterialPageRoute(builder: (context)=>RecordIntrests()));
                              // print(
                              //     'Entered Name: ${nameController.text},\nEntered Phone: ${phoneController.text},\nEntered Email: ${emailController.text},\nEntered Password: ${passwordController.text}');
                            }
                          },
                          text: 'Register',
                          color: AppColors.PrimaryColor),
                      SizedBox(
                        height: Dimensions.height30,
                      ),
                      Center(
                        child: SmallText(
                          text: 'Already have an account ?',
                          color: const Color.fromARGB(255, 174, 174, 174),
                        ),
                      ),
                      SizedBox(
                        height: Dimensions.height15,
                      ),
                      PrimaryButton(
                          icon: Icons.login,
                          TapAction: () => {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Login()))
                              },
                          text: 'Login',
                          color: AppColors.SecodaryColor),
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}
