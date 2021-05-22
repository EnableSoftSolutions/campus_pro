import 'dart:convert';

import 'package:campus_pro/src/CONSTANTS/stringConstants.dart';
import 'package:campus_pro/src/DATA/userUtils.dart';
import 'package:http/http.dart' as http;

import '../../UTILS/apiEndPoints.dart';

class GetUserTokenApi {
  Future<String> getUserToken(Map<String, String> tokenData) async {
    print("tokenData before API: $tokenData");
    try {
      http.Response response = await http.post(
        Uri.parse(Api.getUserToken),
        body: tokenData,
        headers: headers,
        encoding: encoding,
      );

      print("token API Status Code: ${response.statusCode}");
      print("token API Body: ${response.body}");

      if (response.statusCode == 500) {
        throw SOMETHING_WENT_WRONG;
      }

      Map<String, dynamic> respMap = json.decode(response.body);
      print("token Response from API: $respMap");

      if (response.statusCode == 200) {
        if (respMap['Data'] != []) {
          final token = respMap['Data'][0]['Token'] as String;
          return token;
        }
      }

      throw respMap['message'] as String;
    } catch (e) {
      print("ERROR ON USER TOKEN API: $e");
      throw "$e";
    }
  }
}
