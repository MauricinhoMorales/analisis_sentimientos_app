import 'package:app_new/components/customTitle.dart';
import 'package:app_new/tools/colors.dart';
import 'package:flutter/material.dart';

class ViewDetailStatistic extends StatefulWidget {
  @override
  _ViewDetailStatisticState createState() => _ViewDetailStatisticState();
}

class _ViewDetailStatisticState extends State<ViewDetailStatistic> {
  // This holds a list of fiction users
  // You can use data fetched from a database or cloud as well
  final List<Map<String, dynamic>> _allValues = [
    {
      "id": 1,
      "title": "Predicción de Sentimiento",
      "subtitle": "Tomando en cuenta sentimientos positivos y negativos",
      "tags": ['prediccion']
    },
    {
      "id": 2,
      "title": "Prediccion de Comportamiento",
      "subtitle": "Referido a irse o quedarse en el país",
      "tags": ['prediccion']
    },
  ];

  // This list holds the data for the list view
  List<Map<String, dynamic>> _filteredValues = [];
  @override
  initState() {
    // at the beginning, all users are shown
    _filteredValues = _allValues;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: whiteColor,
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              CustomTitle(title: 'Detalles'),
            ],
          ),
        ));
  }
}
