import 'package:app_new/components/customItemLegend.dart';
import 'package:flutter/material.dart';

class CustomLegend extends StatelessWidget {
  static final List<Item> _sentiments = [
    Item(category: 'Tristeza', color: Colors.blue),
    Item(category: 'Ira', color: Colors.red),
    Item(category: 'Felicidad', color: Colors.yellow[700]!),
    Item(category: 'Miedo', color: Colors.green),
  ];

  static final List<Item> _opinions = [
    Item(category: 'A Favor', color: Colors.blue),
    Item(category: 'En Contra', color: Colors.red),
    Item(category: 'Neutral', color: Colors.yellow[700]!),
  ];

  final bool type;

  const CustomLegend({Key? key, required this.type}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
        children: type
            ? _sentiments
                .map((value) => Expanded(
                    child: CustomItemLegend(
                        name: value.category, color: value.color)))
                .toList()
            : _opinions
                .map((value) => Expanded(
                    child: CustomItemLegend(
                        name: value.category, color: value.color)))
                .toList());
  }
}

class Item {
  final String category;
  final Color color;

  Item({required this.color, required this.category});
}
