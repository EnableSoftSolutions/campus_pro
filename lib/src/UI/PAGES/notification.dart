import 'package:campus_pro/src/CONSTANTS/style.dart';
import 'package:campus_pro/src/CONSTANTS/themeData.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NotificationPage extends StatefulWidget {
  static const routeName = "/notification";
  @override
  _NotificationPageState createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  DateTime date = DateTime.now();
  String? updatedDt;

  Future<void> selectDateFrom(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: date,
        firstDate: DateTime(2000),
        lastDate: DateTime(2024));
    if (picked != null) {
      setState(() {
        updatedDt = DateFormat("dd-MMM-yyyy").format(picked);
        print(">>>>>>>>>>>>hello>>>>>>>>>>>>>>$updatedDt");
        // _onButtonPressedButton(context);
      });
    }
  }

  // DateTime? date2;
  // String? updatedDt2;
  // bool checkedValue = false;

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
  //       _onButtonPressedButton(context);
  //     });
  //   }
  // }

  void _onButtonPressedButton(BuildContext context) {
    showModalBottomSheet(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        context: context,
        builder: (context) {
          return StatefulBuilder(
              builder: (BuildContext context, StateSetter mystate) {
            return Container(
              height: 170.0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    child: Padding(
                      padding:
                          EdgeInsets.only(left: 8.0, right: 8.0, top: 20.0),
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
                                            padding: EdgeInsets.only(left: 3.0),
                                            child: Text(
                                              updatedDt ??
                                                  DateFormat("dd-MMM-yyyy")
                                                      .format(date),
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
                                              selectDateFrom(context);
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
                                              "",
                                              // updatedDt2 == null
                                              //     ? "Select Date"
                                              //     : updatedDt2.toString(),
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
                  SizedBox(
                    height: 13.0,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 1.0, top: 5.0, right: 1.0),
                    child: Container(
                      height: 40.0,
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
                          Navigator.of(context).pop();
                        },
                        child: Text(
                          "View",
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                          // style: Theme.of(context).textTheme.headline1,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          });
        });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(gradient: customGradient),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(100.0),
          child: AppBar(
            automaticallyImplyLeading: true,
            backgroundColor: Colors.transparent,
            shadowColor: Colors.transparent,
            elevation: 0.0,
            centerTitle: true,
            title: Text(
              "Notification",
              style: textStyleRegular,
            ),
            actions: [
              IconButton(
                icon: Icon(
                  Icons.filter_alt_outlined,
                  size: 30.0,
                ),
                onPressed: () {
                  _onButtonPressedButton(context);
                },
              ),
            ],
          ),
        ),
        body: Flex(
          direction: Axis.vertical,
          children: [
            Expanded(
                child: Container(
              color: Colors.white,
              // decoration: BoxDecoration(
              //   color: whiteColor,
              //   borderRadius: BorderRadius.only(
              //     topLeft: Radius.circular(25),
              //     topRight: Radius.circular(25),
              //   ),
              // ),
              child: Padding(
                padding: EdgeInsets.only(left: 8.0, right: 8.0),
                child: Column(children: [
                  SizedBox(
                    height: 2.0,
                  ),
                  Container(
                    child: Expanded(
                      child: ListView.builder(
                          itemCount: 20,
                          itemBuilder: (BuildContext context, int i) {
                            return Column(
                              children: [
                                SizedBox(
                                  height: 20.0,
                                ),
                                Container(
                                    height: 70.0,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Color(0xffE1E3E8),
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.only(
                                          left: 8.0, right: 8.0),
                                      child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            Row(
                                              children: [
                                                Expanded(
                                                  child: Container(
                                                    child: Text("Sr No"),
                                                  ),
                                                ),
                                                Container(
                                                  child: Text("Date"),
                                                ),
                                              ],
                                            ),
                                            Container(
                                              child: Align(
                                                  alignment: Alignment.topLeft,
                                                  child: Text(
                                                    "Notificaton",
                                                  )),
                                            ),
                                          ]),
                                    )),
                              ],
                            );
                          }),
                    ),
                  ),
                ]),
              ),
            ))
          ],
        ),
      ),
    );
  }
}
