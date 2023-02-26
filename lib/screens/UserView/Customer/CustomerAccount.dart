// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:spot_hub/configurations/AppColors.dart';
import 'package:spot_hub/configurations/BigText.dart';
import 'package:spot_hub/configurations/SmallText.dart';
import 'package:spot_hub/models/UserModels/User.dart';

class CustomerAccount extends StatelessWidget {

  final User MainUser;
  const CustomerAccount({super.key, required this.MainUser});

  @override                               
  Widget build(BuildContext context) {
    return  Column(
  children: [

    Stack(
      children: [
Container(
  padding: EdgeInsets.all(30),
     height: 240,
      decoration: 
      BoxDecoration(
        color: AppColors.PrimaryColor,
        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(50),bottomRight: Radius.circular(50)),
        
      ),
     ),


     Container(
  padding: EdgeInsets.all(30),
     height: 240,
     child:Center(
       child: Column(
        
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
        
        backgroundImage: NetworkImage(MainUser.image),// Image,
         ),
         BigText(
       text: MainUser.username,
       color: Colors.white,
     
        //   style: Theme.of(context).textTheme.headline4,
         ),
     
         SmallText(
        text:
        MainUser.email,
        color: Color.fromARGB(255, 226, 226, 226),
       
         ),
     
        ],
       ),
     ),),


    
      ],
    ),
     
     
    
    Row(
      children: [
        IconButton(
          icon: Icon(Icons.favorite),
          //text: 'Favorites',
          onPressed: () {},
        ),
        IconButton(
          icon: Icon(Icons.business),
       //   text: 'Business',
          onPressed: () {},
        ),
        IconButton(
          icon: Icon(Icons.details),
       //   text: 'Details',
          onPressed: () {},
        ),
        IconButton(
          icon: Icon(Icons.logout),
       //   text: 'Logout',
          onPressed: () {
            // trigger logout action
          },
        ),
      ],
    ),
  ],
);
    // Center(

    //   child: Text("Logged in as ${MainUser.username}"));
  }
}