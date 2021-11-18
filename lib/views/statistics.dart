import 'package:app_new/components/customLegend.dart';
import 'package:app_new/components/lineChart.dart';
import 'package:app_new/components/pieChart.dart';
import 'package:app_new/components/stackedChart.dart';
import 'package:app_new/series/lineChartSeries.dart';
import 'package:app_new/series/pieChartSeries.dart';
import 'package:app_new/series/stackedChartSeries.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:app_new/components/customTitle.dart';
import 'package:app_new/series/barChartSeries.dart';
import 'package:app_new/tools/colors.dart';
import 'package:flutter/material.dart';

class ViewStatistics extends StatefulWidget {
  @override
  _ViewStatisticsState createState() => _ViewStatisticsState();
}

class _ViewStatisticsState extends State<ViewStatistics> {
  List<bool> _selections = [true, false];
  List<String> _graphsNames = [
    'DISTRIBUCIÓN GENERAL',
    'DISTRIBUCIÓN EN EL TIEMPO',
    'MONOGRAMAS FRECUENTES',
    'N-GRAMAS FRECUENTES'
  ];
  List<String> _graphsDescriptionsSentiments = [
    'Distribución de la escala de sentimientos en general',
    'Distribución de la escala de sentimientos en el tiempo',
    'Distribución de la escala de sentimientos para los Monogramas que más apariciones tuvieron',
    'Distribución de la escala de sentimientos para los N-gramas que más apariciones tuvieron',
  ];
  List<String> _graphsDescriptionsOpinions = [
    'Distribución de la escala de opiniones en general',
    'Distribución de la escala de opiniones en el tiempo',
    'Distribución de la escala de opiniones para los Monogramas que más apariciones tuvieron',
    'Distribución de la escala de opiniones para los N-gramas que más apariciones tuvieron',
  ];
  int currentIndex = 0;
  int maxIndex = 3;

  final List<BarChartSeries> dataB1 = [
    BarChartSeries(
        category: '1',
        value: 20,
        color: charts.ColorUtil.fromDartColor(primaryColor)),
    BarChartSeries(
        category: '2',
        value: 20,
        color: charts.ColorUtil.fromDartColor(primaryColor)),
    BarChartSeries(
        category: '3',
        value: 20,
        color: charts.ColorUtil.fromDartColor(primaryColor)),
    BarChartSeries(
        category: '4',
        value: 20,
        color: charts.ColorUtil.fromDartColor(primaryColor)),
    BarChartSeries(
        category: '5',
        value: 20,
        color: charts.ColorUtil.fromDartColor(primaryColor)),
    BarChartSeries(
        category: '6',
        value: 20,
        color: charts.ColorUtil.fromDartColor(primaryColor)),
    BarChartSeries(
        category: '7',
        value: 20,
        color: charts.ColorUtil.fromDartColor(primaryColor)),
    BarChartSeries(
        category: '8',
        value: 20,
        color: charts.ColorUtil.fromDartColor(primaryColor)),
    BarChartSeries(
        category: '9',
        value: 20,
        color: charts.ColorUtil.fromDartColor(primaryColor)),
    BarChartSeries(
        category: '10',
        value: 20,
        color: charts.ColorUtil.fromDartColor(primaryColor))
  ];

  final List<StackedChartSeries> dataS1 = [
    StackedChartSeries(category: '1', value: 20),
    StackedChartSeries(category: '2', value: 20),
    StackedChartSeries(category: '3', value: 20),
    StackedChartSeries(category: '4', value: 20),
    StackedChartSeries(category: '5', value: 20),
    StackedChartSeries(category: '6', value: 20),
    StackedChartSeries(category: '7', value: 20),
    StackedChartSeries(category: '8', value: 20),
    StackedChartSeries(category: '9', value: 20),
    StackedChartSeries(category: '10', value: 20),
  ];

  final List<StackedChartSeries> dataS2 = [
    StackedChartSeries(category: '1', value: 20),
    StackedChartSeries(category: '2', value: 20),
    StackedChartSeries(category: '3', value: 20),
    StackedChartSeries(category: '4', value: 20),
    StackedChartSeries(category: '5', value: 20),
    StackedChartSeries(category: '6', value: 20),
    StackedChartSeries(category: '7', value: 20),
    StackedChartSeries(category: '8', value: 20),
    StackedChartSeries(category: '9', value: 20),
    StackedChartSeries(category: '10', value: 20),
  ];

  final List<StackedChartSeries> dataS3 = [
    StackedChartSeries(category: '1', value: 20),
    StackedChartSeries(category: '2', value: 20),
    StackedChartSeries(category: '3', value: 20),
    StackedChartSeries(category: '4', value: 20),
    StackedChartSeries(category: '5', value: 20),
    StackedChartSeries(category: '6', value: 20),
    StackedChartSeries(category: '7', value: 20),
    StackedChartSeries(category: '8', value: 20),
    StackedChartSeries(category: '9', value: 20),
    StackedChartSeries(category: '10', value: 20),
  ];

  final List<StackedChartSeries> dataS4 = [
    StackedChartSeries(category: '1', value: 35),
    StackedChartSeries(category: '2', value: 30),
    StackedChartSeries(category: '3', value: 25),
    StackedChartSeries(category: '4', value: 20),
    StackedChartSeries(category: '5', value: 15),
    StackedChartSeries(category: '6', value: 10),
    StackedChartSeries(category: '7', value: 5),
    StackedChartSeries(category: '8', value: 2),
    StackedChartSeries(category: '9', value: 1),
    StackedChartSeries(category: '10', value: 0),
  ];

  final List<LineChartSeries> dataL1 = [
    LineChartSeries(date: DateTime(2021, 1), percentage: 20),
    LineChartSeries(date: DateTime(2021, 2), percentage: 25),
    LineChartSeries(date: DateTime(2021, 3), percentage: 30),
    LineChartSeries(date: DateTime(2021, 4), percentage: 25),
    LineChartSeries(date: DateTime(2021, 5), percentage: 20),
    LineChartSeries(date: DateTime(2021, 6), percentage: 15),
    LineChartSeries(date: DateTime(2021, 7), percentage: 10),
    LineChartSeries(date: DateTime(2021, 8), percentage: 5),
    LineChartSeries(date: DateTime(2021, 9), percentage: 10),
    LineChartSeries(date: DateTime(2021, 10), percentage: 15),
  ];

  final List<LineChartSeries> dataL2 = [
    LineChartSeries(date: DateTime(2021, 1), percentage: 40),
    LineChartSeries(date: DateTime(2021, 2), percentage: 45),
    LineChartSeries(date: DateTime(2021, 3), percentage: 50),
    LineChartSeries(date: DateTime(2021, 4), percentage: 35),
    LineChartSeries(date: DateTime(2021, 5), percentage: 40),
    LineChartSeries(date: DateTime(2021, 6), percentage: 25),
    LineChartSeries(date: DateTime(2021, 7), percentage: 50),
    LineChartSeries(date: DateTime(2021, 8), percentage: 45),
    LineChartSeries(date: DateTime(2021, 9), percentage: 30),
    LineChartSeries(date: DateTime(2021, 10), percentage: 35),
  ];

  final List<LineChartSeries> dataL3 = [
    LineChartSeries(date: DateTime(2021, 1), percentage: 25),
    LineChartSeries(date: DateTime(2021, 2), percentage: 25),
    LineChartSeries(date: DateTime(2021, 3), percentage: 25),
    LineChartSeries(date: DateTime(2021, 4), percentage: 25),
    LineChartSeries(date: DateTime(2021, 5), percentage: 25),
    LineChartSeries(date: DateTime(2021, 6), percentage: 25),
    LineChartSeries(date: DateTime(2021, 7), percentage: 25),
    LineChartSeries(date: DateTime(2021, 8), percentage: 25),
    LineChartSeries(date: DateTime(2021, 9), percentage: 25),
    LineChartSeries(date: DateTime(2021, 10), percentage: 25),
  ];

  final List<LineChartSeries> dataL4 = [
    LineChartSeries(date: DateTime(2021, 1), percentage: 25),
    LineChartSeries(date: DateTime(2021, 2), percentage: 20),
    LineChartSeries(date: DateTime(2021, 3), percentage: 25),
    LineChartSeries(date: DateTime(2021, 4), percentage: 20),
    LineChartSeries(date: DateTime(2021, 5), percentage: 25),
    LineChartSeries(date: DateTime(2021, 6), percentage: 20),
    LineChartSeries(date: DateTime(2021, 7), percentage: 25),
    LineChartSeries(date: DateTime(2021, 8), percentage: 20),
    LineChartSeries(date: DateTime(2021, 9), percentage: 25),
    LineChartSeries(date: DateTime(2021, 10), percentage: 80),
  ];

  final List<PieChartSeries> dataPS = [
    PieChartSeries(
        category: '1',
        percentage: 35,
        color: charts.ColorUtil.fromDartColor(Colors.blue)),
    PieChartSeries(
        category: '2',
        percentage: 25,
        color: charts.ColorUtil.fromDartColor(Colors.red)),
    PieChartSeries(
        category: '3',
        percentage: 25,
        color: charts.ColorUtil.fromDartColor(Colors.yellow[700]!)),
    PieChartSeries(
        category: '4',
        percentage: 15,
        color: charts.ColorUtil.fromDartColor(Colors.green)),
  ];

  final List<PieChartSeries> dataPO = [
    PieChartSeries(
        category: '1',
        percentage: 65,
        color: charts.ColorUtil.fromDartColor(Colors.blue)),
    PieChartSeries(
        category: '2',
        percentage: 25,
        color: charts.ColorUtil.fromDartColor(Colors.red)),
    PieChartSeries(
        category: '3',
        percentage: 10,
        color: charts.ColorUtil.fromDartColor(Colors.yellow[700]!)),
  ];

  @override
  Widget build(BuildContext context) {
    List<List<StackedChartSeries>> dataSO = [dataS1, dataS2, dataS3];
    List<List<LineChartSeries>> dataLO = [dataL1, dataL2, dataL3];
    List<List<StackedChartSeries>> dataSS = [dataS1, dataS2, dataS3, dataS4];
    List<List<LineChartSeries>> dataLS = [dataL1, dataL2, dataL3, dataL4];
    List<Widget> _graphsSentiments = [
      PieChart(data: dataPS),
      LineChart(data: dataLS),
      StackedChart(data: dataSS),
      StackedChart(data: dataSS),
    ];
    List<Widget> _graphsOpinions = [
      PieChart(data: dataPO),
      LineChart(data: dataLO),
      StackedChart(data: dataSO),
      StackedChart(data: dataSO),
    ];

    return Container(
        color: whiteColor,
        child: Padding(
            padding: const EdgeInsets.all(30),
            child: Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                CustomTitle(title: 'ESTADÍSTICAS'),
                SizedBox(
                  height: 5,
                ),
                ToggleButtons(
                    children: [
                      Padding(
                          padding: EdgeInsets.only(left: 20, right: 20),
                          child: Text('Sentimientos',
                              textAlign: TextAlign.center,
                              style: new TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16.0,
                                  fontFamily: 'Poppins'))),
                      Padding(
                        padding: EdgeInsets.only(left: 30, right: 30),
                        child: Text('Opiniones',
                            textAlign: TextAlign.center,
                            style: new TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 16.0,
                                fontFamily: 'Poppins')),
                      ),
                    ],
                    isSelected: _selections,
                    color: Colors.grey,
                    selectedColor: whiteColor,
                    fillColor: primaryColor,
                    borderRadius: BorderRadius.circular(10),
                    onPressed: (int index) {
                      setState(() {
                        _selections = List.generate(2, (_) => false);
                        _selections[index] = true;
                      });
                    }),
                SizedBox(
                  height: 15,
                ),
                Row(children: [
                  IconButton(
                    onPressed: () {
                      setState(() {
                        if (currentIndex == 0)
                          currentIndex = maxIndex;
                        else
                          currentIndex -= 1;
                      });
                    },
                    icon: Icon(Icons.arrow_back_ios),
                    color: primaryColor,
                  ),
                  Expanded(
                      child: Text(_graphsNames[currentIndex],
                          textAlign: TextAlign.center,
                          style: new TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 20.0,
                              fontFamily: 'Poppins'))),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        if (currentIndex == maxIndex)
                          currentIndex = 0;
                        else
                          currentIndex += 1;
                      });
                    },
                    icon: Icon(Icons.arrow_forward_ios),
                    color: primaryColor,
                  )
                ]),
                _selections[0]
                    ? Text(_graphsDescriptionsSentiments[currentIndex],
                        textAlign: TextAlign.center,
                        style: new TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 15.0,
                            fontFamily: 'Poppins'))
                    : Text(_graphsDescriptionsOpinions[currentIndex],
                        textAlign: TextAlign.center,
                        style: new TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 15.0,
                            fontFamily: 'Poppins')),
                SizedBox(height: 5),
                _selections[0]
                    ? Expanded(child: _graphsSentiments[currentIndex])
                    : Expanded(child: _graphsOpinions[currentIndex]),
                SizedBox(height: 15),
                CustomLegend(type: _selections[0])
              ],
            )));
  }
}
