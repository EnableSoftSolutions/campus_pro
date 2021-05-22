import 'dart:convert';

import 'package:campus_pro/src/DATA/MODELS/signInModel.dart';
import 'package:campus_pro/src/DATA/MODELS/userTypeModel.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserUtils {
  UserUtils._();

  // static Future<void> cacheData(SignInModel loginData) async {
  //   try {
  //     SharedPreferences pref = await SharedPreferences.getInstance();
  //     pref.setString("loginData", jsonEncode(loginData.toJson()));
  //     await cacheId(loginData.oUserid);
  //     await cacheToken(loginData.token);
  //     print("LoginData Cached!!!");
  //   } catch (e) {
  //     print("error on [cacheLoginData] :- $e ");
  //   }
  // }

  // static Future<SignInModel?> dataFromCache() async {
  //   try {
  //     SharedPreferences pref = await SharedPreferences.getInstance();
  //     String? data = pref.getString("loginData");
  //     SignInModel loginData = SignInModel.fromJson(jsonDecode(data.toString()));
  //     return loginData;
  //   } catch (e) {
  //     print("error on [dataFromCache] :- $e ");
  //     return null;
  //   }
  // }
  static Future<void> cacheUserTypeData(UserTypeModel userTypeData) async {
    try {
      SharedPreferences pref = await SharedPreferences.getInstance();
      pref.setString("User_Type_Data", jsonEncode(userTypeData.toJson()));
      print("userTypeData Cached!!!");
    } catch (e) {
      print("error on [cacheUserTypeData] :- $e ");
    }
  }

  static Future<UserTypeModel?> userTypeFromCache() async {
    try {
      SharedPreferences pref = await SharedPreferences.getInstance();
      String? data = pref.getString("User_Type_Data");
      UserTypeModel userTypeData =
          UserTypeModel.fromJson(jsonDecode(data.toString()));
      return userTypeData;
    } catch (e) {
      print("error on [userTypeFromCache] :- $e ");
      return null;
    }
  }

  static Future<void> removeUserType() async {
    try {
      SharedPreferences pref = await SharedPreferences.getInstance();
      await pref.remove("User_Type_Data");
      print("RemoveUserType Removed");
    } catch (e) {
      print("error on [removeUserType] :- $e ");
    }
  }

  static Future<void> cacheId(String? uid) async {
    try {
      SharedPreferences pref = await SharedPreferences.getInstance();
      pref.setString("uid", uid!);
      print("Id Cached");
    } catch (e) {
      print("error on [cacheId] :- $e ");
    }
  }

  static Future<String?> idFromCache() async {
    try {
      SharedPreferences pref = await SharedPreferences.getInstance();
      String? uid = pref.getString("uid");
      return uid;
    } catch (e) {
      print("error on [idFromCache] :- $e ");
      return null;
    }
  }

  static Future<void> cacheLoginToken(String? loginToken) async {
    try {
      SharedPreferences pref = await SharedPreferences.getInstance();
      pref.setString("Login_Token", loginToken!);
      print("LoginToken Cached");
    } catch (e) {
      print("error on [cacheLoginToken] :- $e ");
    }
  }

  static Future<String?> loginTokenFromCache() async {
    try {
      SharedPreferences pref = await SharedPreferences.getInstance();
      String? loginToken = pref.getString("Login_Token");
      return loginToken;
    } catch (e) {
      print("error on [loginTokenFromCache] :- $e ");
      return null;
    }
  }

  static Future<void> cacheUserToken(String? userToken) async {
    try {
      SharedPreferences pref = await SharedPreferences.getInstance();
      pref.setString("User_Token", userToken!);
      print("UserToken Cached");
    } catch (e) {
      print("error on [cacheUserToken] :- $e ");
    }
  }

  static Future<String?> userTokenFromCache() async {
    try {
      SharedPreferences pref = await SharedPreferences.getInstance();
      String? userToken = pref.getString("User_Token");
      return userToken;
    } catch (e) {
      print("error on [userTokenFromCache] :- $e ");
      return null;
    }
  }

  static Future<void> removeUserToken() async {
    try {
      SharedPreferences pref = await SharedPreferences.getInstance();
      await pref.remove("User_Token");
      print("UserToken Removed");
    } catch (e) {
      print("error on [removeUserToken] :- $e ");
    }
  }

  static Future<void> logout() async {
    try {
      SharedPreferences pref = await SharedPreferences.getInstance();
      await pref.clear();
      print("All Data Cleared");
    } catch (e) {
      print("error on [logout] :- $e ");
    }
  }
}
