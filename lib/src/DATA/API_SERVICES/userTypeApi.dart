import 'dart:convert';
import 'package:campus_pro/src/CONSTANTS/stringConstants.dart';
import 'package:campus_pro/src/DATA/MODELS/userTypeModel.dart';
import 'package:http/http.dart' as http;
import '../../UTILS/apiEndPoints.dart';

class UserTypeApi {
  Future<List<UserTypeModel>> getUserType(
      Map<String, String> userTypeData) async {
    print("userType data before API: $userTypeData");
    try {
      http.Response response = await http.post(
        Uri.parse(Api.userTypeApi),
        body: userTypeData,
        headers: headers,
        encoding: encoding,
      );

      print("GET OUR SCHOOL DATA: ${response.statusCode}");
      print("GET OUR SCHOOL BODY: ${response.body}");

      if (response.statusCode == 500) {
        throw SOMETHING_WENT_WRONG;
      }

      Map<String, dynamic> respMap = json.decode(response.body);
      print("User Response Response from API: $respMap");
      final userType = (respMap["Data"] as List)
          .map((e) => UserTypeModel.fromJson(e))
          .toList();
      print("userType[1].schoolName on API: ${userType[1].stuEmpName}");
      // final getSchoolData = GetOurSchoolModel.fromJson(respMap);
      print("");
      return userType;
    } catch (e) {
      print("ERROR ON USER TYPE API: $e");
      throw "$e";
    }
  }
}
