// ignore_for_file: non_constant_identifier_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:spot_hub/configurations/AppColors.dart';
import 'package:spot_hub/configurations/BigText.dart';
import 'package:spot_hub/configurations/Dimensions.dart';
import 'package:spot_hub/configurations/SmallText.dart';
import 'package:spot_hub/models/UserModels/User.dart';

class CustomerAccount extends StatelessWidget {
  final User MainUser;
  const CustomerAccount({super.key, required this.MainUser});



 @override
  initState() {


  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            Container(
              padding: EdgeInsets.all(30),
              height: 280,
              decoration: BoxDecoration(
                color: AppColors.PrimaryColor,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(50),
                    bottomRight: Radius.circular(50)),
              ),
            ),
            Container(
              padding: EdgeInsets.all(40),
              height: 280,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Stack(
                      alignment: Alignment.bottomRight,
                      children: [
                        Container(
                          padding: EdgeInsets.all(5),
                          child: CircleAvatar(
                            radius: 50,
                            backgroundImage: NetworkImage(
                                "https://pbs.twimg.com/media/FjU2lkcWYAgNG6d.jpg"), // Image,
                          ),
                        ),
                        Container(
                          width: 40,
                          height: 40,
                          alignment: Alignment.center,
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(40)),

                          child: MainUser.IsBussiness == true
                              ? Icon(Icons.business_center)
                              : Icon(Icons.manage_accounts),
                          // Icon(Icons.account_circle_sharp),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    BigText(
                      text: MainUser.username,
                      color: Colors.white,
                    ),
                    SmallText(
                      text: MainUser.email,
                      color: Color.fromARGB(255, 226, 226, 226),
                    ),
                  ],
                ),
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
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.all(20),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Color.fromARGB(255, 237, 237, 237)),
              child: Icon(Icons.favorite),
            ),
            Container(
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.all(20),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Color.fromARGB(255, 237, 237, 237)),
              child: Icon(
                  MainUser.IsBussiness == false ? Icons.add : Icons.business),
            ),
            Container(
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.all(20),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Color.fromARGB(255, 237, 237, 237)),
              child: Icon(Icons.details),
            ),
            Container(
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.all(20),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Color.fromARGB(255, 237, 237, 237)),
              child: Icon(Icons.logout),
            ),
          ],
        ),
        SizedBox(
          height: 20,
        ),
        ListTile(
            leading: Icon(
              Icons.account_circle,
              size: 40,
              color: AppColors.PrimaryColor,
            ),
            title: SmallText(size: 14, text: "Complete Profile"),
            subtitle: SmallText(
              text: "60% completed",
              color: Colors.red,
            ),
            trailing: Icon(
              Icons.keyboard_arrow_right,
              size: 40,
            )),
        ListTile(
            leading: Icon(
              Icons.lock_person,
              size: 40,
              color: AppColors.PrimaryColor,
            ),
            title: SmallText(size: 14, text: "Change Password"),

            // subtitle: SmallText(
            //     text: "60% completed",color: Colors.red,),
            trailing: Icon(
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
            trailing: Icon(
              Icons.keyboard_arrow_right,
              size: 40,
            )),
        Container(
          margin: EdgeInsets.all(20),
          padding: EdgeInsets.all(Dimensions.height20),
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 237, 237, 237),
            borderRadius: BorderRadius.circular(10),    
            ),

            child: Row(
              children: [
                Icon(Icons.support_agent,size: 60,color: AppColors.PrimaryColor,),
                SizedBox(width: Dimensions.height15,),
                BigText(text: "Can we help you ?",size: 25,color: AppColors.PrimaryColor,)
              ],
            ),
        ),

        TextButton(onPressed: (){}, child: SmallText(text: "Privacy Policy"))
      ],
    );
    // Center(

    //   child: Text("Logged in as ${MainUser.username}"));
  }
}
