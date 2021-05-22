import 'package:flutter/material.dart';
import '../../CONSTANTS/themeData.dart';
import '../../DATA/MODELS/feeDummyData.dart';

class HomeWork extends StatefulWidget {
  static const routeName = "/home-work";
  @override
  _HomeWorkState createState() => _HomeWorkState();
}

class _HomeWorkState extends State<HomeWork> {
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
          title: Text("My Homework"),
        ),
        body: Column(
          children: [
            SizedBox(height: 20),
            buildTopDateFilter(context),
            Expanded(
              child: Container(
                // height: double.infinity,
                width: MediaQuery.of(context).size.width,
                color: Colors.white,
                child: buildHomeWorks(context),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container buildHomeWorks(BuildContext context) {
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
                  buildText(title: "Date: 15 Apr 2021"),
                  buildText(
                    title: "Homework:\n" +
                        "राम आम खाता है । सुरेश अच्छा लड़का है। तुम लोग जो हो अच्छे हो ।",
                    // color: Theme.of(context).primaryColor,
                  ),
                  Row(
                    children: [
                      Icon(Icons.file_download,
                          color: Theme.of(context).accentColor),
                      Text(
                        "Download File",
                        textScaleFactor: 1.0,
                        style: TextStyle(
                            color: Theme.of(context).accentColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Text buildText({String? title, Color? color}) {
    return Text(
      title ?? "",
      style: TextStyle(fontWeight: FontWeight.w600, color: color),
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
                  "View",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          )
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
}
