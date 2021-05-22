import 'package:campus_pro/src/UI/WIDGETS/classEndDrawer.dart';
import 'package:flutter/material.dart';
import '../../CONSTANTS/themeData.dart';
import '../../DATA/MODELS/feeDummyData.dart';
import '../WIDGETS/drawerWidget.dart';

class ClassRooms extends StatefulWidget {
  static const routeName = "/class-rooms";
  @override
  _ClassRoomsState createState() => _ClassRoomsState();
}

class _ClassRoomsState extends State<ClassRooms> {
  final _drawerKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: customGradient,
      ),
      child: Scaffold(
        endDrawer: ClassesEndDrawer(),
        key: _drawerKey,
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
            title: Text("Classrooms"),
            actions: [
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.refresh, color: Colors.white, size: 30),
              ),
              SizedBox(width: 8),
              // Container(),
            ]),
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
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Container(
                  //   padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  //   color: Theme.of(context).primaryColor,
                  //   child:
                  //       buildText(title: "${i + 1}", color: Colors.white),
                  // ),
                  // SizedBox(width: 8),
                  buildText(title: "Sonam-Maths", color: Color(0xff3A3A3A)),
                  Icon(Icons.chat,
                      size: 24, color: Theme.of(context).accentColor),
                ],
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Divider(color: Color(0xffDBDBDB), height: 20),
                  buildText(title: "15 Apr 2021"),
                  buildText(
                    title:
                        "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            // padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
            color: Colors.white,
            child: Text(
              "Type",
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
          ),
          InkWell(
            onTap: () {
              _drawerKey.currentState!.openEndDrawer();
            },
            child: Container(
              // padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
              // color: Theme.of(context).primaryColor,
              child: Row(
                children: [
                  Text("Filter", style: TextStyle(color: Colors.black)),
                  Icon(Icons.sort),
                ],
              ),
            ),
          ),
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
