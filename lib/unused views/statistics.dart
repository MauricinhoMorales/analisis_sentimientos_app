import 'package:app_new/components/customCard.dart';
import 'package:app_new/components/customSearchBar.dart';
import 'package:app_new/components/customTitle.dart';
import 'package:app_new/tools/colors.dart';
import 'package:app_new/views/statistics.dart';
import 'package:flutter/material.dart';

class ViewMenuStatistics extends StatefulWidget {
  @override
  _ViewMenuStatisticsState createState() => _ViewMenuStatisticsState();
}

class _ViewMenuStatisticsState extends State<ViewMenuStatistics> {
  // This holds a list of fiction users
  // You can use data fetched from a database or cloud as well
  final List<Map<String, dynamic>> _allValues = [
    {
      "id": "1",
      "title": "Analisis de Sentimiento",
      "subtitle": "Tomando en cuenta sentimientos positivos y negativos",
      "tags": ['edad']
    },
    {
      "id": "2",
      "title": "Analisis de Sentimiento",
      "subtitle": "Tomando en cuenta sentimientos positivos y negativos",
      "tags": ['sexo']
    },
    {
      "id": "3",
      "title": "Analisis de Sentimiento",
      "subtitle": "Tomando en cuenta sentimientos positivos y negativos",
      "tags": ['edad', 'sexo']
    },
    {
      "id": "4",
      "title": "Analisis de Comportamiento",
      "subtitle": "Referido a irse o quedarse en el país",
      "tags": ['edad']
    },
    {
      "id": "5",
      "title": "Analisis de Comportamiento",
      "subtitle": "Referido a irse o quedarse en el país",
      "tags": ['sexo']
    },
    {
      "id": "6",
      "title": "Analisis de Comportamiento",
      "subtitle": "Referido a irse o quedarse en el país",
      "tags": ['edad', 'sexo']
    },
    {
      "id": "7",
      "title": "Analisis de Resultados",
      "subtitle":
          "Basado en diferentes métricas de estudio para cada algoritmo utilizado",
      "tags": ['algoritmos']
    },
  ];

  // This list holds the data for the list view
  List<Map<String, dynamic>> _filteredValues = [];

  bool detailScreen = false;
  String id = '';

  @override
  initState() {
    // at the beginning, all users are shown
    _filteredValues = _allValues;
    detailScreen = false;
    id = '';
    super.initState();
  }

  // This function is called whenever the text field changes
  void _runFilter(String enteredKeyword) {
    List<Map<String, dynamic>> results = [];
    if (enteredKeyword.isEmpty) {
      // if the search field is empty or only contains white-space, we'll display all users
      results = _allValues;
    } else {
      results = _allValues
          .where((value) =>
              (value["title"]
                  .toLowerCase()
                  .contains(enteredKeyword.toLowerCase())) ||
              (value["subtitle"]
                  .toLowerCase()
                  .contains(enteredKeyword.toLowerCase())) ||
              (value["tags"].contains(enteredKeyword.toLowerCase())))
          .toList();
      // we use the toLowerCase() method to make it case-insensitive
    }

    // Refresh the UI
    setState(() {
      _filteredValues = results;
    });
  }

  void _changeScreen() {
    setState(() {
      this.id = '';
      this.detailScreen = !this.detailScreen;
    });
  }

  @override
  Widget build(BuildContext context) {
    return !this.detailScreen
        ? Container(
            color: whiteColor,
            child: Padding(
              padding: const EdgeInsets.all(30),
              child: Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  CustomTitle(title: 'Estadísticas'),
                  CustomSearchBar(runFilter: _runFilter),
                  Expanded(
                    child: _filteredValues.length > 0
                        ? ListView.builder(
                            itemCount: _filteredValues.length,
                            itemBuilder: (context, index) => Padding(
                                padding: EdgeInsets.only(bottom: 15),
                                child: CustomCard(
                                    title: _filteredValues[index]['title'],
                                    subtitle: _filteredValues[index]
                                        ['subtitle'],
                                    tags: _filteredValues[index]['tags'],
                                    navigation: _changeScreen)))
                        : Padding(
                            padding: EdgeInsets.only(top: 40),
                            child: Text(
                              'No hay resultados',
                              style: TextStyle(fontSize: 24),
                            )),
                  ),
                ],
              ),
            ))
        : ViewStatistics();
  }
}
