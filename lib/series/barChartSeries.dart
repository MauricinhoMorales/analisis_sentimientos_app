import 'package:charts_flutter/flutter.dart' as charts;

class BarChartSeries {
  final String category;
  final int value;
  final charts.Color color;

  BarChartSeries(
      {required this.category, required this.value, required this.color});
}
