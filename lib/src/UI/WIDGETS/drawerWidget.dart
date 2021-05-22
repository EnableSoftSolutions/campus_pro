import 'package:bot_toast/bot_toast.dart';
import 'package:campus_pro/src/UI/PAGES/userType.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:campus_pro/src/DATA/BLOC_CUBIT/DRAWER_CUBIT/drawer_cubit.dart';
import 'package:campus_pro/src/DATA/MODELS/drawerModel.dart';
import '../../CONSTANTS/stringConstants.dart';
import '../../CONSTANTS/themeData.dart';
import '../../DATA/BLOC_CUBIT/DRAWER_CUBIT/drawer_cubit.dart';
import '../../DATA/userUtils.dart';
import '../../DATA/userUtils.dart';
import '../../UTILS/appImages.dart';
import '../../UTILS/appImages.dart';
import '../PAGES/changePassword.dart';
import '../PAGES/feedBackPage.dart';
import '../PAGES/homePage.dart';
import '../PAGES/signInPage.dart';
import '../PAGES/viewProfile.dart';

class DrawerWidget extends StatefulWidget {
  @override
  _DrawerWidgetState createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  final List<DrawerItem> _listViewData = [
    DrawerItem(itemName: "Profile", icon: AppImages.icon),
    DrawerItem(itemName: "Dashboard", icon: AppImages.icon),
    DrawerItem(itemName: "Feedback", icon: AppImages.icon),
    DrawerItem(itemName: "Change Password", icon: AppImages.icon),
    DrawerItem(itemName: "Logout", icon: AppImages.icon),
  ];

  _onSelected(int index) {
    switch (index) {
      case 0:
        return Navigator.pushNamed(context, ViewProfile.routeName);
        break;
      case 1:
        return Navigator.pushNamed(context, HomePage.routeName);
        break;
      case 2:
        return Navigator.pushNamed(context, FeedBack.routeName);
        break;
      case 3:
        return Navigator.pushNamed(context, ChangePasswordPage.routeName);
        break;
      case 4:
        return logout();
        break;
      default:
        return Navigator.pushNamed(context, HomePage.routeName);
        break;
    }
  }

  logout() async {
    UserUtils.logout().then((value) {
      BotToast.showText(text: "Logout");
      Navigator.pushNamedAndRemoveUntil(
          context, SignInPage.routeName, (route) => false);
    });
  }

  @override
  void initState() {
    getDrawerItems();
    super.initState();
  }

  getDrawerItems() async {
    final userData = await UserUtils.userTypeFromCache();
    final drawerData = {
      "OrgId": userData!.organizationId!,
      "SchoolId": userData.schoolId!,
      "ID": "0",
      "UserType": userData.ouserType!,
      // "OrgId": "9998",
      // "SchoolId": "1",
      // "ID": "0",
      // "UserType": "S",
    };
    context.read<DrawerCubit>().drawerCubitCall(drawerData);
  }

  removeUserData() async {
    await UserUtils.removeUserType();
    await UserUtils.removeUserToken();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width - 100,
      child: Drawer(
        child: Container(
          decoration: BoxDecoration(gradient: customGradient),
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: BlocConsumer<DrawerCubit, DrawerState>(
              listener: (context, state) {
                if (state is DrawerLoadFail) {
                  if (state.failReason == "false") {
                    removeUserData();
                    BotToast.showText(text: "UNAUTHORIZED USER");
                    Navigator.pushNamedAndRemoveUntil(
                        context, UserType.routeName, (route) => false);
                  }
                }
              },
              builder: (context, state) {
                if (state is DrawerLoadSuccess) {
                  return buildDrawerItems(context,
                      drawerItem: state.drawerItems);
                } else if (state is DrawerLoadFail) {
                  return Center(child: Text(SOMETHING_WENT_WRONG));
                  // return Center(child: Text(state.failReason));
                } else {
                  return Center(
                    child: CircularProgressIndicator(
                        backgroundColor: Colors.white),
                  );
                }
              },
            ),
          ),
        ),
      ),
    );
  }

  Column buildDrawerItems(BuildContext context,
      {List<DrawerModel>? drawerItem}) {
    return Column(
      children: [
        Expanded(
          child: Column(
            children: [
              Container(
                height: 150,
                // color: Colors.yellow,
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 28,
                      backgroundImage: AssetImage(AppImages.logo),
                    ),
                    title: Text(
                      'Prateek',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                    subtitle: Text(
                      'prateek@gmail.com',
                      style: TextStyle(color: Colors.white70, fontSize: 12),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Divider(color: Colors.white70, thickness: 1),
              ),
              MediaQuery.removePadding(
                context: context,
                removeTop: true,
                child: Expanded(
                  child: ListView.builder(
                      shrinkWrap: true,
                      physics: AlwaysScrollableScrollPhysics(),
                      itemCount: drawerItem!.length,
                      itemBuilder: (context, i) {
                        var item = drawerItem[i];
                        if (item.subMenu!.isNotEmpty) {
                          return buildExpansionTile(item, i);
                        } else {
                          return buildListTile(item, i);
                        }
                      }),
                ),
              ),
            ],
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.symmetric(vertical: 8),
          // decoration: BoxDecoration(
          //   border: Border(top: BorderSide(color: Colors.white60)),
          // ),
          child: Center(
            child: Text('version 1.0',
                style: TextStyle(color: Colors.white60, fontSize: 12)),
          ),
        ),
      ],
    );
  }

  ListTile buildListTile(DrawerModel item, int i) {
    return ListTile(
      leading: Icon(Icons.home, color: Colors.white),
      // leading: Image.asset(
      //   item.icon ?? "",
      //   height: 28,
      //   width: 28,
      // ),
      title: Text(
        item.menuName!,
        style: TextStyle(
          color: Colors.white,
          fontSize: 12,
        ),
      ),
      // children: item.map((e) => Text(item[1].subMenuName!)).toList(),
      // onTap: () => _onSelected(i),
    );
  }

  ExpansionTile buildExpansionTile(DrawerModel item, int i) {
    return ExpansionTile(
        // trailing: Icon(Icons.ac_unit),
        collapsedIconColor: Colors.white,
        iconColor: Colors.white,
        backgroundColor: Theme.of(context).accentColor,
        textColor: Colors.orange,
        leading: Icon(Icons.home, color: Colors.white),
        // leading: Image.asset(
        //   item.icon ?? "",
        //   height: 28,
        //   width: 28,
        // ),
        title: Text(
          item.menuName!,
          style: TextStyle(
            color: Colors.white,
            fontSize: 12,
          ),
        ),
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: item.subMenu!.length,
              itemBuilder: (context, i) {
                return Container(
                  // margin: const EdgeInsets.symmetric(vertical: 5),
                  // padding: const EdgeInsets.only(left: 50),
                  // color: Colors.white70,
                  child: ListTile(
                    // tileColor: Colors.white70,
                    leading: Icon(Icons.home, color: Colors.white70),
                    title: Text(
                      item.subMenu![i].subMenuName!,
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 12,
                      ),
                    ),
                    onTap: () => _onSelected(i),
                  ),
                );
              },
            ),
          ),
        ]
        // onTap: () => _onSelected(i),
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

// MediaQuery.removePadding(
//                 context: context,
//                 removeTop: true,
//                 child: Expanded(
//                   child: ListView.builder(
//                       shrinkWrap: true,
//                       physics: AlwaysScrollableScrollPhysics(),
//                       itemCount: drawerItem!.length,
//                       // separatorBuilder: (BuildContext context, int index) =>
//                       //     buildDivider(),
//                       itemBuilder: (context, i) {
//                         // var count = drawerItem
//                         //     .where((e) => e.menuID == "2")
//                         //     .toList()
//                         //     .length;
//                         // print("count - $count");
//                         if (drawerItem[i] != drawerItem.first) {
//                           if (drawerItem[i].menuID !=
//                               drawerItem[i - 1].menuID) {
//                             return buildListTile(drawerItem, i);
//                           } else {
//                             return buildExpansionTile(drawerItem, i);
//                           }
//                         } else {
//                           return buildListTile(drawerItem, i);
//                         }
//                       }),
//                 ),
//               ),
