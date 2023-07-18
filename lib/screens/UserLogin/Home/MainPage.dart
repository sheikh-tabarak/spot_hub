// ignore_for_file: non_constant_identifier_names
import 'dart:ui';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:spot_hub/configurations/AppColors.dart';
import 'package:spot_hub/configurations/BigText.dart';
import 'package:spot_hub/configurations/Dimensions.dart';
import 'package:spot_hub/configurations/SmallText.dart';
import 'package:spot_hub/models/BusinessModels/Bussiness.dart';
import 'package:spot_hub/models/DummyData.dart';
import 'package:spot_hub/models/BusinessModels/Product.dart';
import 'package:spot_hub/models/Global/ProductsData.dart';
import 'package:spot_hub/models/UserModels/Notification.dart';
import 'package:spot_hub/models/UserModels/UserClass.dart';
import 'package:spot_hub/widgets/default_widgets/Loading.dart';
import 'package:spot_hub/widgets/default_widgets/NoData.dart';
import 'package:spot_hub/screens/UserLogin/home/AllBussinesses.dart';
import 'package:spot_hub/screens/UserLogin/home/Notifications.dart';
import 'package:spot_hub/screens/UserLogin/nav_account/CustomerAccount.dart';
import 'package:spot_hub/screens/UserLogin/nav_more/More.dart';
import 'package:spot_hub/screens/UserLogin/nav_more/NoLogin.dart';
import 'package:spot_hub/screens/UserLogin/nav_search/MainSearch.dart';
import 'package:spot_hub/screens/UserLogin/nav_search/ReviewSelectionPage.dart';
import 'package:spot_hub/screens/UserLogin/chat/MessengerScreen.dart';
import 'package:spot_hub/widgets/product_widgets/ProductCard.dart';
import 'package:spot_hub/widgets/other_widgets/ChoiceIcon.dart';

class MainPage extends StatefulWidget {
  UserClass MainUser;
  bool isLoggedin;
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
    this.isLoggedin: true,
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

    FirebaseAuth.instance.currentUser.isBlank == true
        ? widget.isLoggedin == false
        : widget.isLoggedin == true;

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
                  if (value == 1 || value == 2)
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
                                  const BorderRadius.all(Radius.circular(50)),
                              image: DecorationImage(
                                  image: NetworkImage(widget.MainUser.image))),
                          child: const Text(""),
                        ),
                  label: 'Account'),
              const BottomNavigationBarItem(
                  icon: Icon(Icons.chat), label: 'Message'),
              const BottomNavigationBarItem(
                  icon: Icon(Icons.menu), label: 'More'),

              //  BottomNavigationBarItem(icon: Icon(Icons.menu),label: 'More')
            ]),
        body: _PageIndex == 2
            ? const MessengerScreen()
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
                    ? CustomerAccount(
                        //MainUser: widget.MainUser
                        )
                    : SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
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
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              const Text(
                                                  "Find the best\nSpots to visit",
                                                  style: TextStyle(
                                                      fontFamily: 'Poppins',
                                                      fontWeight:
                                                          FontWeight.w900,
                                                      color: Colors.white,
                                                      fontSize: 30)),
                                              widget.isLoggedin == true
                                                  ? StreamBuilder(
                                                      stream:
                                                          unReadNotificationsCount(
                                                              widget.MainUser
                                                                  .UserId),
                                                      builder: (context,
                                                          AsyncSnapshot<
                                                                  QuerySnapshot>
                                                              snapshot) {
                                                        if (snapshot.hasData) {
                                                          if (snapshot
                                                              .data!
                                                              .docs
                                                              .isNotEmpty) {
                                                            return Container(
                                                              decoration: BoxDecoration(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              30),
                                                                  color: Colors
                                                                      .white),
                                                              child: Stack(
                                                                alignment:
                                                                    Alignment
                                                                        .topRight,
                                                                children: [
                                                                  IconButton(
                                                                      onPressed:
                                                                          () {
                                                                        widget.isLoggedin ==
                                                                                true
                                                                            ? Navigator.push(context,
                                                                                MaterialPageRoute(builder: (context) => Notifications(currentUser: widget.MainUser)))
                                                                            : showModalBottomSheet(
                                                                                isScrollControlled: true,
                                                                                context: context,
                                                                                builder: (BuildContext bc) {
                                                                                  return const NoLogin();
                                                                                });
                                                                      },
                                                                      color: Colors
                                                                          .white,
                                                                      icon:
                                                                          Icon(
                                                                        Icons
                                                                            .notifications,
                                                                        color: AppColors
                                                                            .PrimaryColor,
                                                                        size:
                                                                            35,
                                                                      )),
                                                                  Container(
                                                                    alignment:
                                                                        Alignment
                                                                            .center,
                                                                    padding:
                                                                        EdgeInsets
                                                                            .zero,
                                                                    width: 25,
                                                                    height: 25,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      border: Border.all(
                                                                          width:
                                                                              2,
                                                                          color:
                                                                              Colors.white),
                                                                      color: AppColors
                                                                          .PrimaryColor,
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              30),
                                                                    ),
                                                                    child:
                                                                        SmallText(
                                                                      text: snapshot.data!.docs.length <=
                                                                              9
                                                                          ? snapshot
                                                                              .data!
                                                                              .docs
                                                                              .length
                                                                              .toString()
                                                                          : "9+",
                                                                      size: 10,
                                                                      color: Colors
                                                                          .white,
                                                                    ),
                                                                  )
                                                                ],
                                                              ),
                                                            );
                                                          } else {
                                                            return Container(
                                                              decoration: BoxDecoration(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              30),
                                                                  color: Colors
                                                                      .white),
                                                              child: IconButton(
                                                                  onPressed:
                                                                      () {
                                                                    widget.isLoggedin ==
                                                                            true
                                                                        ? Navigator.push(
                                                                            context,
                                                                            MaterialPageRoute(builder: (context) => Notifications(currentUser: widget.MainUser)))
                                                                        : showModalBottomSheet(
                                                                            isScrollControlled: true,
                                                                            context: context,
                                                                            builder: (BuildContext bc) {
                                                                              return const NoLogin();
                                                                            });
                                                                  },
                                                                  color: Colors
                                                                      .white,
                                                                  icon: Icon(
                                                                    Icons
                                                                        .notifications,
                                                                    color: AppColors
                                                                        .PrimaryColor,
                                                                    size: 35,
                                                                  )),
                                                            );
                                                          }
                                                        } else {
                                                          return Container(
                                                            decoration: BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            30),
                                                                color: Colors
                                                                    .white),
                                                            child: IconButton(
                                                                onPressed: () {
                                                                  widget.isLoggedin ==
                                                                          true
                                                                      ? Navigator.push(
                                                                          context,
                                                                          MaterialPageRoute(
                                                                              builder: (context) => Notifications(
                                                                                  currentUser: widget
                                                                                      .MainUser)))
                                                                      : showModalBottomSheet(
                                                                          isScrollControlled:
                                                                              true,
                                                                          context:
                                                                              context,
                                                                          builder:
                                                                              (BuildContext bc) {
                                                                            return const NoLogin();
                                                                          });
                                                                },
                                                                color: Colors
                                                                    .white,
                                                                icon: Icon(
                                                                  Icons
                                                                      .notifications,
                                                                  color: AppColors
                                                                      .PrimaryColor,
                                                                  size: 35,
                                                                )),
                                                          );
                                                        }
                                                      })
                                                  : const SizedBox()
                                            ],
                                          ),
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
                                                  minimumSize:
                                                      const Size(200, 30),
                                                  maximumSize:
                                                      const Size(220, 40)),
                                              onPressed: () {
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                      builder: (context) =>
                                                          AllBussinesses(
                                                              isLoggedin: widget
                                                                  .isLoggedin),
                                                    ));
                                              },
                                              child: Row(
                                                // crossAxisAlignment:
                                                //     CrossAxisAlignment.center,
                                                children: [
                                                  const Icon(Icons.search),
                                                  const SizedBox(
                                                    width: 10,
                                                  ),
                                                  BigText(
                                                    text: 'Find Resturants',
                                                    color: Colors.white,
                                                  ),
                                                ],
                                              )),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: Dimensions.height20 * 3,
                                    ),
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
                                                MainSearch(
                                              isLoggedIn: widget.isLoggedin,
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
                                                          Category: 2,
                                                          isLoggedIn:
                                                              widget.isLoggedin,
                                                          Results: "")));
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
                                                          Category: 3,
                                                          isLoggedIn:
                                                              widget.isLoggedin,
                                                          Results: "")));
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
                                                          Category: 1,
                                                          isLoggedIn:
                                                              widget.isLoggedin,
                                                          Results: "")));
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
                                                          Category: 4,
                                                          isLoggedIn:
                                                              widget.isLoggedin,
                                                          Results: "")));
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

                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 20, bottom: 10, left: 10),
                              child: BigText(text: "Popular Products:"),
                            ),

                            StreamBuilder(
                                stream: ProductsOfAllBussinesses(),
                                builder: (context,
                                    AsyncSnapshot<QuerySnapshot> snapshot) {
                                  if (snapshot.hasData) {
                                    if (snapshot.data!.docs.isNotEmpty) {
                                      return ListView(
                                          padding: EdgeInsets.zero,
                                          physics:
                                              const NeverScrollableScrollPhysics(),
                                          shrinkWrap: true,
                                          scrollDirection: Axis.vertical,
                                          children:
                                              snapshot.data!.docs.map((e) {
                                            return GestureDetector(
                                              onTap: () {},
                                              child: ProductCard(
                                                  isLoggedin: widget.isLoggedin,
                                                  products: Product(
                                                      BussinessId:
                                                          e["BussinessId"],
                                                      Id: e["Id"],
                                                      image: e["image"],
                                                      description:
                                                          e["description"],
                                                      title: e["title"],
                                                      Category: e["Category"],
                                                      Price: e["Price"],
                                                      rating: e["rating"],
                                                      reviews: e["reviews"],
                                                      isRecommended:
                                                          e["isRecommended"])),
                                            );
                                          }).toList());
                                    } else {
                                      return Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Center(
                                          child: Lottie.asset(
                                            'assets/images/animation_lk7tz5gr.json', // Replace with the path to your Lottie animation file
                                            width: 200,
                                            height: 200,
                                            fit: BoxFit.contain,
                                          ),
                                        ),
                                      );
                                    }
                                  } else {
                                    return Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Center(
                                        child: Lottie.asset(
                                          'assets/images/animation_lk7tz5gr.json', // Replace with the path to your Lottie animation file
                                          width: 200,
                                          height: 200,
                                          fit: BoxFit.contain,
                                        ),
                                      ),
                                    );
                                    //
                                    // Padding(
                                    //   padding: const EdgeInsets.all(8.0),
                                    //   child: Center(
                                    //     //  padding: const EdgeInsets.all(8.0),
                                    //     child: NoData(
                                    //       ImageLink:
                                    //           "assets/images/noproductsyet.png",
                                    //       title: "Loading your products",
                                    //       subtitle:
                                    //           "Just a minute, either we are loading products data from database or we found nothing in database",
                                    //     ),
                                    //   ),
                                    // );
                                  }

                                  // Loading(
                                  //     message: "Fetching products data");
                                  // Container(
                                  //     padding: EdgeInsets.all(10),
                                  //     child: Column(
                                  //       crossAxisAlignment:
                                  //           CrossAxisAlignment.center,
                                  //       mainAxisAlignment:
                                  //           MainAxisAlignment.center,
                                  //       children: [
                                  //         Container(
                                  //           decoration: BoxDecoration(
                                  //             borderRadius:
                                  //                 BorderRadius.circular(50),
                                  //             border: Border.all(
                                  //                 width: 2.0,
                                  //                 color: Color.fromARGB(
                                  //                     255, 237, 237, 237)),
                                  //           ),
                                  //           alignment: Alignment.center,
                                  //           child: Icon(Icons.add),
                                  //         ),
                                  //         SizedBox(
                                  //           height: 5,
                                  //         ),
                                  //         SmallText(text: "Register")
                                  //       ],
                                  //     ),
                                  //   );
                                }),

                            // ListView.builder(
                            //     physics: const NeverScrollableScrollPhysics(),
                            //     shrinkWrap: true,
                            //     itemCount: 5,
                            //     itemBuilder: (context, index) {
                            //       return ProductCard(
                            //           products: Product(
                            //               isRecommended: true,
                            //               BussinessId: DummyBussinesses[index]
                            //                   .BussinessId,
                            //               Id: DummyProducts[index].Id,
                            //               image: DummyProducts[index].image,
                            //               description:
                            //                   DummyProducts[index].description,
                            //               title: DummyProducts[index].title,
                            //               Price: DummyProducts[index].Price,
                            //               rating: DummyProducts[index].rating,
                            //               reviews:
                            //                   DummyProducts[index].reviews));
                            //     }),

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
