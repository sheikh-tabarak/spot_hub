import 'package:flutter/material.dart';
import 'package:spot_hub/configurations/AppColors.dart';
import 'package:spot_hub/configurations/BigText.dart';
import 'package:spot_hub/configurations/Dimensions.dart';
import 'package:spot_hub/configurations/SmallText.dart';
import 'package:spot_hub/widgets/Team/TeamBox.dart';

class DevelopersTeam extends StatelessWidget {
  const DevelopersTeam({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          backgroundColor: AppColors.PrimaryColor,
          title: SmallText(
            text: "About us",
            color: Colors.white,
          )),
      body: SingleChildScrollView(
        child: Column(
        
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Image(
              image: AssetImage('assets/images/team.jpg'),
              fit: BoxFit.cover,
              
            ),
            Padding(
padding: const EdgeInsets.only(left:30.0),
              child: BigText(
               // isCentre: false,
                text: "Meet our developers Team",
                color: AppColors.PrimaryColor,
              ),
            ),
            SizedBox(
              height: Dimensions.height10,
            ),
            Row(
              children: [
                TeamBox(
                  AssetImagelink: 'assets/images/tabarak.jpg',
                  title: "Tabarak",
                  role: "Developer",
                  post: "Leader",
                  phoneno: "+923154706237",
                  desc: "I am web and application developer, working on Spot hub as a flutter developer, analysis expert and an activity director",
                  portfolio: "https://sheikhtabarak.me",
                  email: "admin@sheikhtabarak.me",
                  isCentral: false,
                ),
                TeamBox(
                  AssetImagelink: 'assets/images/haroonm2.jpg',
                  title: "Haroon",
                  role: "Designer",
                  post: "Member",
                   phoneno: "+923154706237",
                  desc: "I am Graphics and UI Designer, working on Spot hub as a UI designer and design planner",
                  portfolio: "https://techlegion.ml",
                  email: "haroonulhassan1@gmail.com",
                  isCentral: true,
                ),
                TeamBox(
                  AssetImagelink: 'assets/images/arhumm3.jpg',
                  title: "Arhum",
                  role: "Document",
                  post: "Member",
                   phoneno: "+923154706237",
                  desc: "I am documentation expert, working on Spot hub as and working on document",
                  portfolio: "https://techlegion.ml",
                  email: "arhumofficial@gmail.com",
                  isCentral: false,
                )

                            ],
            ),
            SizedBox(height: Dimensions.height10,),
             Padding(
padding: const EdgeInsets.only(left:30.0),
               child: BigText(
            //  isCentre: false,
                text: "Who we are",
                color: AppColors.PrimaryColor,
            ),
             ),
            //    SizedBox(height: Dimensions.height10,),

            Padding(
              padding: const EdgeInsets.only(
                  top: 20, bottom: 20, right: 40, left: 30),
              child: SmallText(
                text:
                    "Spot hub is developed by Muhammad Tabarak, Haroon ul Hassan, and Arhum. Our team of expert engineers have crafted a user-friendly and reliable app that seamlessly integrates the latest technology. From increasing productivity to simplifying communication, our app is designed to meet all your needs. Trust us to deliver a top-quality mobile experience that exceeds your expectations.",
                // color: AppColors.PrimaryColor,
              ),
            ),


            SizedBox(height: Dimensions.height10,),
             Padding(
               padding: const EdgeInsets.only(left:30.0),
               child: BigText(
               // isCentre: false,
                text: "Our Mission",
                isCentre: false,
                color: AppColors.PrimaryColor,
            ),
             ),
            //    SizedBox(height: Dimensions.height10,),

            Padding(
              padding: const EdgeInsets.only(
                  top: 15, bottom: 15, right: 45, left: 30),
              child: SmallText(
                text:
                    "Our mission is to empower businesses and individuals with innovative software solutions. We strive to deliver cutting-edge technology that streamlines processes, improves efficiency and enhances communication. We believe in creating user-friendly and reliable products that are accessible to everyone.",
                // color: AppColors.PrimaryColor,
              ),
            ),
           
          ],
        ),
      ),
    );
  }
}
