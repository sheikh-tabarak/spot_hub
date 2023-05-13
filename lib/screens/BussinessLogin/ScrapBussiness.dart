import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:spot_hub/configurations/BigText.dart';
import 'package:spot_hub/models/BusinessModels/Reports.dart';
import 'package:spot_hub/widgets/others/PrimayButton.dart';
// import 'package:http/http.dart' as http;
// import 'package:html/parser.dart' as parser;

class ScrapBussiness extends StatefulWidget {
  const ScrapBussiness({super.key});

  @override
  State<ScrapBussiness> createState() => _ScrapBussinessState();
}

class _ScrapBussinessState extends State<ScrapBussiness> {
  
  // Future<String> _getData() async {
  //   String Price = "0";
  //   final response =
  //       await http.Client().get(Uri.parse('https://www.geeksforgeeks.org'));

  //   if (response.statusCode == 200) {
  //     var doc = parser.parse(response.body);

  //     try {
  //       var res = doc
  //           .getElementsByClassName("ant-row ant-row-center")[0];
  //           // .children[0]
  //           // .children[0]
  //           // .children[0];

  //       Price = res.text.toString();
  //     } catch (e) {
  //       print(e);
  //     }
  //   }

  //   return Price;
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BigText(
              text: "This is Scrapped",
            ),
            PrimaryButton(
                TapAction: () async {

                


                  // print("Started...");
                  // await _getData().then((value) => print(value));
                  // print("Done...");
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
