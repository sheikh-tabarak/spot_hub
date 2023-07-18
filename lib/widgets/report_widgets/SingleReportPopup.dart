// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:spot_hub/configurations/AppColors.dart';
import 'package:spot_hub/configurations/BigText.dart';
import 'package:spot_hub/configurations/Dimensions.dart';
import 'package:spot_hub/configurations/SmallText.dart';

class SingleReportPopup extends StatelessWidget {
  final String RTitle;
  final String RBody;
  final String RRespnse;
  final String Rstatus;

  const SingleReportPopup(
      {super.key,
      required this.RTitle,
      required this.RBody,
      required this.RRespnse,
      required this.Rstatus});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        Container(
          padding: EdgeInsets.all(Dimensions.height40),
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20), topRight: Radius.circular(20))),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.close_rounded),
                    color: Colors.black,
                  )
                ],
              ),

              Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(3),
                margin: const EdgeInsets.only(top: 10, bottom: 0),
                width: 70,
                height: 20,
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                        width: 1,
                        color: Rstatus == "Solved"
                            ? Colors.green
                            : Rstatus == "Active"
                                ? const Color.fromARGB(255, 254, 204, 25)
                                : Rstatus == "Refused"
                                    ? Colors.red
                                    : AppColors.PrimaryColor),
                    borderRadius: BorderRadius.circular(20)),
                child: SmallText(
                  text: Rstatus,
                  color: Rstatus == "Solved"
                      ? Colors.green
                      : Rstatus == "Active"
                          ? const Color.fromARGB(255, 254, 204, 25)
                          : Rstatus == "Refused"
                              ? Colors.red
                              : AppColors.PrimaryColor,
                ),
              ),
              SizedBox(
                height: Dimensions.height5,
              ),
              // Row(
              //   children: [

              //   ],
              // ),
              SizedBox(
                height: Dimensions.height15,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListTile(
                    title: BigText(
                      text: RTitle,
                      //size: 22,
                      color: AppColors.PrimaryColor,
                    ),
                    subtitle: SmallText(
                      //  iscentre: true,
                      text: RBody,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),

              SizedBox(
                height: Dimensions.height15,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListTile(
                    title: BigText(
                      text: "Response:",
                      //size: 22,
                      color: AppColors.PrimaryColor,
                    ),
                    subtitle: SmallText(
                      // iscentre: true,
                      text: RRespnse,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
