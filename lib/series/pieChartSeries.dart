import 'package:charts_flutter/flutter.dart' as charts;

class PieChartSeries {
  final String category;
  final double percentage;
  final charts.Color color;

  PieChartSeries(
      {required this.category, required this.percentage, required this.color});
}
