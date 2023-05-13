// ignore_for_file: non_constant_identifier_names, file_names

import 'package:flutter/material.dart';
import 'package:spot_hub/configurations/AppColors.dart';
import 'package:spot_hub/configurations/BigText.dart';
import 'package:spot_hub/screens/UserLogin/Admin/Login.dart';
import 'package:spot_hub/widgets/others/IconBox.dart';
import 'package:spot_hub/widgets/others/PrimayButton.dart';

class RecordIntrests extends StatefulWidget {
  const RecordIntrests({super.key});

  @override
  State<RecordIntrests> createState() => _RecordIntrestsState();
}

class _RecordIntrestsState extends State<RecordIntrests> {
  bool _desiSelected = false;
  bool _fastFoodSelected = false;
  bool _chineseSelected = false;
  bool _seaFoodSelected = false;
  bool _otherSelected = false;

  bool _isSelected = false;

  bool State = false;

  bool fastFood = false;
  bool Chineese = false;

  // @override
  // void initState() {
  //   super.initState();
  //   _animationController =
  //       AnimationController(vsync: this, duration: Duration(milliseconds: 300));
  //   _animation =
  //       Tween<double>(begin: 0.0, end: 1.0).animate(_animationController);
  // }

  // @override
  // void dispose() {
  //   _animationController.dispose();
  //   super.dispose();
  // }

  // void _onTap() {
  //   setState(() {
  //     _isSelected = !_isSelected;
  //     if (_isSelected) {
  //       _animationController.forward();
  //     } else {
  //       _animationController.reverse();
  //     }
  //   });
  // }

  selectIt() {
    setState(() {
      State = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.PrimaryColor,
        title: BigText(
          text: "Your Intrests",
          color: Colors.white,
        ),
      ),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 10, left: 10, right: 10),
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
                border: Border.all(
                    width: 1, color: const Color.fromARGB(255, 218, 218, 218)),
                borderRadius: const BorderRadius.all(Radius.circular(5))),
            child: CheckboxListTile(
              title: Text('Desi'),
              value: _desiSelected,
              //onChanged: (value) => {set},
              onChanged: (value) {
                setState(() {
                  _desiSelected = value!;
                });
              },
              secondary: Icon(
                Icons.local_dining,
                color: AppColors.PrimaryColor,
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 10, left: 10, right: 10),
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
                border: Border.all(
                    width: 1, color: const Color.fromARGB(255, 218, 218, 218)),
                borderRadius: const BorderRadius.all(Radius.circular(5))),
            child: CheckboxListTile(
              title: const Text('Fast Food'),
              value: _fastFoodSelected,
              onChanged: (value) {
                setState(() {
                  _fastFoodSelected = value!;
                });
              },
              secondary: Icon(
                Icons.fastfood,
                color: AppColors.PrimaryColor,
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 10, left: 10, right: 10),
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
                border: Border.all(
                    width: 1, color: const Color.fromARGB(255, 218, 218, 218)),
                borderRadius: const BorderRadius.all(Radius.circular(5))),
            child: CheckboxListTile(
              title: Text('Chinese'),
              value: _chineseSelected,
              onChanged: (value) {
                setState(() {
                  _chineseSelected = value!;
                });
              },
              secondary: Icon(
                Icons.restaurant,
                color: AppColors.PrimaryColor,
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 10, left: 10, right: 10),
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
                border: Border.all(
                    width: 1, color: const Color.fromARGB(255, 218, 218, 218)),
                borderRadius: const BorderRadius.all(Radius.circular(5))),
            child: CheckboxListTile(
              title: Text('Sea Food'),
              value: _seaFoodSelected,
              onChanged: (value) {
                setState(() {
                  _seaFoodSelected = value!;
                });
              },
              secondary: Icon(
                Icons.local_florist,
                color: AppColors.PrimaryColor,
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 10, left: 10, right: 10),
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
                border: Border.all(
                    width: 1, color: const Color.fromARGB(255, 218, 218, 218)),
                borderRadius: const BorderRadius.all(Radius.circular(5))),
            child: CheckboxListTile(
              title: Text('Other'),
              value: _otherSelected,
              onChanged: (value) {
                setState(() {
                  _otherSelected = value!;
                });
              },
              secondary: Icon(
                Icons.add,
                color: AppColors.PrimaryColor,
              ),
            ),
          ),
          PrimaryButton(
              TapAction: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Login()));
              },
              text: "Record & Proceed",
              color: AppColors.PrimaryColor,
              icon: Icons.arrow_forward)
        ],
      ),
    );

    // Scaffold(body:
    // Column(
    //       crossAxisAlignment: CrossAxisAlignment.center,
    //       mainAxisAlignment: MainAxisAlignment.end,
    //   children: [
    //     Row(
    //        mainAxisAlignment: MainAxisAlignment.center,
    //       children:  [

    //         IconBox(
    //     // isSelected:State ,
    //       mainIcon: Icons.food_bank,
    //       Text: 'Traditional', OnClickFuntion: () {  },
    //     ),
    //     IconBox(
    //     //  isSelected: Chineese,
    //       mainIcon: Icons.restaurant_menu,
    //       Text: 'Chineese', OnClickFuntion: () {  },
    //     ),
    //       ],
    //     ),

    //     Row(
    //        mainAxisAlignment: MainAxisAlignment.center,

    //       children:  [
    //         IconBox(
    //     // isSelected:State ,
    //       mainIcon: Icons.restaurant,
    //       Text: 'Desi Food', OnClickFuntion: () {  },
    //     ),
    //     IconBox(
    //     // isSelected:State ,
    //       mainIcon: Icons.fastfood,
    //       Text: 'Fast Food', OnClickFuntion: () {  },
    //     ),

    //       ],
    //     )

    //   ],
    // ));
  }
}
