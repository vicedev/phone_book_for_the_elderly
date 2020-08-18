import 'package:shared_preferences/shared_preferences.dart';

class SPUtils {
  static Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  static Future<void> save(String key, dynamic value) async {
    if (key == null || key.isEmpty) {
      return;
    }
    final SharedPreferences prefs = await _prefs;
    if (value is String) {
      prefs.setString(key, value);
    } else if (value is int) {
      prefs.setInt(key, value);
    } else if (value is bool) {
      prefs.setBool(key, value);
    } else if (value is double) {
      prefs.setDouble(key, value);
    } else if (value is List<String>) {
      prefs.setStringList(key, value);
    }
  }

  static Future<dynamic> get(String key) async {
    if (key == null || key.isEmpty) {
      return;
    }
    final SharedPreferences prefs = await _prefs;
    return prefs.get(key);
  }

  static Future<void> remove(String key) async {
    if (key == null || key.isEmpty) {
      return;
    }
    final SharedPreferences prefs = await _prefs;
    return prefs.get(key);
  }
}
