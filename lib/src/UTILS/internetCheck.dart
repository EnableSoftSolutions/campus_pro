import 'dart:io';

import 'package:connectivity/connectivity.dart';

Future<bool> isInternetPresent() async {
  try {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile) {
      print("Connected to Mobile Network");
      return true;
    } else if (connectivityResult == ConnectivityResult.wifi) {
      print("Connected to WiFi");
      return true;
    } else {
      print("Unable to connect. Please Check Internet Connection");
      return false;
    }
  } on SocketException catch (_) {
//print('not connected');
    return false;
  }
}
