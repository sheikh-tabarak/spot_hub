import 'package:flutter/material.dart';
import 'package:spot_hub/models/BusinessModels/ScrappingData.dart';
import 'package:spot_hub/configurations/AppColors.dart';
import 'package:spot_hub/configurations/BigText.dart';
import 'package:spot_hub/models/Global/ProductsData.dart';
import 'package:spot_hub/widgets/default_widgets/Loading.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactSupport extends StatefulWidget {
  const ContactSupport({super.key});

  @override
  State<ContactSupport> createState() => _ContactSupportState();
}

class _ContactSupportState extends State<ContactSupport> {
  Future<void>? _launched;
  bool isLoading = false;
  bool _hovered = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.PrimaryColor,
        title: BigText(
          text: "Contact Support",
          color: Colors.white,
        ),
      ),
      body: isLoading
          ? Loading(
              message: "Fetching Data...",
            )
          : Padding(
              padding: EdgeInsets.all(25.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.call,
                    color: AppColors.PrimaryColor,
                    size: 50,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  BigText(text: "Follow us to stay Connected"),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Facebook
                        InkWell(
                          onHover: (value) {
                            print(value);
                            setState(() {
                              _hovered = value;
                            });
                          },
                          child: Container(
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                color: _hovered
                                    ? AppColors.PrimaryColor
                                    : Colors.white,
                                border: Border.all(
                                    color: AppColors.PrimaryColor, width: 1),
                                borderRadius: BorderRadius.circular(40)),
                            child: IconButton(
                              icon: Icon(
                                Icons.facebook_rounded,
                                color: _hovered
                                    ? Colors.white
                                    : AppColors.PrimaryColor,
                              ),
                              onPressed: () {
                                setState(() {
                                  _launched = _launchInBrowser(
                                      "https://facebook.com/iamsheikhtabarak");
                                });
                              },
                            ),
                          ),
                        ),

                        // SizedBox(
                        //   width: 20,
                        // ),
                        // Instagram

                        InkWell(
                          onHover: (value) {
                            print(value);
                            setState(() {
                              _hovered = value;
                            });
                          },
                          child: Container(
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                color: _hovered
                                    ? AppColors.PrimaryColor
                                    : Colors.white,
                                border: Border.all(
                                    color: AppColors.PrimaryColor, width: 1),
                                borderRadius: BorderRadius.circular(40)),
                            child: IconButton(
                              icon: Icon(
                                Icons.email,
                                color: _hovered
                                    ? Colors.white
                                    : AppColors.PrimaryColor,
                              ),
                              onPressed: () {
                                setState(() {
                                  _launched = _launchInBrowser(
                                      "mailto:admin@sheikhtabarak.me");
                                });
                              },
                            ),
                          ),
                        ),

                        InkWell(
                          onHover: (value) {
                            print(value);
                            setState(() {
                              _hovered = value;
                            });
                          },
                          child: Container(
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                color: _hovered
                                    ? AppColors.PrimaryColor
                                    : Colors.white,
                                border: Border.all(
                                    color: AppColors.PrimaryColor, width: 1),
                                borderRadius: BorderRadius.circular(40)),
                            child: IconButton(
                              icon: Icon(
                                Icons.call,
                                color: _hovered
                                    ? Colors.white
                                    : AppColors.PrimaryColor,
                              ),
                              onPressed: () {
                                setState(() {
                                  _launched =
                                      _launchInBrowser("tel:+923154706237");
                                });
                              },
                            ),
                          ),
                        ),
                        InkWell(
                          onHover: (value) {
                            print(value);
                            setState(() {
                              _hovered = value;
                            });
                          },
                          child: Container(
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                color: _hovered
                                    ? AppColors.PrimaryColor
                                    : Colors.white,
                                border: Border.all(
                                    color: AppColors.PrimaryColor, width: 1),
                                borderRadius: BorderRadius.circular(40)),
                            child: IconButton(
                              icon: Icon(
                                Icons.web,
                                color: _hovered
                                    ? Colors.white
                                    : AppColors.PrimaryColor,
                              ),
                              onPressed: () {
                                setState(() {
                                  _launched = _launchInBrowser(
                                      "https://spothub.sheikhtabarak.me");
                                });
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
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
