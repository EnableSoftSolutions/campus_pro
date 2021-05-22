import 'package:campus_pro/src/CONSTANTS/style.dart';
import 'package:campus_pro/src/CONSTANTS/themeData.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'package:charts_flutter/flutter.dart' as charts;

class TestResult extends StatefulWidget {
  static const routeName = "/test-result";
  @override
  _TestREsultState createState() => _TestREsultState();
}

class _TestREsultState extends State<TestResult> {
  List<String> classList = <String>[
    'Half Year',
    'Final Year',
  ];
  String? selectedClass;

  List<String> dropdownValueSessionList = <String>[
    '2018-2019',
    '2019-2020',
    '2020-2021',
    '2021-2022',
    '2022-2023',
    '2023-2024'
  ];
  String? dropdownSessionValue;

  String? selectedValue;

  void graphShow(String getValue) {
    setState(() {
      selectedValue = getValue;
      print(">>>>>>>>>>>>>>>>>>>$selectedValue");
    });
  }

  List<charts.Series<ResultModel, String>>? seriesList; //charts

  static List<charts.Series<ResultModel, String>> _createRandomData() {
     final obtainedMarks = [
      ResultModel('Computer', 50),
      ResultModel('Hindi', 40),
      ResultModel('English', 55),
      ResultModel('Math', 35),
      ResultModel('G.K', 74),
      ResultModel('Art & Craft', 80),

    ];

    final maxMarks = [
      ResultModel('Computer', 100),
      ResultModel('Hindi', 100),
      ResultModel('English', 100),
      ResultModel('Math', 100),
      ResultModel('G.K', 100),
      ResultModel('Art & Craft', 100),
    
    ];
   

    return [

       charts.Series<ResultModel, String>(
          id: 'SunjectName',
          domainFn: (ResultModel rModel, _) => rModel.subjectName,
          measureFn: (ResultModel rModel, _) => rModel.marks,
          data: obtainedMarks,
          fillColorFn: (ResultModel rModel, _) {
            return (rModel.marks == 35)
                ? charts.MaterialPalette.red.shadeDefault
                : charts.MaterialPalette.yellow.shadeDefault;
          }),

        charts.Series<ResultModel, String>(
          id: 'SunjectName',
          domainFn: (ResultModel rModel, _) => rModel.subjectName,
          measureFn: (ResultModel rModel, _) => rModel.marks,
          data: maxMarks,
          fillColorFn: (ResultModel rModel, _) {
            return charts.MaterialPalette.green.shadeDefault;
          }),

     
    ];
  }

  Container buildGraph(BuildContext context)  {
    return Container(
      color: Colors.white,
      child:charts.BarChart(
      seriesList,
      animate: true,
      vertical: true,
      domainAxis: new charts.OrdinalAxisSpec(
          renderSpec: new charts.SmallTickRendererSpec(
              // Tick and Label styling here.
              labelStyle: new charts.TextStyleSpec(
                  fontSize: 10, // size in Pts.
                  color: charts.MaterialPalette.black,
                  ),

              // Change the line colors to match text color.
              // lineStyle: new charts.LineStyleSpec(
              //     color: charts.MaterialPalette.black),

                  ),
                  ),

  primaryMeasureAxis: new charts.NumericAxisSpec(
          renderSpec: new charts.GridlineRendererSpec(

              // Tick and Label styling here.
              labelStyle: new charts.TextStyleSpec(
                  fontSize: 10, // size in Pts.
                  color: charts.MaterialPalette.black),

              // Change the line colors to match text color.
              lineStyle: new charts.LineStyleSpec(
                  color: charts.MaterialPalette.black
                  ),
                  )
                  ),
   



      barGroupingType: charts.BarGroupingType.grouped,
      defaultRenderer: charts.BarRendererConfig(
        groupingType: charts.BarGroupingType.grouped,
        strokeWidthPx: 1.0,
      ),
      // domainAxis: charts.OrdinalAxisSpec(
      //   renderSpec: charts.NoneRenderSpec(),
    ),
    );
  }  
  // barChart() {
  //   return charts.BarChart(
  //     seriesList,
  //     animate: true,
  //     vertical: true,
  //     barGroupingType: charts.BarGroupingType.grouped,
  //     defaultRenderer: charts.BarRendererConfig(
  //       groupingType: charts.BarGroupingType.grouped,
  //       strokeWidthPx: 1.0,
  //     ),
  //     // domainAxis: charts.OrdinalAxisSpec(
  //     //   renderSpec: charts.NoneRenderSpec(),
  //   );
  // }

  @override
  void initState() {
    super.initState();
    seriesList = _createRandomData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Graph"),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: buildGraph(context),
      ),
    );
  }

  // Container buildGraphWidget(BuildContext context) {
  //   return Container(
  //     child: barChart(),
  //   );
  // }
}

// @override
// Widget build(BuildContext context) {
//   return Container(
//     decoration: BoxDecoration(
//       gradient: customGradient,
//     ),
//     child: Scaffold(
//       backgroundColor: blueColor,
//       appBar: PreferredSize(
//         preferredSize: Size.fromHeight(100.0),
//         child: AppBar(
//           backgroundColor: blueColor,
//           elevation: 0.0,
//           centerTitle: true,
//           title: Text(
//             "Result",
//             style: textStyleRegular,
//           ),
//         ),
//       ),
//       body: Flex(
//         direction: Axis.vertical,
//         children: [
//           Expanded(
//             child: Column(
//               children: [
//                 Expanded(
//                   child: Container(
//                     decoration: BoxDecoration(
//                       color: whiteColor,
//                       borderRadius: BorderRadius.only(
//                         topLeft: Radius.circular(25),
//                         topRight: Radius.circular(25),
//                       ),
//                     ),
//                     child: Padding(
//                         padding: EdgeInsets.only(
//                             top: 8.0, left: 10.0, right: 10.0),
//                         child: Column(
//                           children: [
//                             SizedBox(height: 10),
//                             buildDateFilter(context),
//                             SizedBox(height: 20),
//                             Container(
//                               child: Text(
//                                 "Surendra",
//                                 style: TextStyle(
//                                     fontWeight: FontWeight.bold,
//                                     fontSize: 20.0,
//                                     color: Color(0xff313131)),
//                               ),
//                             ),
//                             SizedBox(height: 10),
//                             buildResult(context),
//                           ],
//                         )),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//       floatingActionButton: FloatingActionButton.extended(
//         onPressed: () {
//           graphShow("Graph");
//         },
//         icon: const Icon(Icons.navigation),
//         label: Text('Graph'),
//         backgroundColor: blueColor,
//       ),
//     ),
//   );
// }

//   Container buildResult(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//         border: Border.all(
//           color: Color(0xffE1E3E8),
//         ),
//         borderRadius: BorderRadius.circular(10),
//       ),
//       child: Padding(
//         padding: const EdgeInsets.all(10.0),
//         child: Column(children: [
//           Row(children: [
//             Container(
//               width: 150,
//               child: Text(
//                 "English",
//                 style: TextStyle(
//                     fontSize: 14.0,
//                     color: Color(0xff313131),
//                     fontWeight: FontWeight.w400),
//               ),
//             ),
//             Expanded(
//               child: Container(
//                 child: Align(
//                   alignment: Alignment.centerRight,
//                   child: Text(
//                     "100",
//                     style: TextStyle(
//                         fontSize: 14.0,
//                         color: Color(0xff313131),
//                         fontWeight: FontWeight.w400),
//                   ),
//                 ), //#E6EFFF
//               ),
//             ),
//             Expanded(
//               child: Container(
//                 child: Align(
//                     alignment: Alignment.centerRight,
//                     child: Text(
//                       "78",
//                       style: TextStyle(
//                           fontWeight: FontWeight.w700,
//                           color: Color(0xff3A3A3A)),
//                     )),
//               ),
//             ),
//             Expanded(
//               child: Container(
//                 child: Text(
//                   " - A",
//                   style: TextStyle(
//                       fontWeight: FontWeight.w700, color: Color(0xff3A3A3A)),
//                 ), //3A3A3A
//               ),
//             ),
//           ]),
//           Row(children: [
//             Container(
//               width: 150,
//               child: Text(
//                 "Hindi",
//                 style: TextStyle(
//                     fontSize: 14.0,
//                     color: Color(0xff313131),
//                     fontWeight: FontWeight.w400),
//               ),
//             ),
//             Expanded(
//               child: Container(
//                 child: Align(
//                   alignment: Alignment.centerRight,
//                   child: Text(
//                     "100",
//                     style: TextStyle(
//                         fontSize: 14.0,
//                         color: Color(0xff313131),
//                         fontWeight: FontWeight.w400),
//                   ),
//                 ),
//               ),
//             ),
//             Expanded(
//               child: Container(
//                 child: Align(
//                     alignment: Alignment.centerRight,
//                     child: Text(
//                       "65",
//                       style: TextStyle(
//                           fontWeight: FontWeight.w700,
//                           color: Color(0xff3A3A3A)),
//                     )),
//               ),
//             ),
//             Expanded(
//               child: Container(
//                 child: Text(
//                   " - B",
//                   style: TextStyle(
//                       fontWeight: FontWeight.w700, color: Color(0xff3A3A3A)),
//                 ),
//               ),
//             ),
//           ]),
//           Row(children: [
//             Container(
//               width: 150,
//               child: Text(
//                 "Math",
//                 style: TextStyle(
//                     fontSize: 14.0,
//                     color: Color(0xff313131),
//                     fontWeight: FontWeight.w400),
//               ),
//             ),
//             Expanded(
//               child: Container(
//                 child: Align(
//                   alignment: Alignment.centerRight,
//                   child: Text(
//                     "100",
//                     style: TextStyle(
//                         fontSize: 14.0,
//                         color: Color(0xff313131),
//                         fontWeight: FontWeight.w400),
//                   ),
//                 ),
//               ),
//             ),
//             Expanded(
//               child: Container(
//                 child: Align(
//                     alignment: Alignment.centerRight,
//                     child: Text(
//                       "78",
//                       style: TextStyle(
//                           fontWeight: FontWeight.w700,
//                           color: Color(0xff3A3A3A)),
//                     )),
//               ),
//             ),
//             Expanded(
//               child: Container(
//                 child: Text(
//                   " - A",
//                   style: TextStyle(
//                       fontWeight: FontWeight.w700, color: Color(0xff3A3A3A)),
//                 ),
//               ),
//             ),
//           ]),
//           Row(children: [
//             Container(
//               width: 150,
//               child: Text(
//                 "Computer",
//                 style: TextStyle(
//                     fontSize: 14.0,
//                     color: Color(0xff313131),
//                     fontWeight: FontWeight.w400),
//               ),
//             ),
//             Expanded(
//               child: Container(
//                 child: Align(
//                   alignment: Alignment.centerRight,
//                   child: Text(
//                     "100",
//                     style: TextStyle(
//                         fontSize: 14.0,
//                         color: Color(0xff313131),
//                         fontWeight: FontWeight.w400),
//                   ),
//                 ),
//               ),
//             ),
//             Expanded(
//               child: Container(
//                 child: Align(
//                     alignment: Alignment.centerRight,
//                     child: Text(
//                       "60",
//                       style: TextStyle(
//                           fontWeight: FontWeight.w700,
//                           color: Color(0xff3A3A3A)),
//                     )),
//               ),
//             ),
//             Expanded(
//               child: Container(
//                 child: Text(
//                   " - A",
//                   style: TextStyle(
//                       fontWeight: FontWeight.w700, color: Color(0xff3A3A3A)),
//                 ),
//               ),
//             ),
//           ]),
//         ]),
//       ),
//     );
//   }

//   Expanded buildDateFilter(BuildContext context) {
//     return Expanded(
//       flex: 0,
//       child: Padding(
//         padding: const EdgeInsets.only(left: 0.0),
//         child: Container(
//           child: Column(
//             children: [
//               SizedBox(
//                 height: 10.0,
//               ),
//               Row(
//                 children: [
//                   Expanded(
//                     child: sessionSelect(context),
//                   ),
//                   SizedBox(
//                     width: 10.0,
//                   ),
//                   Expanded(
//                     child: classSelect(context),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Container sessionSelect(BuildContext context) {
//     return Container(
//       height: 40.0,
//       width: double.infinity,
//       padding: EdgeInsets.symmetric(vertical: 8.0),
//       decoration: BoxDecoration(
//         border: Border.all(color: Color(0xffECECEC)),
//       ),
//       child: Padding(
//         padding: const EdgeInsets.only(right: 8.0, left: 2.0),
//         child: DropdownButton<String>(
//           value: dropdownSessionValue,
//           icon: const Icon(Icons.arrow_drop_down),
//           hint: Padding(
//             padding: const EdgeInsets.only(left: 8.0),
//             child: Text(
//               "SELECT SESSION",
//               style: TextStyle(fontSize: 13.0),
//             ),
//           ),
//           iconSize: 20,
//           elevation: 16,
//           isExpanded: true,
//           dropdownColor: Color(0xffFFFFFF),
//           style: const TextStyle(
//             color: Colors.black,
//             fontSize: 13.0,
//           ),
//           underline: Container(
//             color: Color(0xffFFFFFF),
//           ),
//           onChanged: (newValue) {
//             setState(() {
//               dropdownSessionValue = newValue;
//               print(
//                   ">>>>>>>>>>>selected values>>>>>>>>>>>>>>>>$dropdownSessionValue");
//             });
//           },
//           items: dropdownValueSessionList
//               .map<DropdownMenuItem<String>>((String value) {
//             return DropdownMenuItem<String>(
//               value: value,
//               child: Padding(
//                 padding: EdgeInsets.only(left: 8.0),
//                 child: Text(
//                   value,
//                   style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.w300),
//                 ),
//               ),
//             );
//           }).toList(),
//         ),
//       ),
//     );
//   }

//   Container classSelect(BuildContext context) {
//     return Container(
//       height: 40.0,
//       width: double.infinity,
//       padding: EdgeInsets.symmetric(vertical: 8.0),
//       decoration: BoxDecoration(
//         border: Border.all(color: Color(0xffECECEC)),
//       ),
//       child: Padding(
//         padding: const EdgeInsets.only(right: 8.0, left: 2.0),
//         child: DropdownButton<String>(
//           value: selectedClass,
//           icon: const Icon(Icons.arrow_drop_down),
//           hint: Padding(
//             padding: const EdgeInsets.only(left: 8.0),
//             child: Text(
//               "SELECT EXAM",
//             ),
//           ),
//           iconSize: 20,
//           elevation: 16,
//           isExpanded: true,
//           dropdownColor: Color(0xffFFFFFF),
//           style: const TextStyle(
//             color: Colors.black,
//             fontSize: 13.0,
//           ),
//           underline: Container(
//             color: Color(0xffFFFFFF),
//           ),
//           onChanged: (newValue) {
//             setState(() {
//               selectedClass = newValue;
//               print(">>>>>>>>>>>selected values>>>>>>>>>>>>>>>>$selectedClass");
//             });
//           },
//           items: classList.map<DropdownMenuItem<String>>((String value) {
//             return DropdownMenuItem<String>(
//               value: value,
//               child: Padding(
//                 padding: EdgeInsets.only(left: 8.0),
//                 child: Text(
//                   value,
//                   style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.w300),
//                 ),
//               ),
//             );
//           }).toList(),
//         ),
//       ),
//     );
//   }

// }

class ResultModel {
  String? subjectName;
  int? marks;

  ResultModel(this.subjectName, this.marks);
}
