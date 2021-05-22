import 'package:campus_pro/src/CONSTANTS/themeData.dart';
import 'package:campus_pro/src/UI/PAGES/signInPage.dart';
import 'package:campus_pro/src/UI/PAGES/userType.dart';
import 'package:campus_pro/src/UTILS/appImages.dart';
import 'package:campus_pro/src/DATA/userUtils.dart';
import 'package:flutter/material.dart';

import 'homePage.dart';
import 'signInPage.dart';

class SplashScreen extends StatefulWidget {
  static const routeName = "/splash-screen";
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    checkUserLogin();
    super.initState();
  }

  checkUserLogin() async {
    final uid = await UserUtils.idFromCache();
    final loginToken = await UserUtils.loginTokenFromCache();
    print("uid $uid");
    print("loginToken $loginToken");
    // Future.delayed(Duration(seconds: 3)).then((value) {
    //   Navigator.pushNamedAndRemoveUntil(
    //       context, HomePage.routeName, (route) => false);
    // });
    Future.delayed(Duration(seconds: 3)).then((value) {
      if (uid != null && loginToken != null) {
        print("UserTypeList");
        Navigator.pushNamedAndRemoveUntil(
            context, UserType.routeName, (route) => false);
      } else {
        print("SignInPage");
        Navigator.pushNamedAndRemoveUntil(
            context, SignInPage.routeName, (route) => false);
      }
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
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                AppImages.logo,
                width: MediaQuery.of(context).size.width - 200,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
                child: Text(
                  "Welcome To CampusPro",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 18),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
