// @dart=2.9
import 'package:bot_toast/bot_toast.dart';
import 'package:campus_pro/src/CONSTANTS/themeData.dart';
import 'package:campus_pro/src/DATA/API_SERVICES/studentInfoApi.dart';
import 'package:campus_pro/src/DATA/API_SERVICES/userTypeApi.dart';
import 'package:campus_pro/src/DATA/BLOC_CUBIT/SIGN_IN_CUBIT/sign_in_cubit.dart';
import 'package:campus_pro/src/DATA/BLOC_CUBIT/GET_USER_TOKEN_CUBIT/get_user_token_cubit.dart';
import 'package:campus_pro/src/DATA/BLOC_CUBIT/DRAWER_CUBIT/drawer_cubit.dart';
import 'package:campus_pro/src/DATA/API_SERVICES/signInApi.dart';
import 'package:campus_pro/src/DATA/API_SERVICES/getUserTokenApi.dart';
import 'package:campus_pro/src/DATA/API_SERVICES/drawerApi.dart';
import 'package:campus_pro/src/DATA/BLOC_CUBIT/STUDENT_INFO_CUBIT/student_info_cubit.dart';
import 'package:campus_pro/src/DATA/REPOSITORIES/studentInfoRepository.dart';
import 'package:campus_pro/src/DATA/REPOSITORIES/userTypeRepository.dart';
import 'package:campus_pro/src/DATA/REPOSITORIES/signInRepository.dart';
import 'package:campus_pro/src/DATA/REPOSITORIES/getUserTokenRepository.dart';
import 'package:campus_pro/src/DATA/REPOSITORIES/drawerRepository.dart';
import 'package:campus_pro/src/UI/WIDGETS/charts.dart';
import 'package:campus_pro/src/UTILS/pushNotification.dart';
import 'package:campus_pro/src/UI/PAGES/circular.dart';
import 'package:campus_pro/src/UI/PAGES/classRooms.dart';
import 'package:campus_pro/src/UI/PAGES/homeWork.dart';
import 'package:campus_pro/src/UI/PAGES/viewProfile.dart';
import 'package:campus_pro/src/UI/PAGES/splashScreen.dart';
import 'package:campus_pro/src/appRouter.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import 'src/DATA/BLOC_CUBIT/USER_TYPE_CUBIT/user_type_cubit.dart';
import 'src/UI/PAGES/attendance.dart';
import 'src/UI/PAGES/feePayment.dart';
import 'src/UI/PAGES/homePage.dart';
import 'src/UI/PAGES/splashScreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await PushNotification().initialise();

  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String token;

  @override
  void initState() {
    super.initState();
    initializeNotification();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: globalBlocProviders(),
      child: MaterialApp(
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
        // home: GroupedBarChart(),
        onGenerateRoute: AppRoutes.generateRoute,
      ),
    );
  }
}

//app wide scope.
globalBlocProviders() {
  return [
    BlocProvider(create: (_) => DrawerCubit(DrawerRepository(DrawerApi()))),
    BlocProvider(create: (_) => SignInCubit(SignInRepository(SignInApi()))),
    BlocProvider(
        create: (_) => UserTypeCubit(UserTypeRepository(UserTypeApi()))),
    BlocProvider(
        create: (_) =>
            GetUserTokenCubit(GetUserTokenRepository(GetUserTokenApi()))),
    BlocProvider(
        create: (_) =>
            StudentInfoCubit(StudentInfoRepository(StudentInfoApi()))),
  ];
}
