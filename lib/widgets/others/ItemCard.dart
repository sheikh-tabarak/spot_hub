// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:spot_hub/configurations/BigText.dart';

class ItemCard extends StatelessWidget {
  const ItemCard({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => {
        showModalBottomSheet(
            context: context,
            builder: (BuildContext bc) {
              return Container(
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15))),
                child: Column(
                  children: const [
                    ListTile(
                      leading: Icon(Icons.edit),
                      title: Text('Edit'),
                    ),
                    ListTile(
                      leading: Icon(Icons.delete),
                      title: Text('Delete'),
                    )
                  ],
                ),
              );
            })
      },
      child: Container(
        // margin: const EdgeInsets.all(10),
        //  padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,

          // boxShadow: [
          //   BoxShadow(
          //     color: Colors.grey.withOpacity(0.5),
          //     spreadRadius: 3,
          //     blurRadius: 4,
          //     offset: const Offset(0, 0), // changes position of shadow
          //   ),
          // ]

          // boxShadow: BoxShadow(Colors.black,Offset.zero,0,0,BlurStyle.normal),
        ),
        child: ListTile(
          // onLongPress: () => {
          //   Navigator.push(context,
          //       MaterialPageRoute(builder: (context) => const ResturantAccount()))
          // },
          leading: CircleAvatar(
            backgroundImage: AssetImage('assets/images/fastfood.png'),
            radius: 20,
          ),
          title: const Text('Chicken Malai'),
          subtitle: const Text('Spicy Rice with mixed and soft Chicken'),
          trailing: BigText(
            text: '\$100',
            color: Colors.red,
          ),
        ),
      ),
    );
  }
}
