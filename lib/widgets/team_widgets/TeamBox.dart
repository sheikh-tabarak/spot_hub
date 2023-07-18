import 'package:flutter/material.dart';
import 'package:spot_hub/configurations/AppColors.dart';
import 'package:spot_hub/configurations/BigText.dart';
import 'package:spot_hub/configurations/Dimensions.dart';
import 'package:spot_hub/configurations/SmallText.dart';
import 'package:spot_hub/widgets/team_widgets/MemberDetails.dart';

class TeamBox extends StatelessWidget {
  final String AssetImagelink;
  final String title;
  final String role;
  final String post;
  final String phoneno;
  final String email;
  final String portfolio;
  final String desc;
  final bool isCentral;

  TeamBox(
      {super.key,
      required this.AssetImagelink,
      required this.title,
      required this.role,
      required this.post,
      required this.isCentral,
      required this.phoneno,
      required this.email,
      required this.portfolio,
      required this.desc});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => {
        showModalBottomSheet(
            enableDrag: true,
            context: context,
            shape: const RoundedRectangleBorder(
              // <-- SEE HERE
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(25.0),
              ),
            ),
            builder: (BuildContext bc) {
              return MemberDetails(
                  Detailsof: "DevTeam",
                  Link: AssetImage(AssetImagelink),
                  title: title,
                  role: role,
                  post: post,
                  isCentral: isCentral,
                  phoneno: phoneno,
                  email: email,
                  portfolio: portfolio,
                  desc: desc);
            }),
      },
      child: Container(
        width: (MediaQuery.of(context).size.width / 3) - 15,
        margin: isCentral == true
            ? const EdgeInsets.all(0)
            : const EdgeInsets.all(10),
        padding: const EdgeInsets.all(20),
        decoration: const BoxDecoration(color: Colors.white, boxShadow: [
          BoxShadow(
            blurRadius: 3,
            spreadRadius: -3,
          )
        ]),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  image: DecorationImage(
                      image: AssetImage(AssetImagelink), fit: BoxFit.cover)),
              child: const Text(""),
            ),
            SizedBox(
              height: Dimensions.height10,
            ),
            SmallText(text: title),
            Text(role,
                textAlign: TextAlign.left,
                //   overflow: overFlow,
                style: const TextStyle(
                    fontFamily: 'Poppins',
                    //    fontSize: Dimensions.font12,
                    color: Color.fromARGB(255, 193, 193, 193),
                    fontWeight: FontWeight.w300

                    //  FontWeight:Weight,
                    )),
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(2),
              margin: const EdgeInsets.only(top: 5),
              // height: 15,
              width: 70,
              decoration: BoxDecoration(
                  border: Border.all(width: 1, color: AppColors.PrimaryColor),
                  borderRadius: BorderRadius.circular(20)),
              child: SmallText(
                text: post,
                color: AppColors.PrimaryColor,
              ),
            )
          ],
        ),
      ),
    );
  }
}
