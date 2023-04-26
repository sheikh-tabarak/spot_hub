// ignore_for_file: avoid_print, file_names

import 'package:flutter/material.dart';
import 'package:spot_hub/configurations/AppColors.dart';
import 'package:spot_hub/configurations/BigText.dart';
import 'package:spot_hub/configurations/Dimensions.dart';
import 'package:spot_hub/configurations/SmallText.dart';
import 'package:spot_hub/database/Authentication.dart';
import 'package:spot_hub/models/UserModels/UserClass.dart';
import 'package:spot_hub/screens/UserView/Admin/Login.dart';
import 'package:spot_hub/screens/UserView/Admin/RecordIntrests.dart';
import 'package:spot_hub/widgets/others/BoxedTextField.dart';
import 'package:spot_hub/widgets/others/PrimayButton.dart';
import 'package:spot_hub/widgets/others/PlaneTextField.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  String thisiserror = "";

  @override
  initState() {
    _emailController.text = "tabarakyaseen@gmail.com";
    _nameController.text = "sheikhtabarak";
    _passwordController.text = "12341234";
    _phoneController.text = "030001233";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkBackgroundColor,
      body: Container(
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
                  margin: EdgeInsets.only(left: 12,right: 12),
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
                        color: thisiserror == "" ? Colors.black : Colors.white,
                      ),
                      SizedBox(
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
                      if (_nameController.text == "" ||
                          _passwordController.text == "" ||
                          _emailController.text == "" ||
                          _phoneController.text == "") {
                        setState(() {
                          thisiserror = "One or more fields are empty";
                        });
                      } else {
                        bool shouldNavigate = await register(
                            _emailController.text, _passwordController.text);

                        if (shouldNavigate) {
                          RegisterNewUser(
                              "https://upload.wikimedia.org/wikipedia/commons/thumb/1/12/User_icon_2.svg/330px-User_icon_2.svg.png",
                              _nameController.text,
                              _passwordController.text,
                              _emailController.text,
                              _phoneController.text,
                              "Gujranwala, Pakistan"
                              );
                          print("${_emailController.text} Registered Successfully");
                        } else {
                          setState(() {       
                            print("this is first > "+thisiserror);
                     thisiserror = message.toString().replaceRange(message.toString().indexOf("["), message.toString().indexOf("]")+2, "");
                     print("this is after > "+thisiserror);

                        //    thisiserror = message;
                          });

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
                          Navigator.pushReplacement(context,
                              MaterialPageRoute(builder: (context) => Login()))
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
