import 'package:campus_pro/src/DATA/MODELS/studentInfoModel.dart';
import 'package:campus_pro/src/DATA/userUtils.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:campus_pro/src/CONSTANTS/themeData.dart';
import 'package:campus_pro/src/DATA/BLOC_CUBIT/STUDENT_INFO_CUBIT/student_info_cubit.dart';
import 'package:campus_pro/src/DATA/MODELS/dummyData.dart';
import 'package:campus_pro/src/UI/PAGES/attendance.dart';
import 'package:campus_pro/src/UI/WIDGETS/drawerWidget.dart';
import 'package:campus_pro/src/UI/PAGES/feePayment.dart';
import 'package:flutter/material.dart';

import '../../UTILS/appImages.dart';
import '../../UTILS/appImages.dart';
import 'attendance.dart';
import 'classRooms.dart';
import 'feePayment.dart';
import 'homeWork.dart';
import 'notification.dart';
import 'userType.dart';
import 'viewProfile.dart';

class HomePage extends StatefulWidget {
  static const routeName = "/home-page";

  const HomePage({Key? key}) : super(key: key);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    getDashboardData();
    super.initState();
  }

  getDashboardData() async {
    final uid = await UserUtils.idFromCache();
    final userToken = await UserUtils.userTokenFromCache();
    final userData = await UserUtils.userTypeFromCache();
    final studentData = {
      "OUserId": uid!,
      "Token": userToken!,
      "OrgId": userData!.organizationId!,
      "Schoolid": userData.schoolId!,
      "StudentId": userData.stuEmpId!,
      "SessionId": userData.currentSessionid!,
    };
    context.read<StudentInfoCubit>().studentInfoCubitCall(studentData);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: customGradient,
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        drawer: DrawerWidget(),
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          actions: [
            IconButton(
              onPressed: () {
                Navigator.pushNamedAndRemoveUntil(
                    context, UserType.routeName, (route) => false);
              },
              icon: Container(
                height: 28,
                width: 28,
                child: Image.asset(AppImages.switchUser,
                    fit: BoxFit.cover, color: Colors.white),
              ),
            ),
          ],
        ),
        body: ListView(
          children: [
            BlocBuilder<StudentInfoCubit, StudentInfoState>(
              builder: (context, state) {
                if (state is StudentInfoLoadSuccess) {
                  return buildIdentityCard(studentInfo: state.studentInfoData);
                } else if (state is StudentInfoLoadFail) {
                  return Text(state.failReason);
                } else {
                  return LinearProgressIndicator();
                }
              },
            ),
            buildHomeCategorys(),
            Container(
              color: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 8.0, vertical: 8.0),
                    child: Text(
                      "Announcement",
                      style: Theme.of(context).textTheme.headline1,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
                    decoration: BoxDecoration(
                      border: Border(
                        left: BorderSide(
                            width: 8.0, color: Theme.of(context).primaryColor),
                      ),
                    ),
                    child: ListTile(
                      title: Text("Tommorrow is holiday"),
                      subtitle: Text("June 9, 2021"),
                      trailing: Icon(Icons.arrow_forward_ios_outlined),
                    ),
                  ),
                ],
              ),
            ),
            buildTodayMeetings(context),
            Container(
              height: 20.0,
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }

  Container buildIdentityCard({StudentInfoModel? studentInfo}) {
    return Container(
      padding: const EdgeInsets.only(bottom: 20),
      child: Stack(
        children: [
          ListTile(
            title: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: RichText(
                overflow: TextOverflow.ellipsis,
                text: TextSpan(
                  text: "Hi ",
                  style: TextStyle(color: Colors.white, fontSize: 30),
                  children: <TextSpan>[
                    TextSpan(
                      text: studentInfo!.stName,
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.w700),
                      // recognizer: TapGestureRecognizer()..onTap = () {},
                    ),
                  ],
                ),
              ),
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: TextSpan(
                    text: "Class " + studentInfo.compClass!.split(" ").join(),
                    style: TextStyle(color: Color(0xffFFFFFF), fontSize: 18),
                    children: <TextSpan>[
                      TextSpan(
                        text: " | ",
                        style:
                            TextStyle(color: Color(0xffFFFFFF), fontSize: 18),
                        children: <TextSpan>[
                          TextSpan(
                            text: "Adm no: " + studentInfo.admNo!,
                            style: TextStyle(
                                color: Color(0xffFFFFFF), fontSize: 18),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10.0),
                Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 8.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(18.0),
                  ),
                  child: RichText(
                    text: TextSpan(
                      text: "Today's Attendance: ",
                      style: TextStyle(
                          color: Theme.of(context).primaryColor, fontSize: 18),
                      children: <TextSpan>[
                        TextSpan(
                          text: studentInfo.attStatus!.toUpperCase() == "A"
                              ? "Absent"
                              : studentInfo.attStatus!.toUpperCase() == "P"
                                  ? "Present"
                                  : "Not Marked",
                          style: TextStyle(
                            color: studentInfo.attStatus!.toUpperCase() == "A"
                                ? Colors.red
                                : studentInfo.attStatus!.toUpperCase() == "P"
                                    ? Colors.green
                                    : Colors.black,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            right: 16.0,
            top: 12.0,
            child: InkWell(
              onTap: () {
                Navigator.pushNamed(context, ViewProfile.routeName);
              },
              child: CircleAvatar(
                backgroundColor: Colors.white,
                radius: 38,
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 36,
                  backgroundImage: AssetImage(AppImages.logo),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Container buildHomeCategorys() {
    return Container(
      padding: const EdgeInsets.all(16.0),
      color: Colors.white,
      child: GridView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: categoryList.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: 1.5,
        ),
        itemBuilder: (context, i) {
          var item = categoryList[i];
          return InkWell(
            onTap: () {
              if (i == 0)
                Navigator.pushNamed(context, FeePayment.routeName);
              else if (i == 1)
                Navigator.pushNamed(context, Attendance.routeName);
              else if (i == 2)
                Navigator.pushNamed(context, NotificationPage.routeName);
              else if (i == 3)
                Navigator.pushNamed(context, ClassRooms.routeName);
              else if (i == 5)
                Navigator.pushNamed(context, HomeWork.routeName);
              else
                null;
            },
            child: Container(
              margin: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                color: Color(0xffF5F6FC),
                borderRadius: BorderRadius.circular(8.0),
                image: DecorationImage(
                    image: AssetImage(item.image ?? AppImages.logo),
                    fit: BoxFit.cover),
              ),
              child: Container(
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor.withOpacity(0.8),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Center(
                  child: Text(
                    item.title ?? "",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Container buildTodayMeetings(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
            child: Text(
              "Today's Meetings",
              style: Theme.of(context).textTheme.headline1,
            ),
          ),
          ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: categoryList.length,
            itemBuilder: (context, i) {
              var item = categoryList[i];
              return Container(
                margin: const EdgeInsets.all(8.0),
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                decoration: BoxDecoration(
                  border: Border.all(color: Color(0xffE1E3E8)),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Stack(
                  children: [
                    ListTile(
                      leading: Container(
                        color: Theme.of(context).primaryColor,
                        padding: const EdgeInsets.symmetric(
                            vertical: 8.0, horizontal: 16.0),
                        child: Text(
                          "${i + 1}",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      title: Text(
                        "Teacher",
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Subject",
                            style: TextStyle(fontSize: 12.0),
                          ),
                          Text(
                            "Meeting Details",
                            style: TextStyle(fontSize: 12.0),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      right: 16,
                      top: 16,
                      child: Column(
                        children: [
                          Icon(
                            Icons.videocam,
                            color: Theme.of(context).primaryColor,
                          ),
                          Text("Join",
                              textScaleFactor: 1.0,
                              style: TextStyle(
                                  fontSize: 16.0,
                                  color: Theme.of(context).primaryColor)),
                        ],
                      ),
                    )
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

// child: SingleChildScrollView(
//   child: Container(
//     margin: const EdgeInsets.only(top: 300),
//     padding: const EdgeInsets.only(
//       left: 10.0,
//       right: 10.0,
//       // top: 160.0,
//       bottom: 10.0,
//     ),
//     decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.only(
//           topLeft: Radius.circular(40.0),
//           topRight: Radius.circular(40.0),
//         )),
//     child: GridView.builder(
//       shrinkWrap: true,
//       physics: NeverScrollableScrollPhysics(),
//       itemCount: categoryList.length,
//       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//         crossAxisCount: 3,
//         childAspectRatio: 1.5,
//       ),
//       itemBuilder: (context, i) {
//         return Container(
//           margin: const EdgeInsets.all(8.0),
//           decoration: BoxDecoration(
//               color: Color(0xffF5F6FC),
//               borderRadius: BorderRadius.circular(16.0)),
//         );
//       },
//     ),
//   ),
// ),
