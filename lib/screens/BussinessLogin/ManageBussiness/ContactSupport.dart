import 'package:flutter/material.dart';
import 'package:spot_hub/Utilities/ScrappingData.dart';
import 'package:spot_hub/configurations/AppColors.dart';
import 'package:spot_hub/configurations/BigText.dart';
import 'package:spot_hub/screens/Loading.dart';

class ContactSupport extends StatefulWidget {
  const ContactSupport({super.key});

  @override
  State<ContactSupport> createState() => _ContactSupportState();
}

class _ContactSupportState extends State<ContactSupport> {
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
                  BigText(text: "Follow us to stay Connected"),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
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
                            onPressed: () {},
                          ),
                        ),
                      ),
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
                              Icons.install_mobile_sharp,
                              color: _hovered
                                  ? Colors.white
                                  : AppColors.PrimaryColor,
                            ),
                            onPressed: () async {
                              setState(() {
                                isLoading=true;
                              });
                              await scrapeData();
                              print("done");
                               setState(() {
                                isLoading=false;
                              });
                            },
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
    );
  }
}
