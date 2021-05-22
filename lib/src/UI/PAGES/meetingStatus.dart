import 'package:campus_pro/src/CONSTANTS/style.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MeetingStatus extends StatefulWidget {
  static const routeName = "/meeting-status";
  @override
  _MeetingStatusState createState() => _MeetingStatusState();
}

class _MeetingStatusState extends State<MeetingStatus> {

  DateTime date = DateTime.now();
  String? selectedDate;

  Future<void> selectDateFrom(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: date,
        firstDate: DateTime(2000),
        lastDate: DateTime(2024));
    if (picked != null) {
      setState(() {
        selectedDate = DateFormat("dd-MMM-yyyy").format(picked);
        print(">>>>>>>>>>>>hello>>>>>>>>>>>>>>$selectedDate");
      });
    }
  }

  List<String> classList = <String>['VI-A2','VII-A3','XII-SCI.-A1','XII-SCI.-A2'];
  String? selectedClass;
  List<String> classSection = <String>[
    'Math',
    'English',
    'Science',
    'Physics',
    'EVS',
    'Hindi'
  ];
  String? dropdownSessionValue;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Meeting Status"),
          centerTitle: true,
        ),
        body: Flex(
          direction: Axis.vertical,
          children: [
            filterMeetingList(context),
            Expanded(
              flex: 1,
              child: showCardListBuilder(context),
            ),
          ],
        ),
      ),
    );
  }

  Expanded filterMeetingList(BuildContext context) {
    return Expanded(
      flex: 0,
      child: Container(
        child: Padding(
          padding: const EdgeInsets.only(left:8.0,right: 8.0),
          child: Column(children: [
            SizedBox(
              height: 6.0,
            ),

            Row(
              children: [
                Expanded(
                  child: selectClass(context),
                ),
                SizedBox(
                  width: 20.0,
                ),
                Expanded(
                  child: selectSubject(context),
                ),
              ],
            ),

            SizedBox(
              height: 5.0,
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
                                              selectedDate ??
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
          ]),
        ),
      ),
    );
  }






  Container showCardListBuilder(BuildContext context) {
    return Container(
        child: ListView.builder(
      itemCount: 30,
      itemBuilder: (BuildContext context, int i) {
        return Column(
          children: [
            ListTile(
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
            ),




          ],
        );
      },
    ));
  }

  Text buildText({String? title, Color? color}) {
    return Text(
      title ?? "",
      style: TextStyle(fontWeight: FontWeight.w600, color: color),
    );
  }

  Container selectSubject(BuildContext context) {
    return Container(
      height: 40.0,
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 8.0),
      decoration: BoxDecoration(
        border: Border.all(color: Color(0xffECECEC)),
      ),
      child: Padding(
        padding: const EdgeInsets.only(right: 8.0, left: 2.0),
        child: DropdownButton<String>(
          value: dropdownSessionValue,
          icon: const Icon(Icons.arrow_drop_down),
          hint: Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Text(
              "SELECT SUBJECT",
              style: TextStyle(fontSize: 13.0, fontWeight: FontWeight.w400),
            ),
          ),
          iconSize: 20,
          elevation: 16,
          isExpanded: true,
          dropdownColor: Color(0xffFFFFFF),
          style: const TextStyle(
            color: Colors.black,
            fontSize: 13.0,
          ),
          underline: Container(
            color: Color(0xffFFFFFF),
          ),
          onChanged: (newValue) {
            setState(() {
              dropdownSessionValue = newValue;
              print(
                  ">>>>>>>>>>>selected values>>>>>>>>>>>>>>>>$dropdownSessionValue");
            });
          },
          items: classSection.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Padding(
                padding: EdgeInsets.only(left: 8.0),
                child: Text(
                  value,
                  style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.w400),
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }

  Container selectClass(BuildContext context) {
    return Container(
      height: 40.0,
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 8.0),
      decoration: BoxDecoration(
        border: Border.all(color: Color(0xffECECEC)),
      ),
      child: Padding(
        padding: const EdgeInsets.only(right: 8.0, left: 2.0),
        child: DropdownButton<String>(
          value: selectedClass,
          icon: const Icon(Icons.arrow_drop_down),
          hint: Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Text(
              "SELECT CLASS",
              style: TextStyle(fontSize: 13.0, fontWeight: FontWeight.w400),
            ),
          ),
          iconSize: 20,
          elevation: 16,
          isExpanded: true,
          dropdownColor: Color(0xffFFFFFF),
          style: const TextStyle(
            color: Colors.black,
            fontSize: 13.0,
          ),
          underline: Container(
            color: Color(0xffFFFFFF),
          ),
          onChanged: (newValue) {
            setState(() {
              selectedClass = newValue;
              print(">>>>>>>>>>>selected values>>>>>>>>>>>>>>>>$selectedClass");
            });
          },
          items: classList.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Padding(
                padding: EdgeInsets.only(left: 8.0),
                child: Text(
                  value,
                  style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.w400),
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
