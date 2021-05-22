import 'dart:convert';
import 'package:campus_pro/src/CONSTANTS/stringConstants.dart';
import 'package:campus_pro/src/DATA/MODELS/studentInfoModel.dart';
import 'package:http/http.dart' as http;
import '../../UTILS/apiEndPoints.dart';

class StudentInfoApi {
  Future<StudentInfoModel> getStudentInfo(
      Map<String, String> studentData) async {
    print("StudentInfo data before API: $studentData");
    try {
      http.Response response = await http.post(
        Uri.parse(Api.studentInfoApi),
        body: studentData,
        headers: headers,
        encoding: encoding,
      );

      print("GET OUR StudentInfo DATA: ${response.statusCode}");
      print("GET OUR StudentInfo BODY: ${response.body}");

      if (response.statusCode == 500) {
        throw SOMETHING_WENT_WRONG;
      }

      if (response.statusCode == 401) {
        throw UNAUTHORIZED_USER;
      }

      Map<String, dynamic> respMap = json.decode(response.body);
      print("StudentInfo Response from API: $respMap");
      if (response.statusCode == 200) {
        final studentInfoData = StudentInfoModel.fromJson(respMap["Data"][0]);
        // final studentInfoData = (respMap["Data"] as List).map((e) => StudentInfoModel.fromJson(e)).toList();
        return studentInfoData;
      }

      throw SOMETHING_WENT_WRONG;
    } catch (e) {
      print("ERROR ON StudentInfo API: $e");
      throw "$e";
    }
  }
}
