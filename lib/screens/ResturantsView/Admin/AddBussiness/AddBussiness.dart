// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:spot_hub/configurations/AppColors.dart';
import 'package:spot_hub/configurations/BigText.dart';
import 'package:spot_hub/configurations/SmallText.dart';
import 'package:spot_hub/screens/ResturantsView/Admin/AddBussiness/AddEmail.dart';
import 'package:spot_hub/widgets/BoxedTextField.dart';
import 'package:spot_hub/widgets/PlaneTextField.dart';
import 'package:spot_hub/widgets/PrimayButton.dart';

class AddBussiness extends StatefulWidget {
  AddBussiness({super.key});

  @override
  State<AddBussiness> createState() => _AddBussinessState();
}

class _AddBussinessState extends State<AddBussiness> {
  TextEditingController bussinessname = TextEditingController();
 bool _isVisible = true;

 void Navigates(){
  print("d");
 }

  var cities = ["A", "B"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => {Navigator.pop(context)},
          icon: const Icon(Icons.close),
        ),
        title: const Text("Add Bussiness"),
        actions: [
          TextButton(
              onPressed: () {
                print("Bussiness Added");
              },
              child: SmallText(
                text: "Submit",
                color: Colors.white,
              ))
        ],
      ),
      body: //Container(

          AnimatedContainer(
        duration: Duration(seconds: 1),
        curve: Curves.fastOutSlowIn,
        width: _isVisible ? 400.0 : 0.0,
        // height: 220.0,
        // color: Colors.red,
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(15),
              child: Column(
                children: [
                  BigText(
                    text: "Hello! Let\’s start with your business name",
                    size: 30,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SmallText(
                      text:
                          "We\’ll use this information to help you claim your Spot hub page. Your business will come up automatically if it is already listed."),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: BoxedTextField(
                TapAction: () {
                   print("input");
                },
                controller: bussinessname,
                icon: Icons.business,
                placeholder: 'Write a bussiness name say "Spot Hub"',
              ),
            ),
            PrimaryButton(
                ButtonRadius: 5,
                text: 'Continue',
                icon: Icons.arrow_forward,
                TapAction: () => {
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) => AddEmail()))
                    },
                 //   TapAction: () => Navigates,
                    // {
                    //    print("button"),
                    //       Navigator.pushReplacement(
                    //           context,
                    //           MaterialPageRoute(
                    //               builder: (context) =>  AddEmail()))
                    //     },
                color: AppColors.PrimaryColor),
          ],
        ),
      ),
    );
  }
}
