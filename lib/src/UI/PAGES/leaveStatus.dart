import 'package:campus_pro/src/CONSTANTS/style.dart';
import 'package:campus_pro/src/CONSTANTS/themeData.dart';
import 'package:flutter/material.dart';

class LeaveStatus extends StatefulWidget {
  @override
  _LeaveStatusState createState() => _LeaveStatusState();
}

class _LeaveStatusState extends State<LeaveStatus> {
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
              "Leave Status",
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
              child: Padding(
                padding: EdgeInsets.only(top: 10.0),
                child: ListView.builder(
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: EdgeInsets.only(left: 8.0, right: 8.0),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 10.0,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Color(0xffE1E3E8),
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            height: 80,
                            child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(left: 8.0),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: Container(
                                            child: Text(
                                              "From Date",
                                              style: textStyle13Body,
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: Container(
                                            child: Text(
                                              "To Date",
                                              style: textStyle13Body,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 8.0),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: Container(
                                            child: Text(
                                              "Leave Type",
                                              style: textStyle13Body,
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: Container(
                                            child: Text(
                                              "Leave Status",
                                              style: textStyle13Body,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ]),
                          ),
                        ],
                      ),
                    );
                  },
                  itemCount: 20,
                ),
              ),
            ))
          ],
        ),
      ),
    );
  }
}
