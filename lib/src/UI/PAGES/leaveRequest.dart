import 'package:campus_pro/src/CONSTANTS/style.dart';
import 'package:campus_pro/src/CONSTANTS/themeData.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class LeaveRequestPage extends StatefulWidget {
  @override
  _LeaveRequestPageState createState() => _LeaveRequestPageState();
}

class _LeaveRequestPageState extends State<LeaveRequestPage> {
  DateTime? date;
  String? updatedDt = "";

  // Future<void> selectDateFrom(BuildContext context) async {
  //   final DateTime? picked = await showDatePicker(
  //       context: context,
  //       //initialDate:DateTime.now(),
  //       initialDate: date == null ? DateTime.now() : date,
  //       firstDate: DateTime(2000),
  //       lastDate: DateTime(2024));
  //   if (picked != null && picked != date) {
  //     setState(() {
  //       var newFormat = DateFormat("dd-MMM-yyyy");
  //       updatedDt = newFormat.format(picked);
  //       print(">>>>>>>>>>>>>>date change format>>>>>>>>>>>>$updatedDt");
  //     });
  //   }
  // }

  DateTime? date2;
  String? updatedDt2 = "";

  // Future<void> selectDateTo(BuildContext context) async {
  //   final DateTime? picked = await showDatePicker(
  //       context: context,
  //       initialDate: date2 == null ? DateTime.now() : date2,
  //       firstDate: DateTime(2000),
  //       lastDate: DateTime(2024));
  //   if (picked != null && picked != date2) {
  //     setState(() {
  //       var newFormat = DateFormat("dd-MMM-yyyy");
  //       updatedDt2 = newFormat.format(picked);
  //       print(">>>>>>>>>>>>>>date2 change format>>>>>>>>>>>>$updatedDt2");
  //     });
  //   }
  // }

  List<String> dropdownValueList = <String>[
    'Sick Leave',
    'Urgent',
  ];

  String? dropdownValue;

  TextEditingController descriptionController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: customGradient,
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(100.0),
          child: AppBar(
            leading: Icon(Icons.arrow_back_ios),
            backgroundColor: Colors.transparent,
            shadowColor: Colors.transparent,
            elevation: 0.0,
            centerTitle: true,
            title: Text(
              "Leave Request",
              style: textStyleRegular,
            ),
          ),
        ),
        body: Flex(
          direction: Axis.vertical,
          children: [
            Expanded(
                child: Container(
              decoration: BoxDecoration(
                color: whiteColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25),
                  topRight: Radius.circular(25),
                ),
              ),
              child: ListView(
                children: [
                  SizedBox(
                    height: 15.0,
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: 12.0, top: 5.0, bottom: 5.0, right: 12.0),
                    child: Column(
                      children: [
                        Container(
                          child: Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                "Leave Type:",
                                style: textStyle12,
                              )),
                        ),
                        SizedBox(
                          height: 8.0,
                        ),
                        Container(
                          height: 40.0,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            //color: Color("#FFFFFF"),
                            border: Border.all(
                                color: Color(0xffE1E3E8), width: 1.0),
                            borderRadius: BorderRadius.circular(6.0),
                          ),
                          child: Padding(
                            padding:
                                const EdgeInsets.only(right: 8.0, left: 2.0),
                            child: DropdownButton<String>(
                              value: dropdownValue,
                              icon: const Icon(Icons.arrow_drop_down),
                              hint: Text(
                                "--SELECT LEAVE--",
                                style: textStyle16,
                              ),
                              iconSize: 20,
                              elevation: 16,
                              isExpanded: true,
                              // dropdownColor:Color("#FFFFFF"),
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 13.0,
                                  fontFamily: "OpenSan"),
                              underline: Container(
                                color: Color(0xffFFFFFF),
                              ),
                              onChanged: (newValue) {
                                setState(() {
                                  dropdownValue = newValue;
                                  print(
                                      ">>>>>>>>>>>selected values>>>>>>>>>>>>>>>>$dropdownValue");
                                });
                              },
                              items: dropdownValueList
                                  .map<DropdownMenuItem<String>>(
                                      (String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Padding(
                                    padding: EdgeInsets.only(left: 8.0),
                                    child: Text(
                                      value,
                                      style: textStyle16,
                                    ),
                                  ),
                                );
                              }).toList(),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 4.0, bottom: 4.0),
                                    child: Container(
                                        child: Text(
                                      "From Date",
                                      style: textStyle12,
                                    )),
                                  ),
                                  Container(
                                      height: 35.0,
                                      decoration: BoxDecoration(
                                        color: Color(0xffFFFFFF),
                                        borderRadius:
                                            BorderRadius.circular(6.0),
                                        border: Border.all(
                                            color: Color(0xffE1E3E8), width: 1),
                                      ),
                                      child: Row(
                                        children: [
                                          Container(
                                              child: Padding(
                                            padding: const EdgeInsets.only(
                                                left: 3.0),
                                            child: Text(
                                              updatedDt == ""
                                                  ? "Select Date"
                                                  : updatedDt.toString(),
                                              style: textStyle16,
                                            ),
                                          )),
                                          SizedBox(
                                            width: 13.0,
                                          ),
                                          IconButton(
                                            icon: Icon(
                                                Icons.calendar_today_rounded),
                                            onPressed: () {
                                              // selectDateFrom(context);
                                            },
                                          ),
                                        ],
                                      )),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                          Expanded(
                            child: Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 4.0, bottom: 4.0),
                                    child: Container(
                                        child: Text(
                                      "Upto Date",
                                      style: textStyle12,
                                    )),
                                  ),
                                  Container(
                                      height: 35.0,
                                      decoration: BoxDecoration(
                                        color: Color(0xffFFFFFF),
                                        borderRadius:
                                            BorderRadius.circular(6.0),
                                        border: Border.all(
                                            color: Color(0xffE1E3E8), width: 1),
                                      ),
                                      child: Row(
                                        children: [
                                          Container(
                                              child: Padding(
                                            padding: const EdgeInsets.only(
                                                left: 3.0),
                                            child: Text(
                                              updatedDt2 == ""
                                                  ? "Select Date"
                                                  : updatedDt2.toString(),
                                              style: textStyle16,
                                              textAlign: TextAlign.center,
                                            ),
                                          )),
                                          SizedBox(
                                            width: 13.0,
                                          ),
                                          IconButton(
                                            icon: Icon(
                                                Icons.calendar_today_rounded),
                                            onPressed: () {
                                              // selectDateTo(context);
                                            },
                                          ),
                                        ],
                                      )),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 8.0, top: 15.0, right: 8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 1.0, bottom: 8.0),
                            child: Container(
                                child: Text(
                              "Description",
                              style: textStyle12,
                            )),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: Color(0xffFFFFFF),
                              borderRadius: new BorderRadius.circular(10.0),
                              border: Border.all(color: Color(0xffE1E3E8)),
                            ),
                            child: Align(
                              alignment: Alignment.topLeft,
                              child: TextFormField(
                                controller: descriptionController,
                                style: textStyle16,
                                textAlign: TextAlign.left,
                                maxLines: 5,
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.only(left: 5.0),
                                  hintText: "Description",
                                  hintStyle: textStyle16,
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 12.0, top: 5.0, right: 12.0),
                    child: Container(
                      height: 54.0,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                            colors: [accentColor, primaryColor]),
                        borderRadius: BorderRadius.all(
                          Radius.circular(13.0),
                        ),
                      ),
                      child: FlatButton(
                        //color: Colors.transparent,
                        onPressed: () {
                          print(">>>>>>>>>>>>>>>>>>>>>changed pass button");
                        },
                        child: Text(
                          "CHANGE PASSWORD",
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                          // style: Theme.of(context).textTheme.headline1,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )),
          ],
        ),
      ),
    );
  }
}
