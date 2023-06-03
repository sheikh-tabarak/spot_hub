import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:spot_hub/configurations/AppColors.dart';
import 'package:spot_hub/configurations/BigText.dart';
import 'package:spot_hub/models/BusinessModels/Product.dart';
import 'package:spot_hub/screens/BussinessLogin/ManageBussiness/BussinessHome.dart';
import 'package:spot_hub/screens/BussinessLogin/ManageBussiness/Dashboard.dart';
import 'package:spot_hub/screens/Loading.dart';
import 'package:spot_hub/widgets/others/BoxedTextField.dart';
import 'package:spot_hub/widgets/others/PrimayButton.dart';

class AddProduct extends StatefulWidget {
  const AddProduct({super.key});

  @override
  State<AddProduct> createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  bool isLoading = false;
  final _titleController = TextEditingController();
  final _descController = TextEditingController();
  final _categoryController = TextEditingController();
  final _priceController = TextEditingController();
  final _locationController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return isLoading == false
        ? Scaffold(
            appBar: AppBar(
              backgroundColor: AppColors.PrimaryColor,
              title: BigText(
                text: "Add New Product",
                color: Colors.white,
              ),
            ),
            body: SingleChildScrollView(
              child: Padding(
                //  width:,
                padding: const EdgeInsets.all(20),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      BigText(
                        text: 'Add new food item',
                        color: Colors.white,
                      ),
                      // Container(
                      //   child: ,
                      // )

                      BoxedTextField(
                          TapAction: () {},
                          controller: _titleController,
                          placeholder: 'Title',
                          icon: Icons.title_outlined),

                      BoxedTextField(
                        placeholder: 'Description',
                        icon: Icons.details,
                        maxLines: 3,
                        TapAction: () {},
                        controller: _descController,
                      ),

                      BoxedTextField(
                        placeholder: 'Category',
                        icon: Icons.category,
                        TapAction: () {},
                        controller: _categoryController,
                      ),
                      BoxedTextField(
                        placeholder: 'Price',
                        icon: Icons.price_check,
                        TapAction: () {},
                        controller: _priceController,
                      ),
                      BoxedTextField(
                        placeholder: 'Location',
                        icon: Icons.pin_drop,
                        TapAction: () {},
                        controller: _locationController,
                      ),

                      Row(
                        children: [
                          Container(
                            margin: const EdgeInsets.all(10),
                            padding: const EdgeInsets.all(25),
                            decoration: const BoxDecoration(
                                color: Color.fromARGB(255, 231, 231, 231)),
                            child: const Center(
                                child: Icon(
                              Icons.add_a_photo,
                            )),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            bottomNavigationBar: Container(
              height: 80,
              child: PrimaryButton(
                  TapAction: () async {
                    setState(() {
                      isLoading = true;
                    });
                    await AddNewProduct(
                        _titleController.text,
                        _descController.text,
                        _categoryController.text,
                        double.parse(_priceController.text),
                        _locationController.text);

                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: ((context) => BussinessHome(
                                  PageIndex: 1,
                                ))));

                    setState(() {
                      isLoading = false;
                    });
                  },
                  text: 'Add Item',
                  color: AppColors.PrimaryColor,
                  icon: Icons.add),
            ),
          )
        : Scaffold(
            body: Loading(message: "Adding a new product..."),
          );
  }
}
