// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:spot_hub/configurations/AppColors.dart';

class DataBar extends StatelessWidget {
  final int currentValue;
  final int totalValue;

  DataBar({required this.currentValue, required this.totalValue});

  @override
  Widget build(BuildContext context) {
    double percentage = currentValue / totalValue;
    return Container(
      width: 200.0,
      height: 20.0,
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Stack(
        children: [
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.PrimaryColor,
                borderRadius: BorderRadius.circular(10.0),
              ),
              width: percentage * 200.0,
            ),
          ),
          Center(
            child: Text(
              '$currentValue / $totalValue',
              style: const TextStyle(color: Color.fromARGB(255, 232, 232, 232)),
            ),
          ),
        ],
      ),
    );
  }
}