import 'dart:convert';

import 'package:campus_pro/src/CONSTANTS/stringConstants.dart';
import 'package:campus_pro/src/DATA/userUtils.dart';
import 'package:http/http.dart' as http;
import 'package:campus_pro/src/DATA/MODELS/signInModel.dart';

import '../../UTILS/apiEndPoints.dart';

class SignInApi {
  Future<bool> checkUserData(Map<String, String> loginData) async {
    print("loginData before API: $loginData");
    try {
      http.Response response = await http.post(
        Uri.parse(Api.loginApi),
        body: loginData,
        headers: headers,
        encoding: encoding,
      );

      print("Login API Status Code: ${response.statusCode}");
      print("Login API Body: ${response.body}");

      if (response.statusCode == 500) {
        throw SOMETHING_WENT_WRONG;
      }

      Map<String, dynamic> respMap = json.decode(response.body);
      print("Login Response from API: $respMap");
      String status = respMap['Data'][0]['Validated'] as String;
      if (status.toUpperCase() == "Y") {
        String uid = respMap['Data'][0]['OUserid'] as String;
        String loginToken = respMap['Data'][0]['Token'] as String;
        await UserUtils.cacheId(uid);
        await UserUtils.cacheLoginToken(loginToken);
        return true;
        // final signupData = SignInModel.fromJson(respMap['Data'][0]);
        // return signupData;
      }

      if (status.toUpperCase() == "N") {
        throw respMap['Data'][0]['ValidateMessage'] as String;
      }

      throw respMap['message'] as String;
    } catch (e) {
      print("ERROR ON LOGIN API: $e");
      throw "$e";
    }
  }
}
