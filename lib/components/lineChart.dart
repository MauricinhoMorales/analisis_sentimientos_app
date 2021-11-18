import 'package:app_new/series/lineChartSeries.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';

class LineChart extends StatelessWidget {
  static final List<Color> _colors = [
    Colors.blue,
    Colors.red,
    Colors.yellow[700]!,
    Colors.green
  ];
  final List<List<LineChartSeries>> data;

  const LineChart({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<charts.Series<LineChartSeries, DateTime>> series = data
        .map((element) => charts.Series(
            id: "BarChart",
            data: element,
            domainFn: (LineChartSeries series, _) => series.date,
            measureFn: (LineChartSeries series, _) => series.percentage,
            colorFn: (_, __) =>
                charts.ColorUtil.fromDartColor(_colors[data.indexOf(element)])))
        .toList();

    return charts.TimeSeriesChart(
      series,
      animate: true,
    );
  }
}
