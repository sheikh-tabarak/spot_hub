// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:spot_hub/configurations/AppColors.dart';
import 'package:spot_hub/configurations/BigText.dart';
import 'package:spot_hub/widgets/BoxedTextField.dart';
import 'package:spot_hub/widgets/PrimayButton.dart';

class AddFood extends StatefulWidget {
  const AddFood({super.key});

  @override
  State<AddFood> createState() => _AddFoodState();
}

class _AddFoodState extends State<AddFood> {
  final titleController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: Column(
            mainAxisAlignment:MainAxisAlignment.start,
            children: [
              BigText(
                text: 'Add new food item',
                color: Colors.white,
              ),
              BoxedTextField(
                 TapAction: (){},
                controller:titleController ,
                placeholder: 'Title', icon: Icons.title_outlined),
          //    BoxedTextField(placeholder: 'Description', icon: Icons.description),
               Container(
          padding: const EdgeInsets.all(5),
          child: TextField(
            controller: null,
            keyboardType: TextInputType.multiline,
            minLines: 2, //Normal textInputField will be displayed
            maxLines: 10,
            cursorColor: AppColors.PrimaryColor,
            onChanged: (String value) => {
              //print(value)
              },
            decoration: InputDecoration(
                border: const OutlineInputBorder(),
                hintText: 'description',
              //  prefixIconConstraints: BoxConstraints(maxHeight: 100),
                prefixIcon: const Icon(Icons.description),
              
                fillColor: AppColors.lightBackgroundColor,
                prefixIconColor: AppColors.PrimaryColor,
                filled: true,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                //   hoverColor: AppColors.PrimaryColor,
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(width: 2, color: AppColors.PrimaryColor),
                  borderRadius: BorderRadius.circular(15),
                ),
                focusColor: AppColors.PrimaryColor),
          )),
      
              // BoxedTextField(placeholder: 'Category', icon: Icons.category),
              // BoxedTextField(placeholder: 'Price', icon: Icons.price_check),
              // BoxedTextField(placeholder: 'Location', icon: Icons.pin_drop),
             
              Row(
                children: [
                  Container(
                    margin: const EdgeInsets.all(10),
                    padding: const EdgeInsets.all(25),
                    
                    decoration:
                        const BoxDecoration(color: Color.fromARGB(255, 231, 231, 231)),
                    child: const Center(
                        child: Icon(
                      Icons.add_a_photo,
                    )),
                  )
                ],
              ),
              PrimaryButton(
                  TapAction: (){}, text: 'Add Item', color: AppColors.PrimaryColor, icon: Icons.add)
            ],
          ),
        ),
      ),
    );
  }
}
