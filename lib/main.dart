import 'package:bot_toast/bot_toast.dart';
import 'package:campus_pro/src/CONSTANTS/themeData.dart';
import 'package:campus_pro/src/UI/PAGES/splashScreen.dart';
import 'package:campus_pro/src/appRouter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: BotToastInit(),
      navigatorObservers: [BotToastNavigatorObserver()],
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: "SourceSansPro",
        // primarySwatch: MaterialColor(),
        primaryColor: primaryColor,
        accentColor: accentColor,
        textTheme: TextTheme(
          headline1: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
              color: Color(0xff313131)),
          headline2: TextStyle(fontSize: 14.0, color: Color(0xff345FB4)),
          bodyText1: TextStyle(fontSize: 10.0, color: Color(0xffCFCFCF)),
        ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: SplashScreen(),
      onGenerateRoute: AppRoutes.generateRoute,
    );
  }
}

//app wide scope.
globalBlocProviders() {}
