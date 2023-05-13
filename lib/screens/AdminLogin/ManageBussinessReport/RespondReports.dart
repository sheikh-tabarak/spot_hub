import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:spot_hub/configurations/BigText.dart';

class RespondReports extends StatefulWidget {
  const RespondReports({super.key});

  @override
  State<RespondReports> createState() => _RespondReportsState();
}

class _RespondReportsState extends State<RespondReports> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: BigText(text: ""),
      ),
    );
  }
}