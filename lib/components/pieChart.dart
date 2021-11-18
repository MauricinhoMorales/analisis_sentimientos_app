import 'package:app_new/series/pieChartSeries.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';

class PieChart extends StatelessWidget {
  final List<PieChartSeries> data;

  const PieChart({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<charts.Series<PieChartSeries, String>> series = [
      charts.Series(
          id: "PieChart",
          data: data,
          domainFn: (PieChartSeries series, _) => series.category,
          measureFn: (PieChartSeries series, _) => series.percentage,
          colorFn: (PieChartSeries series, _) => series.color,
          labelAccessorFn: (PieChartSeries series, _) =>
              '${series.percentage.toString()}%')
    ];

    return charts.PieChart(series,
        animate: true,
        defaultRenderer: new charts.ArcRendererConfig<String>(
            arcWidth: 130,
            arcRendererDecorators: [
              new charts.ArcLabelDecorator<String>(
                  insideLabelStyleSpec: new charts.TextStyleSpec(
                      color: charts.ColorUtil.fromDartColor(Colors.white),
                      fontSize: 18,
                      fontFamily: 'Poppins'),
                  outsideLabelStyleSpec: new charts.TextStyleSpec(
                      color: charts.ColorUtil.fromDartColor(Colors.black),
                      fontSize: 18))
            ]));
  }
}
