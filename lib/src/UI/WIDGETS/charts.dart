// import 'package:flutter/material.dart';
// import 'package:charts_flutter/flutter.dart' as charts;

// class GroupedBarChart extends StatefulWidget {
//   final List<charts.Series<OrdinalSales, String>> seriesList;
//   final bool animate;

//   GroupedBarChart(this.seriesList, {this.animate = true});

//   factory GroupedBarChart.withSampleData() {
//     return new GroupedBarChart(
//       _createSampleData(),
//       // Disable animations for image tests.
//       animate: false,
//     );
//   }

//   @override
//   _GroupedBarChartState createState() => _GroupedBarChartState();
// }

// class _GroupedBarChartState extends State<GroupedBarChart> {
//   @override
//   Widget build(BuildContext context) {
//     return new Scaffold(
//       body: charts.BarChart(
//         widget.seriesList,
//         animate: widget.animate,
//         barGroupingType: charts.BarGroupingType.grouped,
//       ),
//     );
//   }
// }
