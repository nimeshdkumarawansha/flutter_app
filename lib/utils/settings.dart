import 'package:shared_preferences/shared_preferences.dart';

class Settings {
  static clearAll() async {
    final SharedPreferences sharedPrefs = await SharedPreferences.getInstance();
    await sharedPrefs.clear();
  }

  static Future<bool?> getIsFirstSession() async {
    final SharedPreferences sharedPrefs = await SharedPreferences.getInstance();
    bool? token = sharedPrefs.getBool("session");
    return token;
  }

  static setIsFirstSession(bool session) async {
    final SharedPreferences sharedPrefs = await SharedPreferences.getInstance();
    sharedPrefs.setBool("session", session);
  }

  static setIsGuest(bool isGuest) async {
    final SharedPreferences sharedPrefs = await SharedPreferences.getInstance();
    sharedPrefs.setBool("guest", isGuest);
  }

  static Future<bool?> getIsGuest() async {
    final SharedPreferences sharedPrefs = await SharedPreferences.getInstance();
    bool? token = sharedPrefs.getBool("guest");
    return token;
  }

  static setAccessToken(String token) async {
    final SharedPreferences sharedPrefs = await SharedPreferences.getInstance();
    sharedPrefs.setString("access_token", token);
  }

  static Future<String?> getAccessToken() async {
    final SharedPreferences sharedPrefs = await SharedPreferences.getInstance();
    String? token = sharedPrefs.getString("access_token");
    return token;
  }
}
