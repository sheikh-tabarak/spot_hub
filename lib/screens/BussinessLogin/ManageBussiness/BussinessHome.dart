// ignore_for_file: non_constant_identifier_names, file_names

import 'package:flutter/material.dart';

import 'package:spot_hub/configurations/BigText.dart';
import 'package:spot_hub/models/BusinessModels/Bussiness.dart';
import 'package:spot_hub/screens/BussinessLogin/ManageBussiness/Dashboard.dart';
import 'package:spot_hub/screens/BussinessLogin/ManageBussiness/MyBussinessProfile.dart';
import 'package:spot_hub/screens/BussinessLogin/ManageProducts/AddProduct.dart';
import 'package:spot_hub/screens/BussinessLogin/ManageProducts/ProductsList.dart';
import 'package:spot_hub/screens/BussinessLogin/Notifications.dart';
import 'package:spot_hub/screens/BussinessLogin/SideDrawer.dart';
import 'package:spot_hub/screens/Loading.dart';
import 'package:spot_hub/screens/UserLogin/Home/MainPage.dart';

import '../../../configurations/AppColors.dart';

class BussinessHome extends StatefulWidget {
  int PageIndex;
  BussinessHome({Key? key, this.PageIndex = 0}) : super(key: key);

  @override
  State<BussinessHome> createState() => _BussinessHomeState();
}

class _BussinessHomeState extends State<BussinessHome> {
  int Total = 0;
  bool isLoading = false;
  Bussiness CurrentBussiness = const Bussiness(
    BussinessId: "",
    BussinessName: "",
    BussinessImageUrl: "",
    BussinessEmail: "",
    BussinessAddress: "",
    BussinessCity: "",
    BussinessPhone: "",
    BussinessType: "",
    BussinessWebsite: "",
    Reports: 0,
  );

  String myBussinessId = "";
  String myBussinessName = "";
  String myBussinessImageUrl = "";
  String myBussinessEmail = "";
  String myBussinessAddress = "";
  String myBussinessCity = "";
  String myBussinessPhone = "";
  String myBussinessType = "";
  String myBussinessWebsite = "";
  int myReports = 0;

  @override
  void initState() {
    super.initState();

    try {
      // TotalProducts().then(((value) {
      //   setState(() {
      //     Total = value;
      //   });

      //   //  print("This is output :" + value.toString());
      // }));

      getBussinessData().then((value) {
        // print(value.IsBussiness);
        CurrentBussiness = Bussiness(
          BussinessId: value.BussinessId,
          BussinessName: value.BussinessName,
          BussinessImageUrl: value.BussinessImageUrl,
          BussinessEmail: value.BussinessEmail,
          BussinessAddress: value.BussinessAddress,
          BussinessCity: value.BussinessCity,
          BussinessPhone: value.BussinessPhone,
          BussinessType: value.BussinessType,
          BussinessWebsite: value.BussinessWebsite,
          Reports: value.Reports,
        );

        setState(() {
          myBussinessId = CurrentBussiness.BussinessId;
          myBussinessName = CurrentBussiness.BussinessName;
          myBussinessImageUrl = CurrentBussiness.BussinessImageUrl;
          myBussinessEmail = CurrentBussiness.BussinessEmail;
          myBussinessAddress = CurrentBussiness.BussinessAddress;
          myBussinessCity = CurrentBussiness.BussinessCity;
          myBussinessPhone = CurrentBussiness.BussinessPhone;
          myBussinessType = CurrentBussiness.BussinessType;
          myBussinessWebsite = CurrentBussiness.BussinessWebsite;
          myReports = 0;
        });

        print(myBussinessName +
                " - " +
                CurrentBussiness.BussinessName +
                " - " +
                Total.toString()
            // Total.toString()
            );
      });
    } catch (e) {}
  }

  //int _PageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return myBussinessEmail == ""
        //isLoading == true
        ? Scaffold(body: Loading(message: "Fetching Bussiness Details"))
        : Scaffold(
            drawer: Drawer(
              backgroundColor: Colors.white,
              width: 250,
              child: SideDrawer(
                BussinessImageUrl: myBussinessImageUrl,
                BussinessName: myBussinessName,
              ),
            ),
            backgroundColor: AppColors.lightBackgroundColor,
            appBar: AppBar(
              actions: [
                IconButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: ((context) => Notifications())));
                    },
                    icon: Icon(Icons.notifications)),
                widget.PageIndex == 1
                    ? IconButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: ((context) => AddProduct())));
                        },
                        icon: Icon(Icons.add))
                    : IconButton(
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
              title: widget.PageIndex == 0
                  ? const Text('Statistcs')
                  : widget.PageIndex == 1
                      ? const Text('All Products')
                      : widget.PageIndex == 2
                          ? const Text('Kinara Hotel')
                          : const Text('Error'),
              backgroundColor: AppColors.PrimaryColor,
            ),
            body: widget.PageIndex == 0
                ? Dashboard()
                : widget.PageIndex == 1
                    ? const ProductsList()
                    : widget.PageIndex == 2
                        ? MyBussinessProfile(
                            CurrentB: Bussiness(
                                BussinessId: myBussinessId,
                                BussinessImageUrl: myBussinessImageUrl,
                                BussinessName: myBussinessName,
                                BussinessEmail: myBussinessEmail,
                                BussinessCity: myBussinessCity,
                                BussinessAddress: myBussinessAddress,
                                BussinessPhone: myBussinessPhone,
                                BussinessType: myBussinessType,
                                BussinessWebsite: myBussinessWebsite,
                                Reports: myReports),
                          )
                        : Center(
                            child: BigText(
                              text: 'Error',
                              color: Colors.white,
                            ),
                          ),
            bottomNavigationBar: BottomNavigationBar(
              backgroundColor: AppColors.lightBackgroundColor,
              currentIndex: widget.PageIndex,
              // unselectedItemColor: Colors.white,
              selectedItemColor: AppColors.PrimaryColor,
              items: [
                BottomNavigationBarItem(
                    icon: Icon(Icons.analytics), label: "Dashboard"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.inventory_2), label: 'Products'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.account_circle), label: 'My Bussiness'),
              ],
              onTap: ((value) => {
                    setState(() {
                      widget.PageIndex = value;
                    })
                  }),
            ),
          );
  }
}
