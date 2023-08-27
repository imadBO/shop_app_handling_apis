import 'package:shared_preferences/shared_preferences.dart';

class CachedHelper{
  static SharedPreferences? prefs;
  static Future<void> init() async {
    prefs = await SharedPreferences.getInstance();
  }

  static Future<bool> putData(String key, dynamic value) async {
    if (value is String) return await prefs!.setString(key, value);
    if (value is bool) return await prefs!.setBool(key, value);
    if (value is int) return await prefs!.setInt(key, value);
    return await prefs!.setDouble(key, value);
  }

  static dynamic getData(String key){
    return prefs!.get(key);
  }

  static Future<bool> deleteData(String key){
    return prefs!.remove(key);
  }
}