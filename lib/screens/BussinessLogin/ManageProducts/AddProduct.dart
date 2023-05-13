import 'package:flutter/material.dart';
import 'package:spot_hub/configurations/AppColors.dart';
import 'package:spot_hub/configurations/BigText.dart';
import 'package:spot_hub/screens/BussinessLogin/ManageBussiness/BussinessHome.dart';
import 'package:spot_hub/screens/BussinessLogin/ManageBussiness/Dashboard.dart';
import 'package:spot_hub/widgets/others/BoxedTextField.dart';
import 'package:spot_hub/widgets/others/PrimayButton.dart';

class AddProduct extends StatefulWidget {
  const AddProduct({super.key});

  @override
  State<AddProduct> createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  final titleController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    controller: titleController,
                    placeholder: 'Title',
                    icon: Icons.title_outlined),

                BoxedTextField(
                  placeholder: 'Description',
                  icon: Icons.details,
                  TapAction: () {},
                  controller: titleController,
                ),

                BoxedTextField(
                  placeholder: 'Category',
                  icon: Icons.category,
                  TapAction: () {},
                  controller: titleController,
                ),
                BoxedTextField(
                  placeholder: 'Price',
                  icon: Icons.price_check,
                  TapAction: () {},
                  controller: titleController,
                ),
                BoxedTextField(
                  placeholder: 'Location',
                  icon: Icons.pin_drop,
                  TapAction: () {},
                  controller: titleController,
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
                    // Container(
                    //   margin: const EdgeInsets.all(10),
                    //   padding: const EdgeInsets.all(25),
                    //   decoration: const BoxDecoration(
                    //       color: Colors.white),
                    //   child: const Center(
                    //       child: Icon(
                    //     Icons.add,
                    //   )),
                    // ),
                    // Container(
                    //   margin: const EdgeInsets.all(10),
                    //   padding: const EdgeInsets.all(25),
                    //   decoration: const BoxDecoration(
                    //       color: Colors.white),
                    //   child: const Center(
                    //       child: Icon(
                    //     Icons.add,
                    //   )),
                    // ),
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
            TapAction: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: ((context) => BussinessHome())));
            },
            text: 'Add Item',
            color: AppColors.PrimaryColor,
            icon: Icons.add),
      ),
    );
 
  }
}
