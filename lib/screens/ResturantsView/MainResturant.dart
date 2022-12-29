// ignore_for_file: non_constant_identifier_names, file_names

import 'package:flutter/material.dart';
import 'package:spot_hub/configurations/BigText.dart';
import 'package:spot_hub/screens/ResturantsView/AddFood.dart';
import 'package:spot_hub/screens/ResturantsView/ResturantAccount.dart';
import 'package:spot_hub/screens/ResturantsView/ResturantItems.dart';

import '../../configurations/AppColors.dart';

class MainResturant extends StatefulWidget {
  const MainResturant({super.key});

  @override
  State<MainResturant> createState() => _MainResturantState();
}

class _MainResturantState extends State<MainResturant> {
  @override
  void initState() {
    super.initState();
  }

  int _PageIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightBackgroundColor,
      appBar: AppBar(
        title: 
        _PageIndex==0?
        const Text('Add New Food Item'):
        _PageIndex==1?
         const Text('All Items'):
         _PageIndex==2?
         const Text('Kinara Hotel'):
         const Text('Error')

        ,
        backgroundColor: AppColors.PrimaryColor,
      ),
      body: _PageIndex == 0
          ? const AddFood()
          : _PageIndex == 1
              ? const ResturantItems()
              : _PageIndex == 2
                  ? const ResturantAccount()
                  : Center(
                      child: BigText(
                        text: 'Error',
                        color: Colors.white,
                      ),
                    ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: AppColors.lightBackgroundColor,
        currentIndex: _PageIndex,
        // unselectedItemColor: Colors.white,
        selectedItemColor: AppColors.PrimaryColor,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.add), label: 'Add Item'),
          BottomNavigationBarItem(icon: Icon(Icons.fastfood), label: 'Items'),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle), label: 'Resturant'),
        ],
        onTap: ((value) => {
              setState(() {
                _PageIndex = value;
              })
            }),
      ),
    );
  }
}
