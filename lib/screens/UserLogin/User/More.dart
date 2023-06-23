// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:spot_hub/Utilities/MapsView.dart';
import 'package:spot_hub/configurations/AppColors.dart';
import 'package:spot_hub/configurations/SmallText.dart';
import 'package:spot_hub/database/Authentication.dart';
import 'package:spot_hub/models/DummyData.dart';
import 'package:spot_hub/models/UserModels/UserClass.dart';
import 'package:spot_hub/screens/BussinessLogin/ManageBussiness/AddNewBussiness.dart';
import 'package:spot_hub/screens/BussinessLogin/ManageBussiness/BussinessHome.dart';
import 'package:spot_hub/screens/Loading.dart';
import 'package:spot_hub/screens/UserLogin/Admin/Login.dart';
import 'package:spot_hub/screens/UserLogin/User/AddReview.dart';
import 'package:spot_hub/screens/UserLogin/User/DevelopersTeam.dart';
import 'package:spot_hub/screens/UserLogin/User/MainHome.dart';
import 'package:spot_hub/screens/UserLogin/Home/MainPage.dart';
import 'package:spot_hub/screens/UserLogin/User/NoLogin.dart';
import 'package:spot_hub/widgets/others/PrimayButton.dart';

class More extends StatefulWidget {
  final bool isLoggedin;
  final UserClass MainUser;
  const More({super.key, required this.MainUser, required this.isLoggedin});

  @override
  State<More> createState() => _MoreState();
}

class _MoreState extends State<More> {
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return isLoading == true
        ? Loading(message: "Logging you out..")
        : Scaffold(
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
                        borderRadius:
                            const BorderRadius.all(Radius.circular(5))),
                    child: ListTile(
                        leading: CircleAvatar(
                          radius: 30,
                          backgroundImage: NetworkImage(widget.MainUser.image),
                        ),
                        // Image(
                        //   image: NetworkImage(widget.MainUser.image),
                        //   width: 60,
                        //   height: 60,
                        // ),
                        title: Text(widget.MainUser.username),
                        subtitle: Text(widget.MainUser.email),
                        trailing: TextButton(
                            onPressed: () async {
                              setState(() {
                                isLoading == true;
                              });

                              await logOut();

                              setState(() {
                                isLoading == false;
                              });

                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Login()));
                            },
                            child: widget.isLoggedin == false
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
                          borderRadius:
                              const BorderRadius.all(Radius.circular(5))),
                      child: Column(
                        children: [
                          ListTile(
                            onTap: () => {
                              if (widget.isLoggedin == false)
                                {
                                  showModalBottomSheet(
                                      isScrollControlled: true,
                                      context: context,
                                      builder: (BuildContext bc) {
                                        return const NoLogin();
                                      }),
                                }
                              else
                                {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => MainPage(
                                                PI: 1,
                                                MainUser: widget.MainUser,
                                                isLoggedin: false,
                                              )))
                                }
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
                              if (widget.isLoggedin == false)
                                {
                                  showModalBottomSheet(
                                      isScrollControlled: true,
                                      context: context,
                                      builder: (BuildContext bc) {
                                        return const NoLogin();
                                      }),
                                }
                              else
                                {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => AddReview(
                                              ProductToReview:
                                                  DummyProducts[6])))
                                }
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
                          widget.MainUser.IsBussiness == false &&
                                  widget.isLoggedin
                              ? ListTile(
                                  onTap: () => {
                                    Navigator.push(context,
                                        MaterialPageRoute(builder: (context) {
                                      print(widget.MainUser.IsBussiness);
                                      return AddNewBussiness();
                                    }))
                                  },

                                  leading: Icon(
                                    Icons.add,
                                    color: AppColors.PrimaryColor,
                                  ),
                                  title: SmallText(
                                    text: "Add your Bussiness",
                                  ),
                                  //   subtitle: Text("This is activity Button"),
                                )
                              : widget.MainUser.IsBussiness == true &&
                                      widget.isLoggedin
                                  ?
                                  //  {widget.MainUser.IsBussiness == false &&
                                  //   widget.isLoggedin=false}?
                                  ListTile(
                                      onTap: () => {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    BussinessHome()))
                                      },

                                      leading: Icon(
                                        Icons.business_outlined,
                                        color: AppColors.PrimaryColor,
                                      ),
                                      title: SmallText(
                                        text: "Manage your Bussiness",
                                      ),
                                      //   subtitle: Text("This is activity Button"),
                                    )
                                  : SizedBox(
                                      height: 0,
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
                            onTap: () {
                              if (widget.isLoggedin == false) {
                                showModalBottomSheet(
                                    isScrollControlled: true,
                                    context: context,
                                    builder: (BuildContext bc) {
                                      return const NoLogin();
                                    });
                              } else {
                                print("This is Favorite screen");
                              }
                            },
                            leading: Icon(
                              Icons.favorite,
                              color: AppColors.PrimaryColor,
                            ),
                            title: SmallText(text: "Favorites"),

                            //   subtitle: Text("This is activity Button"),
                          ),
                          // ListTile(
                          //   onTap: () {
                          //     Navigator.push(
                          //         context,
                          //         MaterialPageRoute(
                          //             builder: (context) => const MapsView()));
                          //   },
                          //   leading: Icon(
                          //     Icons.pin_drop,
                          //     color: AppColors.PrimaryColor,
                          //   ),
                          //   title: SmallText(text: "Select Location"),
                          //   //   subtitle: Text("This is activity Button"),
                          // ),
                          ListTile(
                            leading: Icon(
                              Icons.settings,
                              color: AppColors.PrimaryColor,
                            ),
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
