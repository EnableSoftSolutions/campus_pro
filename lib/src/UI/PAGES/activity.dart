import 'dart:core';
import 'package:campus_pro/src/DATA/MODELS/attendanceChartModel.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';

import '../../CONSTANTS/themeData.dart';
import '../../DATA/MODELS/feeDummyData.dart';

class Activity extends StatefulWidget {
  static const routeName = "/Actitvity";
  @override
  _ActivityState createState() => _ActivityState();
}

class _ActivityState extends State<Activity> {
  TextEditingController descriptionController = TextEditingController();
  TabController? tabController;

  var scrollController = ScrollController();

  int _currentIndex = 0;

  String? _selectedClass = 'X';

  List<String> classDropdown = ['X', 'XI', "XI"];

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
      child: DefaultTabController(
        initialIndex: _currentIndex,
        length: 2,
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
            title: Text("Acitvity"),
          ),
          body: Column(
            children: [
              SizedBox(height: 20),
              buildTabBar(context),
              buildTopDateFilter(context),
              Expanded(
                child: TabBarView(
                  physics: AlwaysScrollableScrollPhysics(),
                  children: [
                    buildActivities(context),
                    buildManageActivity(context),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container buildTopDateFilter(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: buildDateSelector(index: 0),
              ),
              Icon(Icons.arrow_right_alt_outlined),
              // SizedBox(width: 20),
              Expanded(
                child: buildDateSelector(index: 1),
              ),
            ],
          ),
          SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
                color: Colors.white,
                child: Text(
                  "Clear",
                  style: TextStyle(color: Colors.black),
                ),
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
                color: Theme.of(context).primaryColor,
                child: Text(
                  "Show",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          )
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
            buildTabs(title: 'All Activities', index: _currentIndex),
            buildTabs(title: 'Manage Activity', index: _currentIndex),
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

  Container buildActivities(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      color: Colors.white,
      child: ListView.builder(
        physics: AlwaysScrollableScrollPhysics(),
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
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    color: Theme.of(context).primaryColor,
                    child: buildText(title: "${i + 1}", color: Colors.white),
                  ),
                  SizedBox(width: 8),
                  buildText(title: "Science", color: Color(0xff3A3A3A)),
                ],
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Divider(color: Color(0xffDBDBDB), height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      buildText(title: "Activity.No.: 20024"),
                      buildText(title: "15 Apr 2021"),
                    ],
                  ),
                  buildText(
                    title: "Content:\n" + "Lorem Ipsum is simply dummy text",
                    // color: Theme.of(context).primaryColor,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Container buildManageActivity(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      color: Colors.white,
      child: ListView(
        shrinkWrap: true,
        physics: AlwaysScrollableScrollPhysics(),
        children: [
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    buildLabels("Class:"),
                    SizedBox(height: 8),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8, horizontal: 16),
                      decoration: BoxDecoration(
                        border: Border.all(color: Color(0xffECECEC)),
                        // borderRadius: BorderRadius.circular(4),
                      ),
                      child: DropdownButton<String>(
                        isDense: true,
                        value: _selectedClass,
                        key: UniqueKey(),
                        isExpanded: true,
                        underline: Container(),
                        items: classDropdown
                            .map((item) => DropdownMenuItem<String>(
                                child: Text(item), value: item))
                            .toList(),
                        onChanged: (val) {
                          setState(() {
                            _selectedClass = val;
                            print("_selectedClass: $val");
                          });
                        },
                      ),
                    ),
                    // buildDateSelector(index: 0),
                  ],
                ),
              ),
              SizedBox(width: 20),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    buildLabels("Activity Date"),
                    SizedBox(height: 8),
                    buildDateSelector(),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          buildLabels("Subject:"),
          buildTextField(controller: descriptionController, maxLines: 1),
          SizedBox(height: 20),
          buildLabels("Content:"),
          buildTextField(
              controller: descriptionController, maxLines: 8, maxLength: 100),
          buildSaveBtn(),
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

  Container buildTextField(
      {int? maxLength, int? maxLines, TextEditingController? controller}) {
    return Container(
      margin: const EdgeInsets.only(top: 8),
      child: TextFormField(
        maxLines: maxLines,
        maxLength: maxLength,
        controller: controller,
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

  Container buildSaveBtn() {
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
          "Save Activity",
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
