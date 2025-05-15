import 'package:shared_preferences/shared_preferences.dart';

const String USER_ACCESS_TOKEN = "AFFRICAST_ACCESS_TOKEN";

class UserSharedPref {
  static Future<void> setAccessToken({String? uid}) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString(USER_ACCESS_TOKEN, uid!);
  }

  static Future<String?> getAccessToken() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getString(USER_ACCESS_TOKEN);
  }

  static Future<void> removeAccessToken() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.remove(USER_ACCESS_TOKEN);
  }
}
