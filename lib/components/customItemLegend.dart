import 'package:flutter/material.dart';

class CustomItemLegend extends StatelessWidget {
  final Color color;
  final String name;

  const CustomItemLegend({Key? key, required this.color, required this.name})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          backgroundColor: color,
          radius: 12,
        ),
        SizedBox(height: 2),
        Text(
          name,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 16, fontFamily: 'Poppins'),
        )
      ],
    );
  }
}
