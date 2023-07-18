// ignore_for_file: unused_import, prefer_final_fields, file_names, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';
import 'package:spot_hub/configurations/AppColors.dart';
import 'package:spot_hub/configurations/BigText.dart';
import 'package:spot_hub/configurations/SmallText.dart';
import 'package:spot_hub/models/BusinessModels/Bussiness.dart';
import 'package:spot_hub/screens/BussinessLogin/BussinessHome.dart';
import 'package:spot_hub/screens/BussinessLogin/ManageBussiness/Dashboard.dart';
import 'package:spot_hub/widgets/default_widgets/Loading.dart';
import 'package:spot_hub/screens/UserLogin/home/MainPage.dart';
import 'package:spot_hub/screens/UserLogin/nav_search/MainSearch.dart';
import 'package:spot_hub/screens/UserLogin/nav_account/CustomerAccount.dart';
import 'package:spot_hub/screens/UserLogin/nav_more/More.dart';
import 'package:spot_hub/widgets/primary_widgets/BoxedTextField.dart';
import 'package:spot_hub/widgets/other_widgets/IconBox.dart';
import 'package:spot_hub/widgets/default_widgets/UnderConstruction.dart';

class AddNewBussiness extends StatefulWidget {
  const AddNewBussiness({super.key});

  @override
  State<AddNewBussiness> createState() => _AddNewBussinessState();
}

class _AddNewBussinessState extends State<AddNewBussiness> {
  bool isLoading = false;
  late List<Step> steps;
  bool isResturant = true;
  String _selectedCity = "Karachi";
  String _selectedType = "Resturant";

  bool isPicked = false;

  final List<String> _bussinesstype = ["Resturant", "Hotel"];
  final List<String> _cities = [
    'Karachi',
    'Lahore',
    'Islamabad',
    'Rawalpindi',
    'Faisalabad',
    'Multan',
    'Gujranwala',
    'Quetta',
    'Peshawar',
    'Hyderabad',
    'Sialkot',
    'Bahawalpur',
    'Sukkur',
    'Larkana',
    'Jhang',
    'Sheikhupura',
    'Mardan',
    'Gujrat',
    'Kasur',
    'Rahim Yar Khan',
    'Sahiwal',
    'Okara',
    'Wah Cantonment',
    'Dera Ghazi Khan',
    'Mingora',
    'Mirpur Khas',
    'Chiniot',
    'Nawabshah',
    'Kamoke'
  ];
  int _CurrentStep = 0;
  TextEditingController _bussinessName = TextEditingController();
  TextEditingController _bussinessPhone = TextEditingController();
  TextEditingController _bussinessEmail = TextEditingController();
  TextEditingController _bussinessLocation = TextEditingController();
  TextEditingController _bussinessAddress = TextEditingController();
  TextEditingController _bussinessWebsite = TextEditingController();
  TextEditingController _bussiness_Type = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return isLoading == true
        ? const Loading(message: "Registring your bussiness")
        : Scaffold(
            appBar: AppBar(
              backgroundColor: AppColors.PrimaryColor,
              title: BigText(
                text: "Spothub for Bussiness",
                color: Colors.white,
              ),
            ),
            body: Stepper(
                physics: const AlwaysScrollableScrollPhysics(),
                type: StepperType.horizontal,
                currentStep: _CurrentStep,
                onStepCancel: () => {
                      if (_CurrentStep > 0)
                        {
                          setState(() {
                            _CurrentStep = _CurrentStep - 1;
                          })
                        }
                      else
                        {
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text("There is no previous Step")))
                        },
                    },
                onStepTapped: (value) => {
                      setState(() {
                        _CurrentStep = value;
                      })
                    },
                onStepContinue: () async {
                  if (0 <= _CurrentStep && _CurrentStep < steps.length - 1) {
                    setState(() {
                      _CurrentStep = _CurrentStep + 1;
                    });
                  } else {
                    if (_bussinessName.text.isNotEmpty &&
                        _bussinessEmail.text.isNotEmpty &&
                        _bussinessPhone.text.isNotEmpty) {
                      setState(() {
                        isLoading = true;
                      });
                      // ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Gonna Register")))

                      await RegisterBussiness(
                          "https://www.posist.com/restaurant-times/wp-content/uploads/2016/12/restaurant-delivery-orders-1024x683.jpg",
                          _bussinessName.text,
                          _bussinessEmail.text,
                          _selectedCity.toString(),
                          _bussinessAddress.text,
                          _bussinessPhone.text,
                          _selectedType.toString(),
                          _bussinessWebsite.text);

                      setState(() {
                        isLoading = false;
                      });

                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => BussinessHome()));
                      QuickAlert.show(
                        context: context,
                        type: QuickAlertType.success,
                        text: 'Bussiness Registered Successfully!',
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text("Some required of fields are empty")));
                    }

                    // showDialog(
                    //     context: context,
                    //     builder: (context) => UnderConstruction(message: "No step Back",))

                    // ScaffoldMessenger.of(context).showSnackBar(
                    //     const SnackBar(content: Text("There is no next Step")))
                  }
                },
                steps: steps = [
                  // Add Bussiness Name Seperate ----
                  Step(
                    title: const Text(""),
                    content: AnimatedSwitcher(
                        switchInCurve: Curves.bounceIn,
                        duration: const Duration(milliseconds: 1000),
                        child: Column(
                            //    padding: const EdgeInsets.all(10),
                            children: [
                              BigText(
                                text:
                                    "Hello! Let\’s start with your business name",
                                size: 26,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              SmallText(
                                  text:
                                      "We\’ll use this information to help you claim your Spot hub page. Your business will come up automatically if it is already listed."),
                              const SizedBox(
                                height: 10,
                              ),
                              BoxedTextField(
                                TapAction: () {
                                  //  print("input");
                                },
                                controller: _bussinessName,
                                icon: Icons.business,
                                placeholder: 'e.g \"Spothub\"',
                              ),
                            ])),
                  ),
                  // Add Bussiness Email Seperate ----
                  Step(
                    title: const Text(""),
                    content: Column(
                        //   padding: const EdgeInsets.all(10),
                        children: [
                          BigText(
                            text: "Write your bussiness Email",
                            size: 25,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          SmallText(
                              text:
                                  "Write an authentic email which is in your use, as there will be an email verfication later"),
                          const SizedBox(
                            height: 10,
                          ),
                          BoxedTextField(
                            TapAction: () {
                              print("input");
                            },
                            controller: _bussinessEmail,
                            icon: Icons.email,
                            placeholder: 'e.g \"admin@spothub.com\""',
                          ),
                        ]),
                  ),
                  // Add Bussiness Phone Number Seperate ----
                  Step(
                    title: const Text(""),
                    content: Column(
                        //   padding: const EdgeInsets.all(10),
                        children: [
                          BigText(
                            text:
                                "Give customers a phone number so they can call your business",
                            size: 25,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          SmallText(
                              text:
                                  "Add the phone number of ${_bussinessName.text} to help customers connect with you."),
                          const SizedBox(
                            height: 10,
                          ),
                          BoxedTextField(
                            TapAction: () {
                              print("input");
                            },
                            controller: _bussinessPhone,
                            icon: Icons.phone,
                            placeholder: 'e.g \"+12 345 6789\""',
                          ),
                        ]),
                  ),
                  // Add Bussiness Type with Boxes Seperate ----
                  Step(
                    title: const Text(""),
                    content: Column(
                        //   padding: const EdgeInsets.all(10),
                        children: [
                          BigText(
                            text: "What's the bussiness type ?",
                            size: 25,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          SmallText(
                              text:
                                  "Is ${_bussinessName.text} a resturant or the hotel, choose below"),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              IconBox(
                                mainIcon: Icons.restaurant,
                                Text: "Resturant",
                                isSelected: isResturant == true ? true : false,
                                OnClickFuntion: () {
                                  print("i am fine, and resturant");

                                  setState(() {
                                    if (isResturant == false) {
                                      isResturant = true;
                                      _selectedType = "Resturant";
                                    }
                                    _CurrentStep = _CurrentStep + 1;
                                  });
                                },
                              ),
                              IconBox(
                                mainIcon: Icons.hotel,
                                Text: "Hotel",
                                isSelected: isResturant == false ? true : false,
                                OnClickFuntion: () {
                                  print("i am fine, and hotel");
                                  setState(() {
                                    if (isResturant == true) {
                                      isResturant = false;
                                      _selectedType = "Hotel";
                                    }
                                    _CurrentStep = _CurrentStep + 1;
                                  });
                                },
                              ),
                            ],
                          )
                        ]),
                  ),
                  // Add Bussiness Form Complete ----
                  Step(
                    title: const Text(""),
                    content: SingleChildScrollView(
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          //   padding: const EdgeInsets.all(10),
                          children: [
                            BigText(
                              isCentre: false,
                              text: "Add your bussiness",
                              size: 25,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            SmallText(
                                text:
                                    "Enter the details below to claim a free listing page"),
                            const SizedBox(
                              height: 15,
                            ),
                            SmallText(
                              text: "Bussiness Name*",
                              size: 5,
                              color: AppColors.PrimaryColor,
                            ),
                            BoxedTextField(
                              TapAction: () {},
                              controller: _bussinessName,
                              icon: Icons.business,
                              placeholder: 'e.g \"Spot Hub\""',
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            SmallText(
                              text: "Bussiness City*",
                              size: 5,
                              color: AppColors.PrimaryColor,
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
                                value: _selectedCity,
                                hint: SmallText(text: 'Select City'),
                                items: _cities.map((city) {
                                  return DropdownMenuItem(
                                    value: city,
                                    child: Row(
                                      children: [
                                        Icon(
                                          Icons.location_city,
                                          color: AppColors.PrimaryColor,
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        Text(city),
                                      ],
                                    ),
                                  );
                                }).toList(),
                                onChanged: (selectedCity) {
                                  setState(() {
                                    _selectedCity = selectedCity!;
                                  });
                                },
                              ),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            SmallText(
                              text: "Bussiness Type*",
                              size: 5,
                              color: AppColors.PrimaryColor,
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
                                value: _selectedType,
                                hint: SmallText(text: 'Select Bussiness Type'),
                                items: _bussinesstype.map((type) {
                                  return DropdownMenuItem(
                                    value: type,
                                    child: Row(
                                      children: [
                                        Icon(
                                          Icons.circle,
                                          color: AppColors.PrimaryColor,
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        Text(type),
                                      ],
                                    ),
                                  );
                                }).toList(),
                                onChanged: (selectedType) {
                                  setState(() {
                                    _selectedType = selectedType!;
                                  });
                                },
                              ),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            SmallText(
                              text: "Bussiness Email*",
                              size: 5,
                              color: AppColors.PrimaryColor,
                            ),
                            BoxedTextField(
                              TapAction: () {
                                print("input");
                              },
                              controller: _bussinessEmail,
                              icon: Icons.email,
                              placeholder: 'e.g \"admin@spothub.com\""',
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            SmallText(
                              text: "Bussiness Phone No*",
                              size: 5,
                              color: AppColors.PrimaryColor,
                            ),
                            BoxedTextField(
                              TapAction: () {
                                print("input");
                              },
                              controller: _bussinessPhone,
                              icon: Icons.phone,
                              placeholder: 'e.g \"+12 345 6789\""',
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            SmallText(
                              text: "Bussiness Address",
                              size: 5,
                              color: AppColors.PrimaryColor,
                            ),
                            BoxedTextField(
                              TapAction: () {
                                print("input");
                              },
                              controller: _bussinessAddress,
                              icon: Icons.pin_drop,
                              placeholder:
                                  'e.g \"Street 101, Platinum Plaza\""',
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            SmallText(
                              text: "Bussiness Website",
                              size: 5,
                              color: AppColors.PrimaryColor,
                            ),
                            BoxedTextField(
                              TapAction: () {
                                //print("input");
                              },
                              controller: _bussinessWebsite,
                              icon: Icons.web_rounded,
                              placeholder: 'e.g \"https://spothub.com\""',
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                          ]),
                    ),
                  ),
                ]),
          );
  }
}
