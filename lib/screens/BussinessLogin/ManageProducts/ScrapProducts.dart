import 'package:flutter/material.dart';
import 'package:spot_hub/configurations/AppColors.dart';
import 'package:spot_hub/configurations/BigText.dart';
import 'package:spot_hub/configurations/SmallText.dart';
import 'package:spot_hub/widgets/others/PrimayButton.dart';

import '../../../widgets/others/BoxedTextField.dart';

class ScrapProducts extends StatefulWidget {
  const ScrapProducts({super.key});

  @override
  State<ScrapProducts> createState() => _ScrapProductsState();
}

class _ScrapProductsState extends State<ScrapProducts> {
  String _selectedStore = "FoodPanda";
  TextEditingController _linkController = TextEditingController();
  final List<String> _stores = [
    'FoodPanda',
   'Food Mania'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: AppColors.PrimaryColor,
        title: BigText(
          text: "Import Products",
          color: Colors.white,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image(image: AssetImage("assets/images/productscrapposter.png")),
            SizedBox(
              height: 20,
            ),
            BigText(
              text: "Add Products to your store, Smartly",
              color: AppColors.PrimaryColor,
              size: 25,
            ),
            SizedBox(
              height: 15,
            ),
            SmallText(
                text:
                    "Hustle free product addition using the built in store to any ote platform !"),
            SizedBox(
              height: 15,
            ),
            Container(
              padding:
                  const EdgeInsets.only(right: 10, left: 10, bottom: 2, top: 2),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(
                    color: const Color.fromARGB(255, 200, 200, 200),
                    width: 1,
                  )),
              child: DropdownButton(
                isExpanded: true,
                value: _selectedStore,
                hint: SmallText(text: 'Select Platform'),
                items: _stores.map((store) {
                  return DropdownMenuItem(
                    value: store,
                    child: Row(
                      children: [
                        Icon(
                          Icons.location_city,
                          color: AppColors.PrimaryColor,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(store),
                      ],
                    ),
                  );
                }).toList(),
                onChanged: (selectedstore) {
                  setState(() {
                    _selectedStore = selectedstore!;
                  });
                },
              ),
            ),
            SizedBox(
              height: 10,
            ),
            BoxedTextField(
              TapAction: () {},
              controller: _linkController,
              icon: Icons.business,
              placeholder: 'e.g \"https://foodpanda.com/store-name\""',
            ),
            SizedBox(
              height: 10,
            ),
            PrimaryButton(
                marginValue: 0,
                TapAction: () {
                  print("Clicked Import Button");
                },
                text: "Verify and Import",
                color: AppColors.PrimaryColor,
                icon: Icons.download)
          ],
        ),
      ),
    );
  }
}
