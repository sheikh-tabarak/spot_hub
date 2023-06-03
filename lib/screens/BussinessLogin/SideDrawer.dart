import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:spot_hub/configurations/AppColors.dart';
import 'package:spot_hub/configurations/BigText.dart';
import 'package:spot_hub/configurations/SmallText.dart';
import 'package:spot_hub/screens/BussinessLogin/ManageBussiness/BussinessHome.dart';
import 'package:spot_hub/screens/BussinessLogin/ManageBussiness/ContactSupport.dart';
import 'package:spot_hub/screens/BussinessLogin/ManageProducts/ScrapProducts.dart';
import 'package:spot_hub/screens/BussinessLogin/ManageReports/MyReports.dart';
import 'package:spot_hub/screens/BussinessLogin/ManageProducts/AddProduct.dart';
import 'package:spot_hub/screens/BussinessLogin/ManageProducts/ProductsList.dart';
import 'package:spot_hub/screens/BussinessLogin/ScrapBussiness.dart';
import 'package:spot_hub/screens/UserLogin/Admin/Login.dart';
import 'package:spot_hub/screens/UserLogin/Home/MainPage.dart';

class SideDrawer extends StatefulWidget {
  const SideDrawer({super.key});

  @override
  State<SideDrawer> createState() => _SideDrawerState();
}

class _SideDrawerState extends State<SideDrawer> {
  bool isHovering = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Wrap(
        children: [
          // InkWell(
          //   onTap: () => null,

          // ),
          Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(color: AppColors.PrimaryColor),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 90,
                    height: 90,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(100)),
                      image: DecorationImage(
                          image: AssetImage("assets/images/2desifood.png"),
                          fit: BoxFit.cover),
                    ),
                  ),
                  BigText(
                    text: "Bussiness Name",
                    color: Colors.white,
                  ),
                  SmallText(
                    text: "This is the description of this Bussiness",
                    color: Colors.white,
                  ),
                ],
              )),
          Column(
            children: [
              Column(
                children: [
                  // Button : Add New Product
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AddProduct()));
                    },
                    child: Container(
                      padding: EdgeInsets.all(3),
                      decoration: BoxDecoration(
                          color: isHovering
                              ? AppColors.PrimaryColor
                              : Colors.white),
                      child: ListTile(
                        leading: Icon(
                          Icons.add,
                          color: isHovering
                              ? Colors.white
                              : AppColors.PrimaryColor,
                        ),
                        title: SmallText(
                          text: "Add New Product",
                          color: isHovering ? Colors.white : Colors.black,
                        ),
                      ),
                    ),
                  ),
                  // Button : Direct Upload
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: ((context) => ScrapProducts())));
                    },
                    child: Container(
                      padding: EdgeInsets.all(3),
                      decoration: BoxDecoration(
                          color: isHovering
                              ? AppColors.PrimaryColor
                              : Colors.white),
                      child: ListTile(
                        leading: Icon(
                          Icons.upload,
                          color: isHovering
                              ? Colors.white
                              : AppColors.PrimaryColor,
                        ),
                        title: SmallText(
                          text: "Direct Upload",
                          color: isHovering ? Colors.white : Colors.black,
                        ),
                      ),
                    ),
                  ),
                  // Button : Products List
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => BussinessHome(
                                    PageIndex: 1,
                                  )));
                    },
                    child: Container(
                      padding: EdgeInsets.all(3),
                      decoration: BoxDecoration(
                          color: isHovering
                              ? AppColors.PrimaryColor
                              : Colors.white),
                      child: ListTile(
                        leading: Icon(
                          Icons.list,
                          color: isHovering
                              ? Colors.white
                              : AppColors.PrimaryColor,
                        ),
                        title: SmallText(
                          text: "Product List",
                          color: isHovering ? Colors.white : Colors.black,
                        ),
                      ),
                    ),
                  ),
                  // Button : My Reports
                  InkWell(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => MyReports()));
                    },
                    child: Container(
                      padding: EdgeInsets.all(3),
                      decoration: BoxDecoration(
                          color: isHovering
                              ? AppColors.PrimaryColor
                              : Colors.white),
                      child: ListTile(
                        leading: Icon(
                          Icons.reviews,
                          color: isHovering
                              ? Colors.white
                              : AppColors.PrimaryColor,
                        ),
                        title: SmallText(
                          text: "My Reports",
                          color: isHovering ? Colors.white : Colors.black,
                        ),
                      ),
                    ),
                  ),
                  // Button : Setting
                  InkWell(
                    onTap: () {},
                    child: Container(
                      padding: EdgeInsets.all(3),
                      decoration: BoxDecoration(
                          color: isHovering
                              ? AppColors.PrimaryColor
                              : Colors.white),
                      child: ListTile(
                        leading: Icon(
                          Icons.settings,
                          color: isHovering
                              ? Colors.white
                              : AppColors.PrimaryColor,
                        ),
                        title: SmallText(
                          text: "Settings",
                          color: isHovering ? Colors.white : Colors.black,
                        ),
                      ),
                    ),
                  ),
                  // Button : Contact Support
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ContactSupport()));
                    },
                    child: Container(
                      padding: EdgeInsets.all(3),
                      decoration: BoxDecoration(
                          color: isHovering
                              ? AppColors.PrimaryColor
                              : Colors.white),
                      child: ListTile(
                        leading: Icon(
                          Icons.call,
                          color: isHovering
                              ? Colors.white
                              : AppColors.PrimaryColor,
                        ),
                        title: SmallText(
                          text: "Contact Support",
                          color: isHovering ? Colors.white : Colors.black,
                        ),
                      ),
                    ),
                  ),
                  // Button : Switch to User
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: ((context) => MainPage(
                                    isLoggedin: true,
                                    PI: 1,
                                  ))));
                    },
                    child: Container(
                      padding: EdgeInsets.all(3),
                      decoration: BoxDecoration(
                          color: isHovering
                              ? AppColors.PrimaryColor
                              : Colors.white),
                      child: ListTile(
                        leading: Icon(
                          Icons.switch_account,
                          color: isHovering
                              ? Colors.white
                              : AppColors.PrimaryColor,
                        ),
                        title: SmallText(
                          text: "Switch to user",
                          color: isHovering ? Colors.white : Colors.black,
                        ),
                      ),
                    ),
                  ),
                  // Button : Logout
                  InkWell(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: ((context) => Login())));
                    },
                    child: Container(
                      padding: EdgeInsets.all(3),
                      decoration: BoxDecoration(
                          color: isHovering
                              ? AppColors.PrimaryColor
                              : Colors.white),
                      child: ListTile(
                        leading: Icon(
                          Icons.logout,
                          color: isHovering
                              ? Colors.white
                              : AppColors.PrimaryColor,
                        ),
                        title: SmallText(
                          text: "Logout",
                          color: isHovering ? Colors.white : Colors.black,
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
