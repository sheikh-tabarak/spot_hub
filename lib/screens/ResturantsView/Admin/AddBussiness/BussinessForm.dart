import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:spot_hub/configurations/BigText.dart';
import 'package:spot_hub/screens/ResturantsView/Admin/AddBussiness/AddBussiness.dart';
import 'package:spot_hub/screens/ResturantsView/Admin/AddBussiness/AddEmail.dart';
import 'package:spot_hub/widgets/BoxedTextField.dart';

class BussinessForm extends StatefulWidget {
  const BussinessForm({super.key});

  @override
  State<BussinessForm> createState() => _BussinessFormState();
}

class _BussinessFormState extends State<BussinessForm> {
  TextEditingController bussinessname = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: BigText(text: ""),
      ),
      body: Stepper(type: StepperType.horizontal, steps: [
        Step(
          title: Row(
            children: const [
              Icon(Icons.email),
             // BigText(text: "Bussiness Name")
            ],
          ),
          content: Container(
            padding: const EdgeInsets.all(10),
            child: BoxedTextField(
              TapAction: () {
                print("input");
              },
              controller: bussinessname,
              icon: Icons.business,
              placeholder: 'Write a bussiness name',
            ),
          ),
        ),
        Step(
          title: Row(
            children: [const Icon(Icons.business), 
         //   BigText(text: " Email")
            ],
          ),
          content: Container(
            padding: const EdgeInsets.all(10),
            child: BoxedTextField(
              TapAction: () {
                print("input");
              },
              controller: bussinessname,
              icon: Icons.business,
              placeholder: 'Write an email say, admin@spothub.com"',
            ),
          ),
        ),
        //Step(title:Row(children: [const Icon(Icons.email),BigText(text: " Add Email")],) , content: AddEmail())
      ]),
    );
  }
}
