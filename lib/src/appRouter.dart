import 'package:campus_pro/src/UI/PAGES/attendance.dart';
import 'package:campus_pro/src/UI/PAGES/classRooms.dart';
import 'package:campus_pro/src/UI/PAGES/examDateSheet.dart';
import 'package:campus_pro/src/UI/PAGES/homePage.dart';
import 'package:campus_pro/src/UI/PAGES/homeWork.dart';
import 'package:campus_pro/src/UI/PAGES/markSheet.dart';
import 'package:campus_pro/src/UI/PAGES/meetingStatus.dart';
import 'package:campus_pro/src/UI/PAGES/payByCheque.dart';
import 'package:campus_pro/src/UI/PAGES/signInPage.dart';
import 'package:campus_pro/src/UI/PAGES/splashScreen.dart';
import 'package:campus_pro/src/UI/PAGES/feePayment.dart';
import 'package:campus_pro/src/UI/PAGES/testResult.dart';
import 'package:campus_pro/src/UI/PAGES/userType.dart';
import 'package:campus_pro/src/UI/PAGES/viewProfile.dart';
import 'package:flutter/material.dart';

import 'UI/PAGES/changePassword.dart';
import 'UI/PAGES/feedBackPage.dart';
import 'UI/PAGES/notification.dart';

_page(Widget page) {
  return MaterialPageRoute(builder: (_) => page);
}

class AppRoutes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case SplashScreen.routeName:
        return _page(
          SplashScreen(),
        );
      case SignInPage.routeName:
        return _page(
          SignInPage(),
        );
      case HomePage.routeName:
        return _page(
          HomePage(),
        );
      case FeePayment.routeName:
        return _page(
          FeePayment(),
        );
      case Attendance.routeName:
        return _page(
          Attendance(),
        );
      case PayByCheque.routeName:
        return _page(
          PayByCheque(),
        );
      case UserType.routeName:
        return _page(
          UserType(),
        );
      case ViewProfile.routeName:
        return _page(
          ViewProfile(),
        );
      case HomeWork.routeName:
        return _page(
          HomeWork(),
        );
      case ClassRooms.routeName:
        return _page(
          ClassRooms(),
        );
      case NotificationPage.routeName:
        return _page(
          NotificationPage(),
        );
      case ChangePasswordPage.routeName:
        return _page(
          ChangePasswordPage(),
        );
      case FeedBack.routeName:
        return _page(
          FeedBack(),
        );
      case DateSheet.routeName:
        return _page(
          DateSheet(),
        );
      case MeetingStatus.routeName:
        return _page(
          MeetingStatus(),
        );
      case MarkSheet.routeName:
        return _page(
          MarkSheet(),
        );
      case TestResult.routeName:
        return _page(
          TestResult(),
        );
      default:
        return _page(SplashScreen());
    }
  }
}
