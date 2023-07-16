import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:spot_hub/Utilities/ScrappingData.dart';
import 'package:spot_hub/configurations/BigText.dart';
import 'package:spot_hub/models/BusinessModels/Reports.dart';
import 'package:spot_hub/screens/Loading.dart';
import 'package:spot_hub/widgets/others/PrimayButton.dart';
// import 'package:http/http.dart' as http;
// import 'package:html/parser.dart' as parser;

class ScrapBussiness extends StatefulWidget {
  const ScrapBussiness({super.key});

  @override
  State<ScrapBussiness> createState() => _ScrapBussinessState();
}

class _ScrapBussinessState extends State<ScrapBussiness> {
  // Strings to store the extracted Article titles
  String result1 = 'Result 1';
  String result2 = 'Result 2';
  String result3 = 'Result 3';

  // boolean to show CircularProgressIndication
  // while Web Scraping awaits
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isLoading
          ? Loading(
              message: "Fething the data",
            )
          : Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Text(result1,
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold)),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.05,
                      ),
                      Text(result2,
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold)),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.05,
                      ),
                      Text(result3,
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold)),
                    ],
                  ),
                  PrimaryButton(
                      TapAction: () async {
                        //Setting isLoading true to show the loader
                        setState(() {
                          isLoading = true;
                        });

                        //Awaiting for web scraping function to return list of strings
                        // final response = await extractData();
                        // await getWebsiteDataUerEats();
                        // await getWebsitefromKFC();
                        await getProductsFromKhizarTikka();
                        //  await getProductsFromZarrasha();
                        // await scrapeImages();

                        //Setting the received strings to be displayed and making isLoading false to hide the loader
                        setState(() {
                          result1 = "response[0]";
                          result2 = " response[1]";
                          result3 = "response[2]";
                          isLoading = false;
                        });
                      },
                      text: "Scrap Now",
                      color: Colors.black,
                      icon: Icons.web_asset)
                ],
              ),
            ),
    );
  }
}
