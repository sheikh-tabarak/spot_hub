// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:spot_hub/Utilities/MapsView.dart';
import 'package:spot_hub/configurations/AppColors.dart';
import 'package:spot_hub/configurations/SmallText.dart';
import 'package:spot_hub/models/DummyData.dart';
import 'package:spot_hub/models/UserModels/User.dart';
import 'package:spot_hub/screens/ResturantsView/Admin/AddBussiness/AddBussiness.dart';
import 'package:spot_hub/screens/UserView/Admin/Login.dart';
import 'package:spot_hub/screens/UserView/Customer/AddReview.dart';
import 'package:spot_hub/screens/UserView/Customer/DevelopersTeam.dart';
import 'package:spot_hub/widgets/PrimayButton.dart';

class More extends StatelessWidget {
  final bool isLoggedin;
  final User MainUser;
  const More({super.key, required this.MainUser, required this.isLoggedin});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
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
                      image: NetworkImage(MainUser.image),
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
              const ListTile(
                leading: Icon(Icons.account_circle_sharp),
                title: Text("My Profile"),
                //   subtitle: Text("This is activity Button"),
              ),
              ListTile(
                onTap: () => {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              AddReview(ProductToReview: DummyProducts[6])))
                },
                leading: const Icon(
                  Icons.published_with_changes,
                  color: Colors.red,
                ),
                title: SmallText(
                  text: "Add Review",
                  color: AppColors.PrimaryColor,
                ),
                //   subtitle: Text("This is activity Button"),
              ),
              ListTile(
                onTap: () => {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => AddBussiness()))
                },

                leading: const Icon(
                  Icons.business_outlined,
                  color: Colors.red,
                ),
                title: SmallText(
                  text: "Add your Bussiness",
                  color: AppColors.PrimaryColor,
                ),
                //   subtitle: Text("This is activity Button"),
              ),
                ListTile(
                onTap: () => {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const DevelopersTeam()))
                },

                leading: const Icon(
                  Icons.developer_board,
                  color: Colors.red,
                ),
                title: SmallText(
                  text: "Develors Team",
                  color: AppColors.PrimaryColor,
                ),
                //   subtitle: Text("This is activity Button"),
              ),
            
              ListTile(
                leading: const Icon(Icons.favorite),
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
                leading: const Icon(Icons.pin_drop),
                title: SmallText(text: "Select Location"),
                //   subtitle: Text("This is activity Button"),
              ),
              ListTile(
                leading: const Icon(Icons.settings),
                title: SmallText(text: "Settings"),
                //   subtitle: Text("This is activity Button"),
              ),

              ListTile(
                leading: const Icon(Icons.settings),
                title: SmallText(text: "Settings"),
                //   subtitle: Text("This is activity Button"),
              ),
            ],
          ),
        ),
        bottomNavigationBar: Container(
          height: 100,
          child: PrimaryButton(text: "Developers Team", TapAction: (){},color:AppColors.PrimaryColor,icon: Icons.developer_board,))

        );
  }
}
