// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:spot_hub/Utilities/MapsView.dart';
import 'package:spot_hub/configurations/AppColors.dart';
import 'package:spot_hub/configurations/SmallText.dart';
import 'package:spot_hub/models/DummyData.dart';
import 'package:spot_hub/models/UserModels/UserClass.dart';
import 'package:spot_hub/screens/BussinessLogin/ManageBussiness/AddNewBussiness.dart';
import 'package:spot_hub/screens/BussinessLogin/ManageBussiness/BussinessHome.dart';
import 'package:spot_hub/screens/UserLogin/Admin/Login.dart';
import 'package:spot_hub/screens/UserLogin/User/AddReview.dart';
import 'package:spot_hub/screens/UserLogin/User/DevelopersTeam.dart';
import 'package:spot_hub/screens/UserLogin/User/MainHome.dart';
import 'package:spot_hub/screens/UserLogin/Home/MainPage.dart';
import 'package:spot_hub/widgets/others/PrimayButton.dart';

class More extends StatelessWidget {
  final bool isLoggedin;
  final UserClass MainUser;
  const More({super.key, required this.MainUser, required this.isLoggedin});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: AppColors.PrimaryColor,
          title: const Text("Spot hub"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(0),
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.all(10),
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                    border: Border.all(
                        width: 1,
                        color: const Color.fromARGB(255, 218, 218, 218)),
                    borderRadius: const BorderRadius.all(Radius.circular(5))),
                child: ListTile(
                    leading: Image(
                      image: NetworkImage("https://upload.wikimedia.org/wikipedia/commons/thumb/1/12/User_icon_2.svg/330px-User_icon_2.svg.png"),
                      width: 60,
                      height: 60,
                    ),
                    title: Text(MainUser.username),
                    subtitle: Text(MainUser.email),
                    trailing: TextButton(
                        onPressed: () {
                          Navigator.pushReplacement(context,
                              MaterialPageRoute(builder: (context) => Login()));
                        },
                        child: isLoggedin == false
                            ? const Text("Login")
                            : const Text("Logout"))
                    //         ElevatedButton.styleFrom(
                    //   backgroundColor: AppColors.PrimaryColor,
                    // ),

                    //  onPressed: () {  },

                    ),
              ),
              SingleChildScrollView(
                child: Container(
                  margin: const EdgeInsets.all(10),
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      border: Border.all(
                          width: 1,
                          color: const Color.fromARGB(255, 218, 218, 218)),
                      borderRadius: const BorderRadius.all(Radius.circular(5))),
                  child: Column(
                    children: [
                      ListTile(
                        onTap: () => {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MainPage(
                                    PI: 1,
                                        MainUser: MainUser,
                                        isLoggedin: false,
                                      )))
                        },
                        leading: Icon(
                          Icons.account_circle_sharp,
                          color: AppColors.PrimaryColor,
                        ),
                        title: Text("My Profile"),

                        //   subtitle: Text("This is activity Button"),
                      ),
                      ListTile(
                        onTap: () => {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AddReview(
                                      ProductToReview: DummyProducts[6])))
                        },
                        leading: Icon(
                          Icons.published_with_changes,
                          color: AppColors.PrimaryColor,
                        ),
                        title: SmallText(
                          text: "Add Review",
                        ),
                        //   subtitle: Text("This is activity Button"),
                      ),
                     
                      ListTile(
                        onTap: () => {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AddNewBussiness()))
                        },

                        leading: Icon(
                          Icons.add,
                          color: AppColors.PrimaryColor,
                        ),
                        title: SmallText(
                          text: "Add your Bussiness",
                        ),
                        //   subtitle: Text("This is activity Button"),
                      ),
                      ListTile(
                        onTap: () => {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => BussinessHome()))
                        },

                        leading: Icon(
                          Icons.business_outlined,
                          color: AppColors.PrimaryColor,
                        ),
                        title: SmallText(
                          text: "Manage your Bussiness",
                        ),
                        //   subtitle: Text("This is activity Button"),
                      ),
                      ListTile(
                        onTap: () => {
                          // showModalBottomSheet(context: context, builder: (context)=>
                          // Column(children: const [

                          // ],)),
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const DevelopersTeam())),
                        },

                        leading: Icon(
                          Icons.developer_board,
                          color: AppColors.PrimaryColor,
                        ),
                        title: SmallText(
                          text: "Develors Team",
                        ),
                        //   subtitle: Text("This is activity Button"),
                      ),
                      ListTile(
                        leading: Icon(
                          Icons.favorite,
                          color: AppColors.PrimaryColor,
                        ),
                        title: SmallText(text: "Favorites"),

                        //   subtitle: Text("This is activity Button"),
                      ),
                      ListTile(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const MapsView()));
                        },
                        leading:  Icon(Icons.pin_drop, color: AppColors.PrimaryColor,),
                        title: SmallText(text: "Select Location"),
                        //   subtitle: Text("This is activity Button"),
                      ),
                      ListTile(
                        leading:  Icon(Icons.settings, color: AppColors.PrimaryColor,),
                        title: SmallText(text: "Settings"),
                        //   subtitle: Text("This is activity Button"),
                      ),
                    
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
        // bottomNavigationBar: Container(
        //     height: 100,
        //     child: PrimaryButton(
        //       text: "Developers Team",
        //       TapAction: () {},
        //       color: AppColors.PrimaryColor,
        //       icon: Icons.developer_board,
        //     ))
            );
  }
}