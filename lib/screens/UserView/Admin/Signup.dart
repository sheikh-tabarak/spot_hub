// ignore_for_file: avoid_print, file_names

import 'package:flutter/material.dart';
import 'package:spot_hub/configurations/AppColors.dart';
import 'package:spot_hub/configurations/BigText.dart';
import 'package:spot_hub/configurations/Dimensions.dart';
import 'package:spot_hub/configurations/SmallText.dart';
import 'package:spot_hub/screens/UserView/Admin/Login.dart';
import 'package:spot_hub/widgets/others/PrimayButton.dart';
import 'package:spot_hub/widgets/others/PlaneTextField.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController();
    TextEditingController phoneController = TextEditingController();
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
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
                BigText(text: "Create a new account",color:AppColors.PrimaryColor,),
                  const SizedBox(
                  height: 30,
                ),
                PlaneTextField(
              
                   icon: Icons.account_box,
                  placeholder: 'Name',
                  controller: nameController,
                ),
                PlaneTextField(
              
                   icon: Icons.phone,
                  placeholder: 'Phone',
                  controller: phoneController,
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
                  icon:Icons.account_circle,
                    TapAction: () => {
                          print(
                              'Entered Name: ${nameController.text},\nEntered Phone: ${phoneController.text},\nEntered Email: ${emailController.text},\nEntered Password: ${passwordController.text}')
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
