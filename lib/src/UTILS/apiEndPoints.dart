import 'dart:convert';

class Api {
  //private constructor will restrict creating API objects.
  Api._();
  static const baseUrl = "https://mobileweb.eiterp.com/api/";
  static const loginApi = baseUrl + "AutheticateLogin";

  //Drawer API - 19 May 2021 [Priyanshi]
  static const drawerApi = baseUrl + "Managemenu";
  // OLD - static const drawerApi = baseUrl + "GetAssignMenu";

  static const userTypeApi = baseUrl + "GetOurSchools";
  static const feedBackApi = baseUrl + "";

  //Dashboard APIs
  static const studentInfoApi = baseUrl + "getStuIfo";
  static const homeCategorysApi = baseUrl + "";
  static const todayMeetingsApi = baseUrl + "getClassRoomSnew";

  static const viewProfileApi = baseUrl + "getStuProfile";

  static const examDateSheetApi = baseUrl + "";

  static const saveFcmToken = baseUrl + "";
  static const getUserToken = baseUrl + "UpdateLastActive_fcmtokenwebnew";
}

//Api Header Global Variable
final Map<String, String> headers = {
  "Accept": "application/json",
  "Content-Type": "application/x-www-form-urlencoded"
};

//Api Encoding Global Variable
final Encoding? encoding = Encoding.getByName("utf-8");
