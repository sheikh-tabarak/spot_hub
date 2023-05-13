import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:spot_hub/configurations/AppColors.dart';
import 'package:spot_hub/configurations/BigText.dart';
import 'package:spot_hub/configurations/SmallText.dart';
import 'package:spot_hub/screens/BussinessLogin/ManageBussiness/BussinessHome.dart';
import 'package:spot_hub/screens/BussinessLogin/ManageReports/MyReports.dart';
import 'package:spot_hub/widgets/others/PrimayButton.dart';

class ReportSubmitted extends StatefulWidget {
  const ReportSubmitted({super.key});

  @override
  State<ReportSubmitted> createState() => _ReportSubmittedState();
}

class _ReportSubmittedState extends State<ReportSubmitted> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              Icons.check_circle_rounded,
              size: 50,
              color: Colors.green,
            ),
            SizedBox(
              height: 10,
            ),
            BigText(text: " Successfully Submitted"),
            SizedBox(
              height: 10,
            ),
            SmallText(
                iscentre: true,
                text:
                    "Your report \"Report Title\" have been submitted to us, wait for response\n Track this in My Reports"),
            SizedBox(
              height: 10,
            ),
            PrimaryButton(
                TapAction: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => MyReports()));
                },
                text: "My Reports",
                color: AppColors.PrimaryColor,
                icon: Icons.list),
            SizedBox(
              height: 10,
            ),
            PrimaryButton(
                TapAction: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => BussinessHome()));
                },
                text: "Go to Dashboard",
                color: Colors.green,
                icon: Icons.list)
          ],
        ),
      ),
    );
  }
}
