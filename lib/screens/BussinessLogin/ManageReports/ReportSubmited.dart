import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:spot_hub/configurations/AppColors.dart';
import 'package:spot_hub/configurations/BigText.dart';
import 'package:spot_hub/configurations/SmallText.dart';
import 'package:spot_hub/screens/BussinessLogin/BussinessHome.dart';
import 'package:spot_hub/screens/BussinessLogin/ManageReports/MyReports.dart';
import 'package:spot_hub/widgets/primary_widgets/PrimayButton.dart';

class ReportSubmitted extends StatefulWidget {
  final String reportTitle;
  const ReportSubmitted({super.key, required this.reportTitle});

  @override
  State<ReportSubmitted> createState() => _ReportSubmittedState();
}

class _ReportSubmittedState extends State<ReportSubmitted> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Icon(
              Icons.check_circle_rounded,
              size: 50,
              color: Colors.green,
            ),
            const SizedBox(
              height: 10,
            ),
            BigText(text: " Successfully Submitted"),
            const SizedBox(
              height: 10,
            ),
            SmallText(
                iscentre: true,
                text:
                    "Your report \"${widget.reportTitle}\" have been submitted to us, wait for response\n Track this in My Reports"),
            const SizedBox(
              height: 10,
            ),
            PrimaryButton(
                TapAction: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const MyReports()));
                },
                text: "My Reports",
                color: AppColors.PrimaryColor,
                icon: Icons.list),
            const SizedBox(
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
