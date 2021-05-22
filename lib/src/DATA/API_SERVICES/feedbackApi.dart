import 'dart:convert';

import 'package:campus_pro/src/CONSTANTS/stringConstants.dart';
import 'package:campus_pro/src/DATA/MODELS/feedbackModel.dart';
import 'package:http/http.dart' as http;


import '../../UTILS/apiEndPoints.dart';

class FeedBackApi {
  Future<FeedBackModel> feedBackData(Map<String, String> feedBackData) async {
    print("feedBackData before API: $feedBackData");
    try {
      http.Response response = await http.post(
        Uri.parse(Api.feedBackApi),
        body: feedBackData,
        headers: headers,
        encoding: encoding,
      );

      print("feedBackData API Status Code: ${response.statusCode}");
      print("feedBackData API Body: ${response.body}");

      if (response.statusCode == 500) {
        throw SOMETHING_WENT_WRONG;
      }

      Map<String, dynamic> respMap = json.decode(response.body[0]);
      print("feedBackData Response from API: $respMap");
      String status = respMap['Validated'] as String;
      if (status.toUpperCase() == "Y") {
        // final feedBackData = FeedBackModel.fromJson(respMap);
        // return feedBackData;
      }
      throw respMap['message'] as String;
    } catch (e) {
      print("ERROR ON LOGIN API: $e");
      throw "$e";
    }
  }
}
