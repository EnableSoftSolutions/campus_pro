import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

/// Sample ordinal data type.
class OrdinalSales {
  final String year;
  final int sales;

  OrdinalSales(this.year, this.sales);
}

/// Create series list with multiple series
List<charts.Series<OrdinalSales, String>> _createSampleData() {
  final desktopSalesData = [
    new OrdinalSales('2014', 5),
    new OrdinalSales('2015', 25),
    new OrdinalSales('2016', 100),
    new OrdinalSales('2017', 75),
  ];

  final tableSalesData = [
    new OrdinalSales('2014', 25),
    new OrdinalSales('2015', 50),
    new OrdinalSales('2016', 10),
    new OrdinalSales('2017', 20),
  ];

  final mobileSalesData = [
    new OrdinalSales('2014', 10),
    new OrdinalSales('2015', 15),
    new OrdinalSales('2016', 50),
    new OrdinalSales('2017', 45),
  ];

  return [
    new charts.Series<OrdinalSales, String>(
      id: 'Desktop',
      domainFn: (OrdinalSales sales, _) => sales.year,
      measureFn: (OrdinalSales sales, _) => sales.sales,
      data: desktopSalesData,
    ),
    new charts.Series<OrdinalSales, String>(
      id: 'Tablet',
      domainFn: (OrdinalSales sales, _) => sales.year,
      measureFn: (OrdinalSales sales, _) => sales.sales,
      data: tableSalesData,
    ),
    new charts.Series<OrdinalSales, String>(
      id: 'Mobile',
      domainFn: (OrdinalSales sales, _) => sales.year,
      measureFn: (OrdinalSales sales, _) => sales.sales,
      data: mobileSalesData,
    ),
  ];
}

// class AttendanceChartModel {
//   final String? month;
//   final int? value;
//   final charts.Color? barColor;

//   AttendanceChartModel({
//     @required this.month,
//     @required this.value,
//     @required this.barColor,
//   });
// }

// final List<AttendanceChartModel>? userData = [
//   AttendanceChartModel(
//     month: "Jan",
//     absent: 5,
//     present: 25,
//     absentBarColor: charts.ColorUtil.fromDartColor(Colors.red),
//     presentBarColor: charts.ColorUtil.fromDartColor(Colors.green),
//   ),
//   AttendanceChartModel(
//     month: "Feb",
//     absent: 8,
//     present: 22,
//     absentBarColor: charts.ColorUtil.fromDartColor(Colors.red),
//     presentBarColor: charts.ColorUtil.fromDartColor(Colors.green),
//   ),
//   AttendanceChartModel(
//     month: "Mar",
//     absent: 2,
//     present: 28,
//     absentBarColor: charts.ColorUtil.fromDartColor(Colors.red),
//     presentBarColor: charts.ColorUtil.fromDartColor(Colors.green),
//   ),
//   AttendanceChartModel(
//     month: "Apr",
//     absent: 9,
//     present: 21,
//     absentBarColor: charts.ColorUtil.fromDartColor(Colors.red),
//     presentBarColor: charts.ColorUtil.fromDartColor(Colors.green),
//   ),
//   AttendanceChartModel(
//     month: "May",
//     absent: 15,
//     present: 15,
//     absentBarColor: charts.ColorUtil.fromDartColor(Colors.red),
//     presentBarColor: charts.ColorUtil.fromDartColor(Colors.green),
//   ),
//   AttendanceChartModel(
//     month: "Jun",
//     absent: 11,
//     present: 19,
//     absentBarColor: charts.ColorUtil.fromDartColor(Colors.red),
//     presentBarColor: charts.ColorUtil.fromDartColor(Colors.green),
//   ),
//   // AttendanceChartModel(
//   //   month: "Jul",
//   //   absent: 1,
//   //   present: 29,
//   //   absentBarColor: charts.ColorUtil.fromDartColor(Colors.red),
//   //   presentBarColor: charts.ColorUtil.fromDartColor(Colors.green),
//   // ),
//   // AttendanceChartModel(
//   //   month: "Aug",
//   //   absent: 25,
//   //   present: 5,
//   //   absentBarColor: charts.ColorUtil.fromDartColor(Colors.red),
//   //   presentBarColor: charts.ColorUtil.fromDartColor(Colors.green),
//   // ),
//   // AttendanceChartModel(
//   //   month: "Sep",
//   //   absent: 13,
//   //   present: 17,
//   //   absentBarColor: charts.ColorUtil.fromDartColor(Colors.red),
//   //   presentBarColor: charts.ColorUtil.fromDartColor(Colors.green),
//   // ),
//   // AttendanceChartModel(
//   //   month: "Oct",
//   //   absent: 4,
//   //   present: 26,
//   //   absentBarColor: charts.ColorUtil.fromDartColor(Colors.red),
//   //   presentBarColor: charts.ColorUtil.fromDartColor(Colors.green),
//   // ),
//   // AttendanceChartModel(
//   //   month: "Nov",
//   //   absent: 2,
//   //   present: 28,
//   //   absentBarColor: charts.ColorUtil.fromDartColor(Colors.red),
//   //   presentBarColor: charts.ColorUtil.fromDartColor(Colors.green),
//   // ),
//   // AttendanceChartModel(
//   //   month: "Dec",
//   //   absent: 6,
//   //   present: 24,
//   //   absentBarColor: charts.ColorUtil.fromDartColor(Colors.red),
//   //   presentBarColor: charts.ColorUtil.fromDartColor(Colors.green),
//   // ),
// ];
