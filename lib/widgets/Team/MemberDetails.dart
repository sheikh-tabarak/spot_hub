import 'package:flutter/material.dart';
import 'package:spot_hub/configurations/AppColors.dart';
import 'package:spot_hub/configurations/Dimensions.dart';
import 'package:spot_hub/configurations/SmallText.dart';
import 'package:spot_hub/widgets/Team/IconBox.dart';

class MemberDetails extends StatelessWidget {
  final String AssetImagelink;
  final String title;
  final String role;
  final String post;
  final String phoneno;
  final String email;
  final String portfolio;
  final String desc;


  final bool isCentral;
   MemberDetails(
      {super.key,
      required this.AssetImagelink,
      required this.title,
      required this.role,
      required this.post,
      
      required this.isCentral, required this.phoneno, required this.email, required this.portfolio, required this.desc});

  @override
  Widget build(BuildContext context) {
    return 
    Container(
      padding: EdgeInsets.all(Dimensions.height40),
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20))),
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                    border: Border.all(color: AppColors.PrimaryColor, width: 2),
                    borderRadius: BorderRadius.circular(100),
                    image: DecorationImage(
                        image: AssetImage(AssetImagelink), fit: BoxFit.cover)),
                child: Container(),
              ),
              SizedBox(
                width: 100,
                height: 110,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.all(3),
                      margin: const EdgeInsets.only(top: 10, bottom: 0),
                      width: 70,
                      height: 20,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                              width: 1, color: AppColors.PrimaryColor),
                          borderRadius: BorderRadius.circular(20)),
                      child: SmallText(
                        text: post,
                        color: AppColors.PrimaryColor,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(
            height: Dimensions.height15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SmallText(
                text: title,
                size: 22,
                color: AppColors.PrimaryColor,
              ),
              SmallText(
                text: " ($role) ",
                size: 20,
              ),
            ],
          ),
          SizedBox(
            height: Dimensions.height15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconBox(
                BoxIcon: Icons.phone,
                BoxText: "Call",
                BoxWidth: 30,
                BoxLink: "tel:$phoneno",
              ),
              IconBox(
                BoxIcon: Icons.email,
                BoxText: "Email",
                BoxWidth: 30,
                BoxLink: "mailto:$email",
              ),
              IconBox(
                BoxIcon: Icons.link,
                BoxText: "Portfolio",
                BoxWidth: 30,
                BoxLink: portfolio,
              )
            ],
          ),
        
          Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(25),
            child:SmallText( iscentre: true,text: desc) ,
          )
          
        ],
      ),
    );
 
  }
}
