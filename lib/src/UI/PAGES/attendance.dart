import 'dart:core';
import 'package:campus_pro/src/DATA/MODELS/attendanceChartModel.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';

import '../../CONSTANTS/themeData.dart';
import '../../DATA/MODELS/feeDummyData.dart';

class Attendance extends StatefulWidget {
  static const routeName = "/attendance";
  @override
  _AttendanceState createState() => _AttendanceState();
}

class _AttendanceState extends State<Attendance> {
  TextEditingController descriptionController = TextEditingController();
  TabController? tabController;

  var scrollController = ScrollController();

  int _currentIndex = 0;

  String? _selectedLeave = 'Sick Leave';

  List<String> leaveTypeDropdown = ['Sick Leave', 'Urgent'];

  String _startDateSelected = "dd/mm/yyyy";
  String _endDateSelected = "dd/mm/yyyy";

  void tabIndexChange(int tabIndex) {
    setState(() {
      _currentIndex = tabIndex;
    });
  }

  DateTime selectedDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime.now(),
      lastDate: DateTime(2101),
      helpText: "SELECT START DATE",
    );
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }

  @override
  void dispose() {
    descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: customGradient,
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: Icon(
              Icons.arrow_back_ios_outlined,
              color: Colors.white,
            ),
          ),
          title: Text("Attendance"),
        ),
        body: NestedScrollView(
          controller: scrollController,
          physics: ScrollPhysics(parent: PageScrollPhysics()),
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverList(
                delegate: SliverChildListDelegate([
                  buildGraph(context),
                  // Container(height: 300, color: Colors.blue),
                ]),
              ),
            ];
          },
          body: DefaultTabController(
            initialIndex: _currentIndex,
            length: 2,
            child: Column(
              children: [
                // SizedBox(height: 20),
                buildTabBar(context),
                Expanded(
                  child: TabBarView(
                    // physics: NeverScrollableScrollPhysics(),
                    children: [
                      buildLeaveRequests(context),
                      buildApplyForLeave(context),
                    ],
                  ),
                ),
                // buildLeaveForm(context),
                // buildLeaveStatus(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Container buildGraph(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      color: Colors.white,
      child: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            padding:
                const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            decoration: BoxDecoration(
              gradient: customGradient,
            ),
            child: Text(
              "Attendance Graph",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 18),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              border: Border.all(color: Color(0xffDBDBDB)),
            ),
            // child: AttendanceChart([], animate: true),
          ),
        ],
      ),
    );
  }

  Container buildTabBar(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Container(
        margin: const EdgeInsets.only(left: 8.0, right: 8.0, top: 8.0),
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Theme.of(context).primaryColor)),
        child: TabBar(
          unselectedLabelColor: Theme.of(context).primaryColor,
          labelColor: Colors.white,
          indicator: BoxDecoration(
            gradient: customGradient,
            // color: Theme.of(context).primaryColor,
          ),
          // isScrollable: true,
          physics: ClampingScrollPhysics(),
          onTap: (int tabIndex) {
            print("tabIndex: $tabIndex");
            switch (tabIndex) {
              case 0:
                tabIndexChange(tabIndex);
                // getSample();
                break;
              case 1:
                tabIndexChange(tabIndex);
                // getReports();
                break;
              default:
                tabIndexChange(tabIndex);
                // getSample();
                break;
            }
          },
          tabs: [
            buildTabs(title: 'Leave Requests', index: _currentIndex),
            buildTabs(title: 'Apply For Leave', index: _currentIndex),
          ],
          controller: tabController,
        ),
      ),
    );
  }

  Tab buildTabs({String? title, int? index}) {
    return Tab(
      child: Text(title ?? ""),
    );
  }

  Container buildLeaveRequests(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      color: Colors.white,
      child: ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: feeReceiptList.length,
        itemBuilder: (context, i) {
          var item = feeReceiptList[i];
          return Container(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            decoration: BoxDecoration(
              border: Border.all(color: Color(0xffDBDBDB)),
            ),
            child: ListTile(
              title: Row(
                children: [
                  buildText(title: "Urgent", color: Color(0xff3A3A3A)),
                  SizedBox(width: 6),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                    decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(12.0)),
                    child: Text("Pending",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 10)),
                  ),
                ],
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Divider(color: Color(0xffDBDBDB), height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      buildText(title: "To: 15 Apr 2021"),
                      buildText(title: "To: 15 May 2021"),
                    ],
                  ),
                  buildText(
                      title: "Allowed For:    5",
                      color: Theme.of(context).primaryColor),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Container buildApplyForLeave(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      color: Colors.white,
      child: ListView(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        children: [
          buildLabels("Leave Type"),
          SizedBox(height: 8),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            decoration: BoxDecoration(
              border: Border.all(color: Color(0xffECECEC)),
              // borderRadius: BorderRadius.circular(4),
            ),
            child: DropdownButton<String>(
              isDense: true,
              value: _selectedLeave,
              key: UniqueKey(),
              isExpanded: true,
              underline: Container(),
              items: leaveTypeDropdown
                  .map((item) =>
                      DropdownMenuItem<String>(child: Text(item), value: item))
                  .toList(),
              onChanged: (val) {
                setState(() {
                  _selectedLeave = val;
                  print("_selectedLeave: $val");
                });
              },
            ),
          ),
          SizedBox(height: 20),
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    buildLabels("Start Date"),
                    SizedBox(height: 8),
                    buildDateSelector(index: 0),
                  ],
                ),
              ),
              SizedBox(width: 20),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    buildLabels("End Date"),
                    SizedBox(height: 8),
                    buildDateSelector(index: 1),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          buildLabels("Description"),
          buildTextField(),
          buildApplyBtn(),
        ],
      ),
    );
  }

  InkWell buildDateSelector({int? index}) {
    return InkWell(
      onTap: () => _selectDate(context),
      child: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            decoration: BoxDecoration(
              border: Border.all(color: Color(0xffECECEC)),
            ),
            child: Text("${selectedDate.toLocal()}".split(' ')[0]),
            // child: Text(index == 0 ? _startDateSelected : _endDateSelected),
          ),
          Positioned(
              right: 8,
              top: 8,
              child: Icon(Icons.today, color: Theme.of(context).primaryColor)),
        ],
      ),
    );
  }

  Container buildTextField() {
    return Container(
      margin: const EdgeInsets.only(top: 8),
      child: TextFormField(
        maxLines: 8,
        maxLength: 100,
        controller: descriptionController,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        style: TextStyle(color: Colors.black),
        decoration: InputDecoration(
          border: new OutlineInputBorder(
            borderRadius: const BorderRadius.all(
              const Radius.circular(18.0),
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Color(0xffECECEC),
            ),
            gapPadding: 0.0,
          ),
          disabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Theme.of(context).primaryColor,
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Color(0xffECECEC),
            ),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Theme.of(context).primaryColor,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Theme.of(context).primaryColor,
            ),
          ),
          hintText: "type here...",
          hintStyle: TextStyle(color: Color(0xff77838F)),
          contentPadding:
              const EdgeInsets.symmetric(vertical: 0.0, horizontal: 16),
        ),
      ),
    );
  }

  Container buildApplyBtn() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 40.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [accentColor, primaryColor]),
      ),
      child: FlatButton(
        onPressed: () {
          // Navigator.pushNamedAndRemoveUntil(
          //     context, HomePage.routeName, (route) => false);
        },
        child: Text(
          "Apply For Leave",
          style:
              TextStyle(fontFamily: "BebasNeue-Regular", color: Colors.white),
        ),
      ),
    );
  }

  Text buildLabels(String label) {
    return Text(
      label,
      style: TextStyle(
        // color: Theme.of(context).primaryColor,
        color: Color(0xff3A3A3A),
        fontWeight: FontWeight.w600,
      ),
    );
  }

  Text buildText({String? title, Color? color}) {
    return Text(
      title ?? "",
      style: TextStyle(fontWeight: FontWeight.w600, color: color),
    );
  }
}

// class AttendanceChart extends StatelessWidget {
//   final List<charts.Series<AttendanceChartModel, String>> seriesList;
//   final bool? animate;

//   AttendanceChart(this.seriesList, {this.animate});

//   factory AttendanceChart.withSampleData() {
//     return new AttendanceChart(
//       _createSampleData(),
//       // Disable animations for image tests.
//       animate: false,
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 200,
//       padding: const EdgeInsets.all(0.0),
//       child: charts.BarChart(
//         seriesList,
//         animate: animate,
//         barGroupingType: charts.BarGroupingType.grouped,
//       ),
//     );
//   }

//   /// Create series list with multiple series
//   static List<charts.Series<AttendanceChartModel, String>> _createSampleData() {
//     final absentData = [
//       AttendanceChartModel(
//           month: "Jan",
//           value: 5,
//           barColor: charts.ColorUtil.fromDartColor(Colors.red)),
//       AttendanceChartModel(
//           month: "Feb",
//           value: 10,
//           barColor: charts.ColorUtil.fromDartColor(Colors.red)),
//       AttendanceChartModel(
//           month: "Mar",
//           value: 2,
//           barColor: charts.ColorUtil.fromDartColor(Colors.red)),
//     ];

//     final presentData = [
//       AttendanceChartModel(
//           month: "Jan",
//           value: 25,
//           barColor: charts.ColorUtil.fromDartColor(Colors.green)),
//       AttendanceChartModel(
//           month: "Feb",
//           value: 20,
//           barColor: charts.ColorUtil.fromDartColor(Colors.green)),
//       AttendanceChartModel(
//           month: "Mar",
//           value: 28,
//           barColor: charts.ColorUtil.fromDartColor(Colors.green)),
//     ];

//     return [
//       new charts.Series<AttendanceChartModel, String>(
//         id: 'Absent',
//         domainFn: (AttendanceChartModel series, _) => series.month,
//         measureFn: (AttendanceChartModel series, _) => series.value,
//         colorFn: (AttendanceChartModel series, _) => series.barColor,
//         data: absentData,
//       ),
//       new charts.Series<AttendanceChartModel, String>(
//         id: 'Present',
//         domainFn: (AttendanceChartModel series, _) => series.month,
//         measureFn: (AttendanceChartModel series, _) => series.value,
//         colorFn: (AttendanceChartModel series, _) => series.barColor,
//         data: presentData,
//       ),
//     ];
//   }
// }
