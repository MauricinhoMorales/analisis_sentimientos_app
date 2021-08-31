import 'package:flutter/material.dart';

class CustomToken extends StatelessWidget {
  const CustomToken({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(bottom: 10),
        child: Icon(
          Icons.account_circle,
          size: 120.0,
          color: Colors.black,
        ));
  }
}
