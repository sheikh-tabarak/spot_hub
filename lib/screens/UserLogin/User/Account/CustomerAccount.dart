// ignore_for_file: non_constant_identifier_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
//import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:spot_hub/configurations/AppColors.dart';
import 'package:spot_hub/configurations/BigText.dart';
import 'package:spot_hub/configurations/Dimensions.dart';
import 'package:spot_hub/configurations/SmallText.dart';
import 'package:spot_hub/database/Authentication.dart';
import 'package:spot_hub/models/UserModels/UserClass.dart';
import 'package:spot_hub/screens/BussinessLogin/ManageBussiness/AddNewBussiness.dart';
import 'package:spot_hub/screens/UserLogin/Admin/Login.dart';
import 'package:spot_hub/screens/UserLogin/User/Account/EditAccountDetails.dart';

class CustomerAccount extends StatefulWidget {
  CustomerAccount({
    Key? key,
    // required this.MainUser,
  }) : super(key: key);

  @override
  State<CustomerAccount> createState() => _CustomerAccountState();
}

class _CustomerAccountState extends State<CustomerAccount> {
  bool isLoading = false;
  UserClass MainUser = const UserClass(
      IsBussiness: false,
      image: "https://pbs.twimg.com/media/FjU2lkcWYAgNG6d.jpg",
      username: "Guest",
      password: "password",
      email: "guest@spothub.com",
      PhoneNo: "1234567890",
      Intrests: "11111",
      Address: "Ghost Location",
      UserId: "");

  String myEmail = "";
  bool AmIBussiness = false;
  String myName = "";
  String myPhone = "";
  String myimage = "";
  String myIntrests = "10101";
  String myAddress = "";

  @override
  initState() {
    super.initState();

    // Add listeners to this class
    try {
      getUserData().then((value) {
        print(value.IsBussiness);
        MainUser = UserClass(
            IsBussiness: value.IsBussiness,
            image: value.image,
            username: value.username,
            password: value.password,
            email: value.email,
            PhoneNo: value.PhoneNo,
            Intrests: value.Intrests,
            Address: value.Address,
            UserId: value.UserId);

        setState(() {
          AmIBussiness = MainUser.IsBussiness;
          myName = MainUser.username;
          myEmail = MainUser.email;
          myPhone = MainUser.PhoneNo;
          myimage = MainUser.image;
          myIntrests = MainUser.Intrests;
          myAddress = MainUser.Address;
        });

        print(MainUser.PhoneNo + " - " + MainUser.email);
      });
    } catch (e) {}
  }

  @override
  Widget build(BuildContext context) {
    return isLoading == true
        ? const Center(child: CircularProgressIndicator())
        : Column(
            children: [
              Stack(
                children: [
                  Container(
                    padding: const EdgeInsets.all(30),
                    height: 260,
                    decoration: BoxDecoration(
                      color: AppColors.PrimaryColor,
                      borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(50),
                          bottomRight: Radius.circular(50)),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(40),
                    height: 260,
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Stack(
                            alignment: Alignment.bottomRight,
                            children: [
                              Container(
                                padding: const EdgeInsets.all(5),
                                child: CircleAvatar(
                                    radius: 50,
                                    backgroundImage:
                                        NetworkImage(myimage) // Image,
                                    ),
                              ),
                              Container(
                                width: 40,
                                height: 40,
                                alignment: Alignment.center,
                                padding: const EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(40)),
                                child: AmIBussiness == true
                                    ? const Icon(Icons.business_center)
                                    : const Icon(Icons.manage_accounts),
                                // Icon(Icons.account_circle_sharp),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          BigText(
                            text: "${myName}",
                            color: Colors.white,
                          ),
                          SmallText(
                            text: "${myEmail}",
                            color: const Color.fromARGB(255, 226, 226, 226),
                          ),
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => EditAccountDetails(
                              Name: myName,
                              Address: myAddress,
                              Intrests: myIntrests,
                              ImageLink: myimage,
                              Phone: myPhone,
                            ),
                          ));
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          margin: EdgeInsets.all(Dimensions.height30),
                          padding: EdgeInsets.all(Dimensions.height10),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(50)),
                          child: Icon(
                            Icons.edit,
                            color: AppColors.PrimaryColor,
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: const EdgeInsets.all(10),
                    padding: const EdgeInsets.all(20),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: const Color.fromARGB(255, 237, 237, 237)),
                    child: const Icon(Icons.favorite),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AddNewBussiness()));
                    },
                    child: Container(
                      margin: const EdgeInsets.all(10),
                      padding: const EdgeInsets.all(20),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: const Color.fromARGB(255, 237, 237, 237)),
                      child: Icon(
                          AmIBussiness == false ? Icons.add : Icons.business),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(10),
                    padding: const EdgeInsets.all(20),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: const Color.fromARGB(255, 237, 237, 237)),
                    child: const Icon(Icons.details),
                  ),
                  GestureDetector(
                    onTap: () async {
                      try {
                        setState(() {
                          isLoading = true;
                        });
                        await logOut();
                        // setState(() {
                        //   isLoading == false;
                        // });
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (context) => Login()));
                        //   if (FirebaseAuth.instance.currentUser != null) {

                        //   }
                        // //  else{

                        //   }
                      } catch (e) {
                        print(e);
                      }
                    },
                    child: Container(
                      margin: const EdgeInsets.all(10),
                      padding: const EdgeInsets.all(20),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: const Color.fromARGB(255, 237, 237, 237)),
                      child: const Icon(Icons.logout),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                height: 400,
                child: SingleChildScrollView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  // shrinkWrap;
                  child: Column(
                    children: [
                      Container(
                        alignment: Alignment.centerLeft,
                        padding: EdgeInsets.only(left: Dimensions.width15),
                        child: SmallText(
                          text: "ACCOUNT",
                          iscentre: false,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      ListTile(
                          leading: Icon(
                            Icons.phone,
                            size: 40,
                            color: AppColors.PrimaryColor,
                          ),
                          title: SmallText(size: 14, text: "Phone"),
                          subtitle: SmallText(
                            text: myPhone,
                            color: Colors.red,
                          ),
                          trailing: const Icon(
                            Icons.keyboard_arrow_right,
                            size: 40,
                          )),
                      ListTile(
                          leading: Icon(
                            Icons.pin_drop,
                            size: 40,
                            color: AppColors.PrimaryColor,
                          ),
                          title: SmallText(size: 14, text: "Address"),
                          subtitle: SmallText(
                            text: myAddress,
                            color: Colors.red,
                          ),
                          trailing: const Icon(
                            Icons.keyboard_arrow_right,
                            size: 40,
                          )),
                      const SizedBox(
                        height: 15,
                      ),
                      ListTile(
                          leading: Icon(
                            Icons.interests,
                            size: 40,
                            color: AppColors.PrimaryColor,
                          ),
                          title: SmallText(size: 14, text: "Intrests"),
                          subtitle: SmallText(
                            text: "1".allMatches(myIntrests).length.toString() +
                                " Selected Intrests",
                            color: Colors.red,
                          ),
                          trailing: const Icon(
                            Icons.keyboard_arrow_right,
                            size: 40,
                          )),
                      Container(
                        alignment: Alignment.centerLeft,
                        padding: EdgeInsets.only(left: Dimensions.width15),
                        child: SmallText(
                          text: "SETTINGS",
                          iscentre: false,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      ListTile(
                          leading: Icon(
                            Icons.lock_person,
                            size: 40,
                            color: AppColors.PrimaryColor,
                          ),
                          title: SmallText(size: 14, text: "Change Password"),

                          // subtitle: SmallText(
                          //     text: "60% completed",color: Colors.red,),
                          trailing: const Icon(
                            Icons.keyboard_arrow_right,
                            size: 40,
                          )),
                      ListTile(
                          leading: Icon(
                            Icons.settings,
                            size: 40,
                            color: AppColors.PrimaryColor,
                          ),
                          title: SmallText(size: 14, text: "Settings"),

                          // subtitle: SmallText(
                          //     text: "60% completed",color: Colors.red,),
                          trailing: const Icon(
                            Icons.keyboard_arrow_right,
                            size: 40,
                          )),
                      Container(
                        margin: const EdgeInsets.all(20),
                        padding: EdgeInsets.all(Dimensions.height20),
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 237, 237, 237),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          children: [
                            Icon(
                              Icons.support_agent,
                              size: 60,
                              color: AppColors.PrimaryColor,
                            ),
                            SizedBox(
                              width: Dimensions.height15,
                            ),
                            BigText(
                              text: "Can we help you ?",
                              size: 25,
                              color: AppColors.PrimaryColor,
                            )
                          ],
                        ),
                      ),
                      TextButton(
                          onPressed: () {},
                          child: SmallText(text: "Privacy Policy")),
                    ],
                  ),
                ),
              ),
            ],
          );
  }
}
