import 'package:flutter/material.dart';
import 'package:spot_hub/configurations/AppColors.dart';
import 'package:spot_hub/configurations/Dimensions.dart';
import 'package:spot_hub/configurations/SmallText.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/link.dart';
import 'dart:async';

class IconBox extends StatefulWidget {
  final IconData BoxIcon;
  final String BoxText;
  final double BoxWidth;
  final String BoxLink;

  IconBox(
      {super.key,
      required this.BoxIcon,
      required this.BoxText,
      required this.BoxWidth,
      required this.BoxLink});

  @override
  State<IconBox> createState() => _IconBoxState();
}

class _IconBoxState extends State<IconBox> {
  String phoneNumber =
      'https://google.com'; // replace with the phone number you want to call

Future<void>? _launched;

  String _phone = '';

  @override
  Widget build(BuildContext context) {
    const String toLaunch = 'https://www.google.com';
    return GestureDetector(
     onTap: () => setState(() {
                  _launched = _launchInBrowser(widget.BoxLink);
                }),
 
       
      child: Container(
          margin: EdgeInsets.only(
              left: Dimensions.width5, right: Dimensions.width5),
          padding: EdgeInsets.only(
              top: Dimensions.height15,
              bottom: Dimensions.height15,
              left: Dimensions.width20,
              right: Dimensions.width20),

          decoration: BoxDecoration(
            color: Color.fromARGB(255, 242, 242, 242),
            borderRadius: BorderRadius.circular(Dimensions.height10),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                widget.BoxIcon,
                size: 20,
                color: AppColors.PrimaryColor,
              ),
              SizedBox(
                height: Dimensions.height10,
              ),
              SmallText(
                text: widget.BoxText,
                color: AppColors.PrimaryColor,
              )
            ],
          )),
    );
  }


  Future<void> _launchInBrowser(String url) async {
    if (await canLaunch(url)) {
      await launch(
        url,
        forceSafariVC: false,
        forceWebView: false,
        headers: <String, String>{'my_header_key': 'my_header_value'},
      );
    } else {
      throw 'Could not launch $url';
    }
  }
}
