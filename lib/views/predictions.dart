import 'package:app_new/components/barChart.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:app_new/components/customTitle.dart';
import 'package:app_new/series/barChartSeries.dart';
import 'package:app_new/tools/colors.dart';
import 'package:flutter/material.dart';

class ViewPredictions extends StatefulWidget {
  @override
  _ViewPredictionsState createState() => _ViewPredictionsState();
}

class _ViewPredictionsState extends State<ViewPredictions> {
  TextEditingController _textEditingController = TextEditingController();
  List<bool> _selections = [true, false];
  List<String> _graphsNames = [
    'MÁQUINA DE SOPORTE',
    'MAXIMUM ENTROPY',
    'ÁRBOL DE DECISIÓN',
    'NAIVE BAYES',
  ];
  int currentIndex = 0;
  int maxIndex = 3;
  String message = '';
  bool isActive = false;
  String description =
      'Suministra un texto expresando tu opinión referente al fenómeno migratorio venezolano para evaluar el rendimiento de los modelos de clasificación';

  final List<BarChartSeries> dataBS = [
    BarChartSeries(
        category: 'Tristeza',
        value: 70,
        color: charts.ColorUtil.fromDartColor(primaryColor)),
    BarChartSeries(
        category: 'Ira',
        value: 20,
        color: charts.ColorUtil.fromDartColor(primaryColor)),
    BarChartSeries(
        category: 'Felicidad',
        value: 10,
        color: charts.ColorUtil.fromDartColor(primaryColor)),
    BarChartSeries(
        category: 'Miedo',
        value: 0,
        color: charts.ColorUtil.fromDartColor(primaryColor)),
  ];

  final List<BarChartSeries> dataBO = [
    BarChartSeries(
        category: 'A Favor',
        value: 65,
        color: charts.ColorUtil.fromDartColor(primaryColor)),
    BarChartSeries(
        category: 'En Contra',
        value: 15,
        color: charts.ColorUtil.fromDartColor(primaryColor)),
    BarChartSeries(
        category: 'Neutral',
        value: 20,
        color: charts.ColorUtil.fromDartColor(primaryColor))
  ];

  final List<BarChartSeries> dataDS = [
    BarChartSeries(
        category: 'Tristeza',
        value: 0,
        color: charts.ColorUtil.fromDartColor(primaryColor)),
    BarChartSeries(
        category: 'Ira',
        value: 0,
        color: charts.ColorUtil.fromDartColor(primaryColor)),
    BarChartSeries(
        category: 'Felicidad',
        value: 0,
        color: charts.ColorUtil.fromDartColor(primaryColor)),
    BarChartSeries(
        category: 'Miedo',
        value: 0,
        color: charts.ColorUtil.fromDartColor(primaryColor)),
  ];

  final List<BarChartSeries> dataDO = [
    BarChartSeries(
        category: 'A Favor',
        value: 0,
        color: charts.ColorUtil.fromDartColor(primaryColor)),
    BarChartSeries(
        category: 'En Contra',
        value: 0,
        color: charts.ColorUtil.fromDartColor(primaryColor)),
    BarChartSeries(
        category: 'Neutral',
        value: 0,
        color: charts.ColorUtil.fromDartColor(primaryColor))
  ];

  @override
  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> _graphsSentiments = [
      BarChart(data: dataBS),
      BarChart(data: dataBS),
      BarChart(data: dataBS),
      BarChart(data: dataBS),
    ];
    List<Widget> _graphsOpinions = [
      BarChart(data: dataBO),
      BarChart(data: dataBO),
      BarChart(data: dataBO),
      BarChart(data: dataBO),
    ];
    List<Widget> _graphsDisableSentiments = [
      BarChart(data: dataDS),
      BarChart(data: dataDS),
      BarChart(data: dataDS),
      BarChart(data: dataDS),
    ];
    List<Widget> _graphsDisableOpinions = [
      BarChart(data: dataDO),
      BarChart(data: dataDO),
      BarChart(data: dataDO),
      BarChart(data: dataDO),
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
                CustomTitle(title: 'PREDICCIONES'),
                Text(description,
                    textAlign: TextAlign.center,
                    style: new TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 14.0,
                        fontFamily: 'Poppins')),
                SizedBox(
                  height: 15,
                ),
                Padding(
                    padding: EdgeInsets.all(10),
                    child: TextField(
                      maxLines: 3,
                      minLines: 3,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15))),
                      controller: _textEditingController,
                    )),
                SizedBox(
                  height: 5,
                ),
                TextButton(
                  child: Padding(
                      padding: EdgeInsets.all(5),
                      child: Text('Evaluar Mensaje',
                          textAlign: TextAlign.center,
                          style: new TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 13.0,
                              color: Colors.white,
                              fontFamily: 'Poppins'))),
                  style: TextButton.styleFrom(
                      backgroundColor: primaryColor,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10))),
                  onPressed: () {
                    FocusScope.of(context).unfocus();
                    setState(() {
                      message = _textEditingController.text;
                      if (message != '')
                        isActive = true;
                      else
                        isActive = false;
                    });
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                Text('RESULTADOS',
                    textAlign: TextAlign.center,
                    style: new TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 22.0,
                        fontFamily: 'Poppins')),
                SizedBox(
                  height: 10,
                ),
                ToggleButtons(
                    children: [
                      Padding(
                          padding: EdgeInsets.only(left: 20, right: 20),
                          child: Text('Sentimientos',
                              textAlign: TextAlign.center,
                              style: new TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14.0,
                                  fontFamily: 'Poppins'))),
                      Padding(
                        padding: EdgeInsets.only(left: 30, right: 30),
                        child: Text('Opiniones',
                            textAlign: TextAlign.center,
                            style: new TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 14.0,
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
                  SizedBox(width: 50),
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
                              fontSize: 16.0,
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
                  ),
                  SizedBox(width: 50),
                ]),
                isActive
                    ? _selections[0]
                        ? Expanded(child: _graphsSentiments[currentIndex])
                        : Expanded(child: _graphsOpinions[currentIndex])
                    : _selections[0]
                        ? Expanded(
                            child: _graphsDisableSentiments[currentIndex])
                        : Expanded(child: _graphsDisableOpinions[currentIndex]),
                TextButton(
                    child: Padding(
                        padding: EdgeInsets.all(4),
                        child: Text('Agregar Mensaje',
                            textAlign: TextAlign.center,
                            style: new TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 13.0,
                                color: Colors.white,
                                fontFamily: 'Poppins'))),
                    style: TextButton.styleFrom(
                        backgroundColor: isActive ? primaryColor : Colors.grey,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10))),
                    onPressed: isActive
                        ? () {
                            FocusScope.of(context).unfocus();
                          }
                        : null),
              ],
            )));
  }
}
