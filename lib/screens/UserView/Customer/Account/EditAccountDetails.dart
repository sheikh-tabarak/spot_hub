import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:spot_hub/configurations/AppColors.dart';
import 'package:spot_hub/configurations/BigText.dart';
import 'package:spot_hub/configurations/SmallText.dart';
import 'package:spot_hub/database/Authentication.dart';
import 'package:spot_hub/widgets/others/PlaneTextField.dart';
import 'package:spot_hub/configurations/Dimensions.dart';
import 'package:spot_hub/widgets/others/PrimayButton.dart';

class EditAccountDetails extends StatefulWidget {
  final String ImageLink;
  final String Name;
  final String Phone;
  final String Address;
  final String Intrests;

  const EditAccountDetails(
      {super.key,
      required this.ImageLink,
      required this.Name,
      required this.Phone,
      required this.Address,
      required this.Intrests});

  @override
  State<EditAccountDetails> createState() => _EditAccountDetailsState();
}

class _EditAccountDetailsState extends State<EditAccountDetails> {
  String thisiserror = "Information Updated Successfully";

  String _Intrests = "11111";
  TextEditingController _ImageController = TextEditingController();
  TextEditingController _NameController = TextEditingController();
  // TextEditingController _emailController = TextEditingController();
  TextEditingController _PhoneController = TextEditingController();
  TextEditingController _AddressController = TextEditingController();

  bool _iserror = false;
  bool _desiSelected = false;
  bool _fastFoodSelected = false;
  bool _chineseSelected = false;
  bool _seaFoodSelected = false;
  bool _otherSelected = false;

  void _setIntrestBoxes(String I) {
    print(I.substring(0, 1).toString());
    print(I.substring(1, 2).toString());
    print(I.substring(2, 3).toString());
    print(I.substring(3, 4).toString());
    print(I.substring(4, 5).toString());

    if (I.substring(0, 1).toString() == "1") {
      setState(() {
        _desiSelected = true;
      });
    }
    if (I.substring(1, 2).toString() == "1") {
      setState(() {
        _fastFoodSelected = true;
      });
    }
    if (I.substring(2, 3).toString() == "1") {
      setState(() {
        _chineseSelected = true;
      });
    }
    if (I.substring(3, 4).toString() == "1") {
      setState(() {
        _seaFoodSelected = true;
      });
    }
    if (I.substring(4, 5).toString() == "1") {
      setState(() {
        _otherSelected = true;
      });
    }
  }

  String getIntrestBoxes() {
    Char a, b, c, d, e, f = "0" as Char;
    String IntrestCode = widget.Intrests;

    if (_desiSelected = true) {
      a = "1" as Char;
    } else if (_fastFoodSelected = true) {
      b = "1" as Char;
    } else if (_chineseSelected = true) {
      b = "1" as Char;
    } else if (_seaFoodSelected = true) {
      b = "1" as Char;
    } else if (_otherSelected = true) {
      b = "1" as Char;
    }

    //IntrestCode="${a}+${b}+${c}+${d}+${e}";

    return IntrestCode;
  }

  @override
  initState() {
    super.initState();

    setState(() {
      _ImageController.text = widget.ImageLink;
      _NameController.text = widget.Name;
      _AddressController.text = widget.Address;
      _PhoneController.text = widget.Phone;
    });
    _setIntrestBoxes(widget.Intrests);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.PrimaryColor,
        title: BigText(
          text: "Edit Account Info",
          color: Colors.white,
        ),
      ),
      body: Container(
        height: 600,
        padding: EdgeInsets.all(Dimensions.height15),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Stack(
                alignment: Alignment.bottomRight,
                children: [
                  const CircleAvatar(
                    // align:Alignment.center,
                    radius: 60,
                    backgroundImage: NetworkImage(
                        "https://pbs.twimg.com/media/FjU2lkcWYAgNG6d.jpg"),
                  ),
                  Container(
                    width: 40,
                    height: 40,
                    padding: EdgeInsets.all(Dimensions.height10),
                    alignment: Alignment.topRight,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: const [
                          BoxShadow(
                              color: Colors.black,
                              offset: Offset.zero,
                              blurRadius: 5,
                              blurStyle: BlurStyle.normal,
                              spreadRadius: -2)
                        ],
                        borderRadius: BorderRadius.circular(50)),
                    child: Icon(
                      Icons.edit,
                      color: AppColors.PrimaryColor,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: Dimensions.height15,
              ),
              _iserror == true
                  ? Container(
                      margin: EdgeInsets.only(left: 12, right: 12),
                      padding: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(7),
                      ),
                      child: Row(
                        //  crossAxisAlignment: WrapCrossAlignment.center,
                        // alignment: WrapAlignment.spaceEvenly,
                        // direction: Axis.horizontal,
                        //    mainAxisSize: MainAxisSize.min,
                        verticalDirection: VerticalDirection.down,
                        textDirection: TextDirection.ltr,
                        //   crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.check_circle,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: SmallText(
                              iscentre: false,
                              text: thisiserror,
                              color: const Color.fromARGB(255, 255, 255, 255),
                            ),
                          ),
                        ],
                      ),
                    )
                  : SizedBox(
                      height: 0,
                    ),
              SizedBox(
                height: Dimensions.height5,
              ),
              PlaneTextField(
                controller: _NameController,
                icon: Icons.account_box,
                onChange: () {},
                placeholder: 'Username',
              ),
              // PlaneTextField(
              //   controller: _emailController,
              //   icon: Icons.email,
              //   onChange: () {},
              //   placeholder: 'Email',
              // ),
              PlaneTextField(
                controller: _PhoneController,
                icon: Icons.phone,
                onChange: () {},
                placeholder: 'Phone No',
              ),
              PlaneTextField(
                controller: _AddressController,
                icon: Icons.pin_drop,
                onChange: () {},
                placeholder: 'Address',
              ),

              Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.only(
                    left: Dimensions.width15, top: Dimensions.height10),
                child: SmallText(
                  text: "INTRESTS",
                  iscentre: false,
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 10, left: 10, right: 10),
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                    border: Border.all(
                        width: 1,
                        color: const Color.fromARGB(255, 218, 218, 218)),
                    borderRadius: const BorderRadius.all(Radius.circular(5))),
                child: CheckboxListTile(
                  title: Text('Desi'),
                  value: _desiSelected,
                  //onChanged: (value) => {set},
                  onChanged: (value) {
                    setState(() {
                      _desiSelected = value!;
                    });
                  },
                  secondary: Icon(
                    Icons.local_dining,
                    color: AppColors.PrimaryColor,
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 10, left: 10, right: 10),
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                    border: Border.all(
                        width: 1,
                        color: const Color.fromARGB(255, 218, 218, 218)),
                    borderRadius: const BorderRadius.all(Radius.circular(5))),
                child: CheckboxListTile(
                  title: const Text('Fast Food'),
                  value: _fastFoodSelected,
                  onChanged: (value) {
                    setState(() {
                      _fastFoodSelected = value!;
                    });
                  },
                  secondary: Icon(
                    Icons.fastfood,
                    color: AppColors.PrimaryColor,
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 10, left: 10, right: 10),
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                    border: Border.all(
                        width: 1,
                        color: const Color.fromARGB(255, 218, 218, 218)),
                    borderRadius: const BorderRadius.all(Radius.circular(5))),
                child: CheckboxListTile(
                  title: Text('Chinese'),
                  value: _chineseSelected,
                  onChanged: (value) {
                    setState(() {
                      _chineseSelected = value!;
                    });
                  },
                  secondary: Icon(
                    Icons.restaurant,
                    color: AppColors.PrimaryColor,
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 10, left: 10, right: 10),
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                    border: Border.all(
                        width: 1,
                        color: const Color.fromARGB(255, 218, 218, 218)),
                    borderRadius: const BorderRadius.all(Radius.circular(5))),
                child: CheckboxListTile(
                  title: Text('Sea Food'),
                  value: _seaFoodSelected,
                  onChanged: (value) {
                    setState(() {
                      _seaFoodSelected = value!;
                    });
                  },
                  secondary: Icon(
                    Icons.local_florist,
                    color: AppColors.PrimaryColor,
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 10, left: 10, right: 10),
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                    border: Border.all(
                        width: 1,
                        color: const Color.fromARGB(255, 218, 218, 218)),
                    borderRadius: const BorderRadius.all(Radius.circular(5))),
                child: CheckboxListTile(
                  title: Text('Other'),
                  value: _otherSelected,
                  onChanged: (value) {
                    setState(() {
                      _otherSelected = value!;
                    });
                  },
                  secondary: Icon(
                    Icons.add,
                    color: AppColors.PrimaryColor,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        // height: ,
        child:
            //Text("This is testing text"),
            Container(
          margin: EdgeInsets.all(Dimensions.height15),
          height: 70,
          child: PrimaryButton(
              TapAction: () async {
                //  print("Account Information Updated");

                // setState(() {
                //   _iserror = true;
                // });
                setState(() {
                  _iserror = true;
                  thisiserror = "Saving Data...";
                });

                bool updated = await updateAccountInfo(
                    _NameController.text,
                    _AddressController.text,
                    _ImageController.text,
                    _PhoneController.text,
                    _Intrests);

                if (updated) {

                  updateAccountInfo(
                    _NameController.text,
                    _AddressController.text,
                    _ImageController.text,
                    _PhoneController.text,
                    _Intrests);
                  setState(() {
                    thisiserror = message.toString();
                  });
                } else if (updated = false) {
                  setState(() {

                    thisiserror = "No information to Update";
                  });
                }
                print("this is after > " + thisiserror);
              },
              text: "Update Information",
              color: AppColors.PrimaryColor,
              icon: Icons.update),
        ),
      ),
    );
  }
}
