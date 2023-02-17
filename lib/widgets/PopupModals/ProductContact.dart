import 'package:flutter/material.dart';
import 'package:spot_hub/configurations/AppColors.dart';
import 'package:spot_hub/configurations/BigText.dart';
import 'package:spot_hub/configurations/Dimensions.dart';
import 'package:spot_hub/configurations/SmallText.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:async';

class ProductContact extends StatefulWidget {
  final String website;
  final String Email;
  final String Phone;

  const ProductContact(
      {super.key, this.website = "", this.Email = "", this.Phone = ""});

  @override
  State<ProductContact> createState() => _ProductContactState();
}

class _ProductContactState extends State<ProductContact> {
  Future<void>? _launched;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.all(Dimensions.height20),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              BigText(
                text: "Contact",
              ),
              IconButton(
                  onPressed: (() => Navigator.pop(context)),
                  icon: const Icon(Icons.close))
            ],
          ),
          SizedBox(
            height: Dimensions.height5,
          ),
          BigText(
            size: 15,
            //   color: AppColors.PrimaryColor,
            text: "Bussiness name",
          ),
          Container(
              decoration: const BoxDecoration(
                  border: Border(
                      top: BorderSide(
                          width: 1,
                          color: Color.fromARGB(255, 212, 212, 212)))),
              padding: EdgeInsets.only(top: 20, bottom: 20),
              child: Row(
                children: [
                  SmallText(text: "Website: "),
                  GestureDetector(
                      onTap: () {
                        setState(() {
                          _launched =
                              _launchInBrowser("https://${widget.website}");
                        });
                      },
                      child: SmallText(
                        text: "${widget.website}",
                        color: AppColors.PrimaryColor,
                      )),
                ],
              )),
          Container(
              decoration: const BoxDecoration(
                  border: Border(
                      top: BorderSide(
                          width: 1,
                          color: Color.fromARGB(255, 212, 212, 212)))),
              padding: EdgeInsets.only(top: 20, bottom: 20),
              child: Row(
                children: [
                  SmallText(text: "Email: "),
                  GestureDetector(
                      onTap: () {
                        setState(() {
                          _launched =
                              _launchInBrowser("mailto:${widget.Email}");
                        });
                      },
                      child: SmallText(
                        text: "${widget.Email}",
                        color: AppColors.PrimaryColor,
                      )),
                ],
              )),
          Container(
              decoration: const BoxDecoration(
                  border: Border(
                      top: BorderSide(
                          width: 1,
                          color: Color.fromARGB(255, 212, 212, 212)))),
              padding: EdgeInsets.only(top: 20, bottom: 20),
              child: Row(
                children: [
                  SmallText(text: "Phone: "),
                  GestureDetector(
                      onTap: () {
                        setState(() {
                          _launched = _launchInBrowser("tel:${widget.Phone}");
                        });
                      },
                      child: SmallText(
                        text: "${widget.Phone}",
                        color: AppColors.PrimaryColor,
                      )),
                ],
              )),
        ]),
      ),
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
