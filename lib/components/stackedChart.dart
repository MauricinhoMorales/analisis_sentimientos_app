import 'package:app_new/series/stackedChartSeries.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';

class StackedChart extends StatelessWidget {
  static final List<Color> _colors = [
    Colors.blue,
    Colors.red,
    Colors.yellow[700]!,
    Colors.green
  ];
  final List<List<StackedChartSeries>> data;

  const StackedChart({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<charts.Series<StackedChartSeries, String>> series = data
        .map((element) => charts.Series(
            id: "BarChart",
            data: element,
            domainFn: (StackedChartSeries series, _) => series.category,
            measureFn: (StackedChartSeries series, _) => series.value,
            colorFn: (_, __) =>
                charts.ColorUtil.fromDartColor(_colors[data.indexOf(element)])))
        .toList();

    return charts.BarChart(
      series,
      animate: true,
      vertical: false,
      barGroupingType: charts.BarGroupingType.stacked,
      domainAxis: new charts.OrdinalAxisSpec(showAxisLine: false),
    );
  }
}
