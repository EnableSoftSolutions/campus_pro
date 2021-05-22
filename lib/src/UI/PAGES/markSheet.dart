import 'package:campus_pro/src/CONSTANTS/style.dart';
import 'package:campus_pro/src/CONSTANTS/themeData.dart';
import 'package:flutter/material.dart';

class MarkSheet extends StatefulWidget {
  static const routeName = "/mark-sheet";
  @override
  _MarkSheetState createState() => _MarkSheetState();
}

class _MarkSheetState extends State<MarkSheet> {
  List<String> classList = <String>[
    'VI - A2',
    'VI - A3',
    'VII - A1',
    'VII - B2',
    'VII - B1',
    'VII - B3'

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

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: blueColor,
          elevation: 0.0,
          centerTitle: true,
          title: Text("Mark Sheet", style: textStyleRegular),
          leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: Icon(
              Icons.arrow_back_ios_outlined,
              color: Colors.white,
            ),
          ),
        ),
        body: Flex(
          direction: Axis.vertical,
          children: [
            buildDateFilter(context),
            buidExamResult(context),
          ],
        ),
      ),
    );
  }

  Expanded buildDateFilter(BuildContext context) {
    return Expanded(
      flex: 0,
      child: Padding(
        padding: const EdgeInsets.only(left: 10.0, right: 10.0),
        child: Container(
          child: Column(
            children: [
              SizedBox(
                height: 10.0,
              ),
              Row(
                children: [
                  Expanded(
                    child: sessionSelect(context),
                  ),
                  SizedBox(
                    width: 20.0,
                  ),
                  Expanded(
                    child: classSelect(context),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }




  Expanded buidExamResult(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView.builder(
          itemCount: 15,
          itemBuilder: (BuildContext context, int i) {
          return Container(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            decoration: BoxDecoration(
              border: Border.all(color: Color(0xffDBDBDB)),
            ),
            child: Column(children: [
              Container(
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text(
                      "MarkSheet Type:",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          color: Color(0xff000000),
                          fontSize: 15.0,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),
              Container(
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text(
                      "Exams Chosen:",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          color: Color(0xff000000),
                          fontSize: 15.0,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
              )
            ]),
          );
        }),
      ),
    );
  }

  Container sessionSelect(BuildContext context) {
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
            padding: const EdgeInsets.only(left:8.0),
            child: Text(
              "SELECT SESSION",
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
          items: dropdownValueSessionList
              .map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Padding(
                padding: EdgeInsets.only(left: 8.0),
                child: Text(
                  value,
                  style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.w300),
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }

  Container classSelect(BuildContext context) {
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
            padding: const EdgeInsets.only(left:8.0),
            child: Text(
              "SELECT CLASS",
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
                  style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.w300),
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }


}
