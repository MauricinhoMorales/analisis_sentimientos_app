import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class CustomChip extends StatelessWidget {
  final String tag;

  const CustomChip({Key? key, required this.tag}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;

    return Padding(
        padding: EdgeInsets.only(right: 5),
        child: Chip(
            label: Container(
                width: media.width / 6,
                height: 20,
                child: Center(
                    child: Text(
                  tag,
                  style: TextStyle(fontWeight: FontWeight.w300, fontSize: 14.0),
                )))));
  }
}
