import 'package:shared_preferences/shared_preferences.dart';

class UserUtils {
  UserUtils._();

  static Future<String> idFromCache() async {
    try {
      SharedPreferences pref = await SharedPreferences.getInstance();
      String uid = pref.getString("uid");
      return uid;
    } catch (e) {
      print("error on [idFromCache] :- $e ");
      return null;
    }
  }

  static Future<void> cacheId(String id) async {
    try {
      SharedPreferences pref = await SharedPreferences.getInstance();
      pref.setString("uid", id);
    } catch (e) {
      print("error on [cacheIdFromCache] :- $e ");
    }
  }

  static Future<void> logout() async {
    try {
      SharedPreferences pref = await SharedPreferences.getInstance();
      await pref.clear();
    } catch (e) {
      print("error on [logoutFromCache] :- $e ");
    }
  }
}
