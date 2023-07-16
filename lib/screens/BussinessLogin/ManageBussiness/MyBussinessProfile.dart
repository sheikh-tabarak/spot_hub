// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:spot_hub/configurations/AppColors.dart';
import 'package:spot_hub/configurations/BigText.dart';
import 'package:spot_hub/configurations/SmallText.dart';
import 'package:spot_hub/models/BusinessModels/Bussiness.dart';

class MyBussinessProfile extends StatelessWidget {
  final Bussiness CurrentB;
  const MyBussinessProfile({super.key, required this.CurrentB});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: NeverScrollableScrollPhysics(),
      child: Column(children: [
        Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 30),
              height: 230,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/images/banner01.png"),
                      fit: BoxFit.cover)),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 40,
                  backgroundColor: Colors.white,
                  foregroundImage: NetworkImage(CurrentB.BussinessImageUrl),
                ),
              ],
            )
          ],
        ),
        SizedBox(
          height: 10,
        ),
        BigText(
          text: CurrentB.BussinessName,
          color: AppColors.PrimaryColor,
        ),
        SizedBox(
          height: 10,
        ),
        SmallText(
          text: CurrentB.BussinessAddress,
          color: Colors.grey,
        ),
        Container(
            decoration: BoxDecoration(
                border: Border(
                    bottom:
                        BorderSide(color: Color.fromARGB(255, 188, 188, 188)))),
            margin: EdgeInsets.all(5),
            padding: EdgeInsets.all(5),
            child: ListTile(
              leading: Icon(
                Icons.email,
                color: AppColors.PrimaryColor,
              ),
              title: BigText(text: "Email"),
              subtitle: SmallText(text: CurrentB.BussinessEmail),
              trailing: Icon(Icons.arrow_forward_ios),
            )),
        Container(
            decoration: BoxDecoration(
                border: Border(
                    bottom:
                        BorderSide(color: Color.fromARGB(255, 188, 188, 188)))),
            margin: EdgeInsets.all(5),
            padding: EdgeInsets.all(5),
            child: ListTile(
              leading: Icon(
                Icons.location_city,
                color: AppColors.PrimaryColor,
              ),
              title: BigText(text: "City"),
              subtitle: SmallText(text: CurrentB.BussinessCity),
              trailing: Icon(Icons.arrow_forward_ios),
            )),
        Container(
            decoration: BoxDecoration(
                border: Border(
                    bottom:
                        BorderSide(color: Color.fromARGB(255, 188, 188, 188)))),
            margin: EdgeInsets.all(5),
            padding: EdgeInsets.all(5),
            child: ListTile(
              leading: Icon(
                Icons.phone,
                color: AppColors.PrimaryColor,
              ),
              title: BigText(text: "Phone"),
              subtitle: SmallText(text: CurrentB.BussinessPhone),
              trailing: Icon(Icons.arrow_forward_ios),
            )),
        Container(
            decoration: BoxDecoration(
                border: Border(
                    bottom:
                        BorderSide(color: Color.fromARGB(255, 188, 188, 188)))),
            margin: EdgeInsets.all(5),
            padding: EdgeInsets.all(5),
            child: ListTile(
              leading: Icon(
                Icons.web,
                color: AppColors.PrimaryColor,
              ),
              title: BigText(text: "Website"),
              subtitle: SmallText(text: CurrentB.BussinessWebsite),
              trailing: Icon(Icons.arrow_forward_ios),
            )),
      ]),
    );
  }
}
