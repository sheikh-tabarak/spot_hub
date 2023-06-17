// ignore_for_file: non_constant_identifier_names

import 'dart:ui';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:spot_hub/configurations/AppColors.dart';
import 'package:spot_hub/configurations/Dimensions.dart';
import 'package:spot_hub/models/DummyData.dart';
import 'package:spot_hub/models/BusinessModels/Product.dart';
import 'package:spot_hub/models/UserModels/UserClass.dart';
import 'package:spot_hub/screens/UserLogin/User/Account/CustomerAccount.dart';
import 'package:spot_hub/screens/UserLogin/SearchFrame/MainSearch.dart';
import 'package:spot_hub/screens/UserLogin/User/More.dart';
import 'package:spot_hub/screens/UserLogin/User/NoLogin.dart';
import 'package:spot_hub/screens/UserLogin/SearchFrame/SearchPage.dart';
import 'package:spot_hub/screens/UserLogin/User/SpotFlicks/spot_flicks.dart';
import 'package:spot_hub/screens/UserLogin/chat/MessengerScreen.dart';
import 'package:spot_hub/widgets/Product/ProductCard.dart';
import 'package:spot_hub/widgets/others/ChoiceIcon.dart';

class MainPage extends StatefulWidget {
  UserClass MainUser;
  final bool isLoggedin;
  final int PI;

  MainPage({
    Key? key,
    this.MainUser = const UserClass(
        IsBussiness: false,
        image: "",
        username: "",
        password: "",
        email: "",
        PhoneNo: "",
        Intrests: "",
        Address: "",
        UserId: ""),
    required this.isLoggedin,
    required this.PI,
  }) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final List<String> imageUrls = [
    'assets/images/banner01.png',
    'assets/images/banner02.png',
    'assets/images/banner03.png',
  ];
  bool loggedin = false;

  int _PageIndex = 1;
  TextEditingController SearchController = TextEditingController();

  double wid = window.physicalSize.width;
  String myEmail = "guest@spothub.com";
  bool AmIBussiness = false;
  String myName = "Guest View";
  String myPhone = "123 456 7890";
  String myimage =
      "https://upload.wikimedia.org/wikipedia/commons/thumb/1/12/User_icon_2.svg/330px-User_icon_2.svg.png";
  String myIntrests = "10101";
  String myAddress = "Gujranwala";
  String myUserID = "";

  @override
  initState() {
    super.initState();

    _PageIndex = widget.PI;

    // Add listeners to this class
    try {
      getUserData().then((value) {
        print(value.IsBussiness);
        widget.MainUser = UserClass(
            IsBussiness: value.IsBussiness,
            image: value.image,
            username: value.username,
            password: value.password,
            email: value.email,
            PhoneNo: value.PhoneNo,
            Address: value.Address,
            Intrests: value.Intrests,
            UserId: value.UserId);

        setState(() {
          AmIBussiness = widget.MainUser.IsBussiness;
          myName = widget.MainUser.username;
          myEmail = widget.MainUser.email;
          myPhone = widget.MainUser.PhoneNo;
          myAddress = widget.MainUser.Address;
          myimage = widget.MainUser.image;
          myIntrests = widget.MainUser.Intrests;
          myUserID = widget.MainUser.UserId;
        });

        print(widget.MainUser.PhoneNo + " - " + widget.MainUser.email);
      });
    } catch (e) {}

    try {
      if (FirebaseAuth.instance.currentUser != null) {}
    } catch (e) {
      setState(() {
        loggedin = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        bottomNavigationBar: BottomNavigationBar(
            unselectedItemColor: Colors.grey,
            // iconSize: 20,
            selectedFontSize: 12,
            unselectedFontSize: 12,
            showSelectedLabels: true,
            showUnselectedLabels: true,
            currentIndex: _PageIndex,
            selectedItemColor: AppColors.PrimaryColor,
            onTap: ((value) => {
                  if (value == 1)
                    {
                      if (widget.isLoggedin == false)
                        {
                          showModalBottomSheet(
                              isScrollControlled: true,
                              context: context,
                              builder: (BuildContext bc) {
                                return const NoLogin();
                              }),
                        }
                      else
                        {
                          setState(
                            () => {_PageIndex = value},
                          ),
                        }
                    }
                  else
                    {
                      setState(() {
                        _PageIndex = value;
                        // _NavIndex=value;
                      }),
                    },
                }),
            items: [
              const BottomNavigationBarItem(
                  icon: Icon(Icons.search), label: 'Search'),

              BottomNavigationBarItem(
                  icon: widget.isLoggedin == false
                      ? const Icon(Icons.account_circle)
                      : Container(
                          width: 30,
                          height: 30,
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(50)),
                              image: DecorationImage(
                                  image: NetworkImage(widget.MainUser.image))),
                          //DecoratedBox(decoration: DecorationImage(image:  NetworkImage(widget.MainUser.image))),
                          child: Text(""),
                          // Image(
                          //     image: NetworkImage(widget.MainUser.image),
                          //     fit: BoxFit.contain,
                          //   ),
                        ),
                  label: 'Account'),
              const BottomNavigationBarItem(
                  icon: Icon(Icons.chat), label: 'Message'),
              const BottomNavigationBarItem(
                  icon: Icon(Icons.menu), label: 'More'),

              //  BottomNavigationBarItem(icon: Icon(Icons.menu),label: 'More')
            ]),
        body: _PageIndex == 2
            ? MessengerScreen()
            : _PageIndex == 3
                ? More(
                    MainUser: UserClass(
                        IsBussiness: AmIBussiness,
                        image: myimage,
                        username: myName,
                        password: "",
                        email: myEmail,
                        PhoneNo: myPhone,
                        Intrests: myIntrests,
                        Address: myAddress,
                        UserId: ""),
                    isLoggedin: widget.isLoggedin)
                : _PageIndex == 1 && widget.isLoggedin == true
                    ?
                    //loggedin==true?
                    CustomerAccount(
                        //MainUser: widget.MainUser
                        )
                    : SingleChildScrollView(
                        child: Column(
                          children: [
                            Stack(
                              alignment: AlignmentDirectional.bottomStart,
                              children: [
                                Container(
                                  margin: const EdgeInsets.only(bottom: 20),
                                  width: window.physicalSize.width,
                                  height: Dimensions.height40 * 7,
                                  decoration: const BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage(
                                              "assets/images/pizza-background.jpg"),
                                          fit: BoxFit.cover)),
                                ),
                                Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(40),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Text(
                                              "Find the best\nSpots to visit",
                                              style: TextStyle(
                                                  fontFamily: 'Poppins',
                                                  fontWeight: FontWeight.w900,
                                                  color: Colors.white,
                                                  fontSize: 30)),
                                          SizedBox(
                                            height: Dimensions.height10,
                                          ),
                                          ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                  padding:
                                                      const EdgeInsets.all(10),
                                                  textStyle: const TextStyle(
                                                      fontFamily: 'Poppins',
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      color: Colors.white,
                                                      fontSize: 15),
                                                  primary: Colors.red,
                                                  // onPrimary: Colors.white,
                                                  // shadowColor: Colors.greenAccent,
                                                  elevation: 0,
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5.0)),
                                                  // minimumSize: const Size(200,30),
                                                  maximumSize:
                                                      const Size(220, 40)),
                                              onPressed: () {
                                                Navigator.push(
                                                  context,
                                                  PageRouteBuilder(
                                                    pageBuilder: (context,
                                                            animation,
                                                            secondaryAnimation) =>
                                                        const SearchPage(
                                                      searchTitle:
                                                          "Recommended",
                                                    ),
                                                    transitionsBuilder: (context,
                                                            animation,
                                                            secondaryAnimation,
                                                            child) =>
                                                        SlideTransition(
                                                      position: Tween<Offset>(
                                                        begin:
                                                            const Offset(0, 1),
                                                        end: Offset.zero,
                                                      ).animate(animation),
                                                      child: child,
                                                    ),
                                                  ),
                                                );
                                              },
                                              child: Row(
                                                children: [
                                                  const Icon(Icons.search),
                                                  SizedBox(
                                                    width: Dimensions.width10,
                                                  ),
                                                  const Text('Recommendations')
                                                ],
                                              )),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: Dimensions.height20 * 3,
                                    ),

                                    // Container(
                                    //   alignment: Alignment.center,
                                    //   width: 300,
                                    //   child: TextField(
                                    //     controller: SearchController,

                                    //     onChanged: (String value) => {
                                    //   print(value)
                                    //     },
                                    //     decoration: InputDecoration(
                                    //     hintText: 'Search for hotels and food',
                                    //     prefixIcon: Icon(Icons.search),
                                    //     fillColor: AppColors.lightBackgroundColor,
                                    //     prefixIconColor: AppColors.PrimaryColor,
                                    //     filled: true,
                                    //     hoverColor: AppColors.PrimaryColor,
                                    //     focusColor: AppColors.PrimaryColor),
                                    //   ),
                                    // ),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 20, right: 20, top: 20),
                                  child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        padding: const EdgeInsets.all(15),
                                        foregroundColor: const Color.fromARGB(
                                            255, 147, 147, 147),
                                        textStyle: const TextStyle(
                                            fontFamily: 'Poppins',
                                            fontWeight: FontWeight.w400,
                                            color: Color.fromARGB(255, 0, 0, 0),
                                            fontSize: 15),
                                        primary: const Color.fromARGB(
                                            255, 254, 254, 254),
                                        // onPrimary: Colors.white,
                                        // shadowColor: Colors.greenAccent,
                                        elevation: 3,
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(5.0)),
                                        // minimumSize: const Size(200,30),
                                        // maximumSize: const Size(220, 20)
                                      ),
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          PageRouteBuilder(
                                            pageBuilder: (context, animation,
                                                    secondaryAnimation) =>
                                                const SearchPage(
                                              searchTitle: "",
                                            ),
                                            transitionsBuilder: (context,
                                                    animation,
                                                    secondaryAnimation,
                                                    child) =>
                                                SlideTransition(
                                              position: Tween<Offset>(
                                                begin: const Offset(0, 1),
                                                end: Offset.zero,
                                              ).animate(animation),
                                              child: child,
                                            ),
                                          ),
                                        );
                                      },
                                      child: Row(
                                        children: [
                                          const Icon(Icons.search),
                                          SizedBox(
                                            width: Dimensions.width10,
                                          ),
                                          const Text(
                                              'Search for hotels and food')
                                        ],
                                      )),
                                ),
                              ],
                            ),
                            Container(
                              padding: EdgeInsets.all(Dimensions.width10 * 4),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      ChoiceIcon(
                                        iconImage: const AssetImage(
                                            "assets/images/fastfood.png"),
                                        icontitle: "Fast Food ",
                                        TaptoDo: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      MainSearch(
                                                          Results:
                                                              "Fast Food")));
                                        },
                                      ),
                                      ChoiceIcon(
                                        iconImage: const AssetImage(
                                            "assets/images/seafood.png"),
                                        icontitle: "Sea Food",
                                        TaptoDo: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      MainSearch(
                                                          Results:
                                                              "Sea Food")));
                                        },
                                      ),
                                      ChoiceIcon(
                                        iconImage: const AssetImage(
                                            "assets/images/2desifood.png"),
                                        icontitle: "Desi Food",
                                        TaptoDo: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      MainSearch(
                                                          Results:
                                                              "Desi Food")));
                                        },
                                      ),
                                      ChoiceIcon(
                                        iconImage: const AssetImage(
                                            "assets/images/chinesefood.png"),
                                        icontitle: "Chineese",
                                        TaptoDo: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      MainSearch(
                                                          Results:
                                                              "Chineese")));
                                        },
                                      ),
                                    ],
                                  ),
                                  // SizedBox(
                                  //   height: Dimensions.height30,
                                  // ),
                                ],
                              ),
                            ),
                            Container(
                              height: 100,
                              width: double.infinity,
                              child: CarouselSlider(
                                options: CarouselOptions(
                                  aspectRatio: 16 / 9,
                                  autoPlay: true,
                                  enlargeCenterPage: true,
                                  viewportFraction: 0.8,
                                ),
                                items: imageUrls.map((imageUrl) {
                                  return Builder(
                                    builder: (BuildContext context) {
                                      return Container(
                                        width:
                                            MediaQuery.of(context).size.width,
                                        margin: const EdgeInsets.symmetric(
                                            horizontal: 5.0),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          child: Image.asset(
                                            imageUrl,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      );
                                    },
                                  );
                                }).toList(),
                              ),
                            ),

                            ListView.builder(
                                physics: const NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: 5,
                                itemBuilder: (context, index) {
                                  return ProductCard(
                                      products: Product(
                                          isRecommended: true,
                                          BussinessId: DummyBussinesses[index]
                                              .BussinessId,
                                          Id: DummyProducts[index].Id,
                                          image: DummyProducts[index].image,
                                          description:
                                              DummyProducts[index].description,
                                          title: DummyProducts[index].title,
                                          Price: DummyProducts[index].Price,
                                          rating: DummyProducts[index].rating,
                                          reviews:
                                              DummyProducts[index].reviews));
                                }),
                            // Padding(
                            //   padding: const EdgeInsets.only(top: 30),
                            //   child: Column(
                            //     crossAxisAlignment: CrossAxisAlignment.center,
                            //     children: [
                            //       Image.asset(
                            //         "assets/images/errorpage.jpg",
                            //         //  width: 340,height: 340,
                            //       ),
                            //     ],
                            //   ),
                            // )
                          ],
                        ),
                      )

        //NoLogin()

        );
  }
}
