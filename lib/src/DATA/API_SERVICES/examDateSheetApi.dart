import 'dart:convert';
import 'package:campus_pro/src/CONSTANTS/stringConstants.dart';
import 'package:campus_pro/src/DATA/MODELS/examDateSheetModel.dart';

import 'package:http/http.dart' as http;
import '../../UTILS/apiEndPoints.dart';

class ExamDateSheetApi {
  Future<List<DateSheetModel>> getDateSheet(
      Map<String, String> dateSheetRequest) async {
    print("GetOurSchool before API: $dateSheetRequest");
    try {
      http.Response response = await http.post(
        Uri.parse(Api.examDateSheetApi),
        body: dateSheetRequest,
        headers: headers,
        encoding: encoding,
      );

      print("GET OUR SCHOOL DATA: ${response.statusCode}");
      print("GET OUR SCHOOL BODY: ${response.body}");

      if (response.statusCode == 500) {
        throw SOMETHING_WENT_WRONG;
      }

      Map<String, dynamic> respMap = json.decode(response.body);
      print("GET OUR SCHOOL Response from API: $respMap");
      final dateSheetData=null;
      // = (respMap["Data"] as List)
      //     .map((e) => DateSheetModel.fromJson(e))
      //     .toList();
     
      return dateSheetData;
    } catch (e) {
      print("ERROR ON GET OUR SCHOOL API: $e");
      throw "$e";
    }
  }
}