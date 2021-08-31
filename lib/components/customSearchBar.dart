import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class CustomSearchBar extends StatelessWidget {
  final Function runFilter;

  const CustomSearchBar({Key? key, required this.runFilter}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: (value) => runFilter(value),
      decoration: InputDecoration(
          border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(15))),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(15)),
              borderSide: BorderSide(color: Colors.grey)),
          hintText: 'Buscar',
          prefixIcon: Icon(
            Icons.search,
            color: Colors.grey,
          )),
    );
  }
}
