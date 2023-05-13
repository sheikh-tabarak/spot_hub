// ignore_for_file: non_constant_identifier_names, file_names

import 'package:flutter/material.dart';
import 'package:spot_hub/configurations/BigText.dart';
import 'package:spot_hub/screens/BussinessLogin/Notifications.dart';
import 'package:spot_hub/screens/BussinessLogin/SideDrawer.dart';
import 'package:spot_hub/screens/Loading.dart';
import 'package:spot_hub/screens/BussinessLogin/ManageBussiness/Dashboard.dart';
import 'package:spot_hub/screens/BussinessLogin/ManageBussiness/MyBussinessProfile.dart';
import 'package:spot_hub/screens/BussinessLogin/ManageProducts/ProductsList.dart';
import 'package:spot_hub/screens/UserLogin/Home/MainPage.dart';

import '../../../configurations/AppColors.dart';

class BussinessHome extends StatefulWidget {
  const BussinessHome({super.key});

  @override
  State<BussinessHome> createState() => _BussinessHomeState();
}

class _BussinessHomeState extends State<BussinessHome> {
  @override
  void initState() {
    super.initState();
  }

  int _PageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        backgroundColor: Colors.white,
        width: 250,
        child: SideDrawer(),
      ),
      backgroundColor: AppColors.lightBackgroundColor,
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: ((context) => Notifications())));
              },
              icon: Icon(Icons.notifications)),
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: ((context) => MainPage(
                              isLoggedin: true,
                              PI: 1,
                            ))));
              },
              icon: Icon(Icons.switch_account))
        ],
        title: _PageIndex == 0
            ? const Text('Statistcs')
            : _PageIndex == 1
                ? const Text('All Items')
                : _PageIndex == 2
                    ? const Text('Kinara Hotel')
                    : const Text('Error'),
        backgroundColor: AppColors.PrimaryColor,
      ),
      body: _PageIndex == 0
          ? Dashboard()
          : _PageIndex == 1
              ? const ProductsList()
              : _PageIndex == 2
                  ? const MyBussinessProfile()
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
          BottomNavigationBarItem(
              icon: Icon(Icons.analytics), label: 'Dashboard'),
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
