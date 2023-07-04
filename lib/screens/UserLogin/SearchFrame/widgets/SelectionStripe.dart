import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:spot_hub/configurations/AppColors.dart';

class SelectionStripe extends StatefulWidget {
  final List<String> items;

  bool isSelected = false;
  int selectedItem;
  final Function getValue;

  SelectionStripe(
      {super.key,
      required this.items,
      required this.getValue,
      this.selectedItem = 0});

  @override
  State<SelectionStripe> createState() => _SelectionStripeState();
}

class _SelectionStripeState extends State<SelectionStripe> {
  List<String> itemsa = ["Any", "★ 3.0+", "★ 4.0+", "★ 5.0+"];

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      children: <Widget>[
        // IconBox(mainIcon: Icons.price_change, Text: "\$100"),

        //   Text('You have ${items.length} Items'),
        ...widget.items.map((item) {
          return GestureDetector(
            onTap: () {
              widget.selectedItem = widget.items.indexOf(item);
              widget.getValue(widget.selectedItem);

              setState(() {
                //()=widget.items.indexOf(item);
                print(widget.selectedItem);
                widget.isSelected = true;
              });
            },
            child: Container(
              margin: EdgeInsets.only(top: 10, bottom: 10),

              decoration: BoxDecoration(
                  borderRadius: item == widget.items.last
                      ? BorderRadius.only(
                          topRight: Radius.circular(5),
                          bottomRight: Radius.circular(5))
                      : item == widget.items.first
                          ? BorderRadius.only(
                              topLeft: Radius.circular(5),
                              bottomLeft: Radius.circular(5))
                          : BorderRadius.zero,
                  color: widget.items.indexOf(item) == widget.selectedItem
                      ? AppColors.PrimaryColor
                      : Colors.white,
                  border: Border.all(width: 1, color: AppColors.PrimaryColor)),
              // padding: EdgeInsets.all(5),
              width: 100,
              height: 40,
              child: Center(
                  child: Text(
                "$item",
                style: TextStyle(
                    fontSize: 18,
                    color: widget.items.indexOf(item) == widget.selectedItem
                        ? Colors.white
                        : AppColors.PrimaryColor),
              )),
            ),
          );
          //Text(items);
        }).toList(),
      ],
    );
  }
}
