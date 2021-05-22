import 'package:flutter/material.dart';
import '../../UTILS/appImages.dart';
import '../PAGES/homePage.dart';

class ClassesEndDrawer extends StatefulWidget {
  @override
  _ClassesEndDrawerState createState() => _ClassesEndDrawerState();
}

class _ClassesEndDrawerState extends State<ClassesEndDrawer> {
  final List<DrawerItem> _listViewData = [
    DrawerItem(itemName: "fsfsfds", icon: AppImages.icon),
    DrawerItem(itemName: "Dashboard", icon: AppImages.icon),
    DrawerItem(itemName: "Fee Payment", icon: AppImages.icon),
    DrawerItem(itemName: "Communication", icon: AppImages.icon),
  ];

  _onSelected(int index) {
    switch (index) {
      case 0:
        return null;
        break;
      case 1:
        return Navigator.pushNamed(context, HomePage.routeName);
        break;
      case 2:
        return null;
        break;
      case 3:
        return null;
        break;
      default:
        return Navigator.pushNamed(context, HomePage.routeName);
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width - 100,
      child: Drawer(
        child: Scaffold(
          appBar: AppBar(toolbarHeight: 0.0),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border(
                      bottom: BorderSide(
                    color: Colors.grey,
                    // color: Theme.of(context).primaryColor,
                    width: 6,
                  )),
                ),
                child: Text(
                  "FILTER",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
              ),
              SizedBox(height: 8),
              Expanded(
                child: Container(
                  // margin: const EdgeInsets.all(12.0),
                  child: ListView.separated(
                      itemCount: _listViewData.length,
                      separatorBuilder: (BuildContext context, int index) =>
                          buildDivider(),
                      itemBuilder: (context, i) {
                        var item = _listViewData[i];
                        return InkWell(
                          // onTap: () => _onSelected(i),
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16.0, vertical: 8),
                            child: Text(
                              item.itemName ?? "",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                              ),
                            ),
                          ),
                        );
                        // return ListTile(
                        //   title: Text(
                        //     item.itemName ?? "",
                        //     style: TextStyle(
                        //       color: Theme.of(context).primaryColor,
                        //       fontSize: 12,
                        //     ),
                        //   ),
                        //   onTap: () => _onSelected(i),
                        // );
                      }),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Text buildText({String? title}) {
    return Text(
      title ?? "",
      textScaleFactor: 1.0,
      style: TextStyle(
        color: Colors.white,
        fontSize: 24,
        // decoration: TextDecoration.underline,
      ),
    );
  }

  Padding buildDivider() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Divider(color: Colors.grey),
    );
  }
}

class DrawerItem {
  String? itemName;
  String? icon;

  DrawerItem({this.itemName, this.icon});
}
