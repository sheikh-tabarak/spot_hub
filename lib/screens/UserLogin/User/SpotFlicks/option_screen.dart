import 'package:flutter/material.dart';
import 'package:spot_hub/configurations/SmallText.dart';
import 'package:spot_hub/models/DummyData.dart';
import 'package:spot_hub/screens/UserLogin/User/ScrollableProductDetailPage.dart';
import 'package:spot_hub/widgets/PopupModals/BussinessProfile.dart';

class OptionsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: const [
                  SizedBox(height: 110),
                ],
              ),
              Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //       builder: (context) =>
                      //           BussinessProfile(B: DummyBussinesses[0]),
                      //     ));
                    },
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(50),
                          image: DecorationImage(
                              image: NetworkImage(
                                  DummyBussinesses[1].BussinessImageUrl),
                              fit: BoxFit.cover)),
                    ),
                  ),
                  SizedBox(height: 30),
                  GestureDetector(
                    onTap: () {
                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //       builder: (context) =>
                      //       ScrollableProductDetailPage(

                      //         SelectedProduct: DummyProducts[0],
                      //       ),
                      //     ));
                    },
                    child: Column(
                      children: [
                        Icon(Icons.link, color: Colors.white, size: 26),
                        SizedBox(height: 5),
                        SmallText(
                          text: 'View',
                          color: Colors.white,
                          size: 16,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 30),
                  const Icon(Icons.add, color: Colors.white, size: 26),
                  SizedBox(height: 5),
                  SmallText(
                    text: 'Favorites',
                    color: Colors.white,
                    size: 16,
                  ),
                  const SizedBox(height: 30),
                  Transform(
                    transform: Matrix4.rotationZ(5.8),
                    child: Icon(Icons.send, color: Colors.white, size: 24),
                  ),
                  const SizedBox(height: 5),
                  SmallText(text: 'Share', color: Colors.white, size: 16),
                  const SizedBox(height: 40),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
