import 'dart:convert';

import 'package:campus_pro/src/CONSTANTS/stringConstants.dart';
import 'package:http/http.dart' as http;
import 'package:campus_pro/src/DATA/MODELS/drawerModel.dart';

import '../../UTILS/apiEndPoints.dart';

class DrawerApi {
  Future<List<DrawerModel>> getDrawerItems(
      Map<String, String> drawerData) async {
    print("drawerData before API: $drawerData");
    try {
      http.Response response = await http.post(
        Uri.parse(Api.drawerApi),
        body: drawerData,
        headers: headers,
        encoding: encoding,
      );

      print("Drawer API Status Code: ${response.statusCode}");
      print("Drawer API Body: ${response.body}");

      if (response.statusCode == 500) {
        throw SOMETHING_WENT_WRONG;
      }

      if (response.statusCode == 401) {
        throw UNAUTHORIZED_USER;
      }

      Map<String, dynamic> respMap = json.decode(response.body);
      // if (response.statusCode == 200) {
      print("Drawer Response from API: $respMap");

      if (response.statusCode == 200) {
        // if (respMap['Data'] != []) {
        final drawerItems = (respMap['Data'] as List)
            .map((e) => DrawerModel.fromJson(e))
            .toList();
        print("drawerItems[3] from API: ${respMap['Data'][2]}");
        return drawerItems;
        // }
      }

      throw respMap['message'] as String;
    } catch (e) {
      print("ERROR ON DRAWER API: $e");
      throw "$e";
    }
  }
}
