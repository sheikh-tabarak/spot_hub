import 'package:flutter/material.dart';
import 'package:spot_hub/models/BusinessModels/ScrappingData.dart';

import 'package:spot_hub/configurations/AppColors.dart';
import 'package:spot_hub/configurations/BigText.dart';
import 'package:spot_hub/configurations/SmallText.dart';
import 'package:spot_hub/widgets/default_widgets/Loading.dart';
import 'package:spot_hub/widgets/primary_widgets/PrimayButton.dart';

import '../../../widgets/primary_widgets/BoxedTextField.dart';

class ScrapProducts extends StatefulWidget {
  String website;
  ScrapProducts({
    Key? key,
    this.website = "",
  }) : super(key: key);

  @override
  State<ScrapProducts> createState() => _ScrapProductsState();
}

class _ScrapProductsState extends State<ScrapProducts> {
  bool _isLoading = false;
  String _selectedStore = "Uber Eats";
  TextEditingController _linkController = TextEditingController();
  final List<String> _stores = ['Uber Eats', 'FoodPanda'];

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
      body: _isLoading == true
          ? const Loading(message: "Fething products from your store")
          : Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Image(
                      image:
                          AssetImage("assets/images/productscrapposter.png")),
                  const SizedBox(
                    height: 20,
                  ),
                  BigText(
                    text: "Add Products to your store, Smartly",
                    color: AppColors.PrimaryColor,
                    size: 25,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  widget.website == "https://www.khizertikkashop.com/"
                      ? Column(
                          children: [
                            SmallText(
                                text:
                                    "Hello, it seems we know you, Are you from khizar Tikka Shop ?\nIf yes then Import Product from your following website directly, either you can sync the inventory antytime later"),
                            const SizedBox(
                              height: 15,
                            ),
                            PrimaryButton(
                                marginValue: 0,
                                TapAction: () {},
                                text: widget.website,
                                color: AppColors.PrimaryColor,
                                icon: Icons.web),
                            const SizedBox(
                              height: 10,
                            ),
                            PrimaryButton(
                                marginValue: 0,
                                TapAction: () async {
                                  setState(() {
                                    _isLoading = true;
                                  });
                                  await getProductsFromKhizarTikka();

                                  setState(() {
                                    _isLoading = false;
                                  });
                                },
                                text: "Verify and Import",
                                color: AppColors.PrimaryColor,
                                icon: Icons.download),
                            const SizedBox(
                              height: 10,
                            ),
                            PrimaryButton(
                                marginValue: 0,
                                TapAction: () {
                                  setState(() {
                                    widget.website = "";
                                  });
                                },
                                text: "No I am not the one",
                                color: Colors.black,
                                icon: Icons.cancel)
                          ],
                        )
                      : Column(
                          children: [
                            SmallText(
                                text:
                                    "Hustle free product addition using the built in store to any ote platform !"),
                            const SizedBox(
                              height: 15,
                            ),
                            Container(
                              padding: const EdgeInsets.only(
                                  right: 10, left: 10, bottom: 2, top: 2),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(5),
                                  border: Border.all(
                                    color: const Color.fromARGB(
                                        255, 200, 200, 200),
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
                            const SizedBox(
                              height: 10,
                            ),
                            BoxedTextField(
                              TapAction: () {},
                              controller: _linkController,
                              icon: Icons.business,
                              placeholder:
                                  'e.g \"https://foodpanda.com/store-name\""',
                            ),
                            const SizedBox(
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
                ],
              ),
            ),
    );
  }
}
