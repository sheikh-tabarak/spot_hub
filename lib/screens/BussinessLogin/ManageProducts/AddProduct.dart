// Error while Uploading Image at updating frame
// Application wa getting crashed

import 'dart:ffi';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:spot_hub/configurations/AppColors.dart';
import 'package:spot_hub/configurations/BigText.dart';
import 'package:spot_hub/configurations/Dimensions.dart';
import 'package:spot_hub/configurations/SmallText.dart';
import 'package:spot_hub/models/BusinessModels/Product.dart';
import 'package:spot_hub/screens/BussinessLogin/ManageBussiness/BussinessHome.dart';
import 'package:spot_hub/screens/BussinessLogin/ManageBussiness/Dashboard.dart';
import 'package:spot_hub/screens/Loading.dart';
import 'package:spot_hub/widgets/others/BoxedTextField.dart';
import 'package:spot_hub/widgets/others/PrimayButton.dart';

class AddProduct extends StatefulWidget {
  final String titleId;
  final String title;
  final String description;
  final String category;
  final double Price;
  final String image;

  const AddProduct({
    super.key,
    this.titleId = "",
    this.title = "",
    this.description = "",
    this.category = "",
    this.Price = 0,
    this.image = "",
  });

  @override
  State<AddProduct> createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  String _selectedCategory = "Fast Food";
  String _LoaingCommands = "Fetching product";
  String imageaddress = "";
  String imagetoUpload = "";
  bool isLoading = false;
  final _titleController = TextEditingController();
  final _descController = TextEditingController();
  final _categoryController = TextEditingController();
  final _priceController = TextEditingController();

  List<String> _categoriesCount = ["Desi", "Fast Food", "Sea Food", "Chineese"];
//  final _locationController = TextEditingController();

  @override
  void initState() {
    _titleController.text = widget.title;
    _descController.text = widget.description;
    _categoryController.text = widget.category;
    _priceController.text = widget.Price.toString();
    // TODO: implement initState
    super.initState();
  }

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

                      Container(
                        padding: const EdgeInsets.only(
                            right: 10, left: 10, bottom: 2, top: 2),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(
                              color: const Color.fromARGB(255, 200, 200, 200),
                              width: 1,
                            )),
                        child: DropdownButton(
                          isExpanded: true,
                          value: _selectedCategory,
                          hint: SmallText(text: 'Choose Category'),
                          items: _categoriesCount.map((category) {
                            return DropdownMenuItem(
                              value: category,
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.category,
                                    color: AppColors.PrimaryColor,
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Text(category),
                                ],
                              ),
                            );
                          }).toList(),
                          onChanged: (selectedCategory) {
                            setState(() {
                              _selectedCategory = selectedCategory!;
                            });
                            print(_selectedCategory);
                          },
                        ),
                      ),

                      BoxedTextField(
                        placeholder: 'Price',
                        icon: Icons.price_check,
                        TapAction: () {},
                        controller: _priceController,
                      ),

                      SizedBox(
                        height: 5,
                      ),

                      GestureDetector(
                        onTap: () async {
                          final result = await FilePicker.platform.pickFiles(
                            allowMultiple: false,
                            type: FileType.custom,
                            allowedExtensions: ['png', 'jpg'],
                          );

                          print(result!.files.single.path);
                          if (result == null) {
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text('Error Uploading')));
                          } else {
                            final fileName = result.files.single.name;
                            final filePath = result.files.single.path!;
                            imagetoUpload = filePath;
                            // String ImageURL =
                            //     await uploadAccountImage(fileName, filePath);

                            setState(() {
                              imageaddress = result.files.single.path!;
                            });
                          }
                        },
                        child: Container(
                          height: 250,
                          // width: Dimensions.PageView + 40,
                          // height: Dimensions.PageView,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              image: imageaddress != ""
                                  ? DecorationImage(
                                      image: FileImage(
                                        File(imageaddress),
                                      ),
                                      fit: BoxFit.cover
                                      // AssetImage(imageaddress)
                                      )
                                  : DecorationImage(
                                      image: NetworkImage(widget.image),
                                      fit: BoxFit.cover
                                      // AssetImage(imageaddress)
                                      ),
                              color: Color.fromARGB(255, 231, 231, 231)),
                          child: Center(
                              child: imageaddress == ""
                                  ? Icon(
                                      Icons.add_a_photo,
                                    )
                                  : SizedBox()),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            bottomNavigationBar: Container(
              height: 80,
              child: PrimaryButton(
                  TapAction: widget.titleId == ""
                      ? () async {
                          setState(() {
                            isLoading = true;
                            _LoaingCommands = "Uploading your product Image";
                          });

                          if (imageaddress != "") {
                            String imageUploaded = "";

                            await uploadProductImage(
                                    '${_titleController.text} | ${DateTime.now().toString()}',
                                    imageaddress)
                                .then((value) => imageUploaded = value);

                            setState(() {
                              _LoaingCommands = "Adding your Product";
                            });

                            await AddNewProduct(
                                //  widget.titleId,
                                imageUploaded,
                                _titleController.text,
                                _descController.text,
                                _selectedCategory.toString(),
                                double.parse(_priceController.text));

                            setState(() {
                              _LoaingCommands = "Redirecting to Product list";
                            });

                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: ((context) => BussinessHome(
                                          PageIndex: 1,
                                        ))));

                            setState(() {
                              isLoading = false;
                            });
                          }
                        }
                      : () async {
                          // Updated Image

                          if (imageaddress != "") {
                            String imageUploaded = "";

                            setState(() {
                              isLoading = true;
                              _LoaingCommands = "Uploadng new Image";
                            });

                            await uploadProductImage(
                                    '${_titleController.text} | ${DateTime.now().toString()}',
                                    imageaddress)
                                .then((value) => imageUploaded = value);

                            setState(() {
                              _LoaingCommands = "Updating product information";
                            });

                            // Edit information with new Image Address
                            await EditProduct(
                              widget.titleId,
                              imageUploaded,
                              _titleController.text,
                              _descController.text,
                              _selectedCategory.toString(),
                              double.parse(_priceController.text),
                            );
                          } else {
                            setState(() {
                              isLoading = true;
                              _LoaingCommands = "Updating product information";
                            });

                            await EditProduct(
                              widget.titleId,
                              widget.image,
                              _titleController.text,
                              _descController.text,
                              _selectedCategory.toString(),
                              double.parse(_priceController.text),
                            );
                          }
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
                  text: widget.titleId == "" ? 'Add Item' : 'Update',
                  color: AppColors.PrimaryColor,
                  icon: widget.titleId == "" ? Icons.add : Icons.update),
            ),
          )
        : Scaffold(
            body: Loading(message: _LoaingCommands),
          );
  }
}
