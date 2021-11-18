import 'package:charts_flutter/flutter.dart' as charts;
import 'package:app_new/series/barChartSeries.dart';
import 'package:flutter/material.dart';

class BarChart extends StatelessWidget {
  final List<BarChartSeries> data;

  const BarChart({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<charts.Series<BarChartSeries, String>> series = [
      charts.Series(
          id: "BarChart",
          data: data,
          domainFn: (BarChartSeries series, _) => series.category,
          measureFn: (BarChartSeries series, _) => series.value,
          colorFn: (BarChartSeries series, _) => series.color)
    ];

    return charts.BarChart(
      series,
      animate: true,
      vertical: false,
      domainAxis: new charts.OrdinalAxisSpec(showAxisLine: false),
    );
  }
}
