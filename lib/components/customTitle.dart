import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class CustomTitle extends StatelessWidget {
  final String title;

  const CustomTitle({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(bottom: 10),
        child: Text(
          title,
          textAlign: TextAlign.center,
          style: new TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 46.0,
              fontFamily: 'OleoScript'),
        ));
  }
}
