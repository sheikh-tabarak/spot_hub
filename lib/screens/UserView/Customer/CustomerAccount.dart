import 'package:flutter/material.dart';
import 'package:spot_hub/models/UserModels/User.dart';

class CustomerAccount extends StatelessWidget {

  final User MainUser;
  const CustomerAccount({super.key, required this.MainUser});

  @override
  Widget build(BuildContext context) {
    return  Center(
      child: Text("Logged in as ${MainUser.username}"));
  }
}