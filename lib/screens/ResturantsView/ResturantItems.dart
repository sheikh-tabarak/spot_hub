// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:spot_hub/configurations/Dimensions.dart';
import 'package:spot_hub/widgets/ItemCard.dart';

class ResturantItems extends StatelessWidget {
  const ResturantItems({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: Dimensions.height10,
        ),
     //   BigText(text: 'This is Resturant Items', color: AppColors.PrimaryColor),
     
        ListView.builder(
            itemCount: 5,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return const ItemCard();
            })
        // ListTile(
        //   leading: Image.asset('assets/images/appicon.png'),
        //   title: Text('Chicken Malai'),
        //   subtitle:Text('Spicy Rice with mixed and soft Chicken'),
        //   trailing: Text('\$100'),
        // ),
      ],
    ));
  }
}
