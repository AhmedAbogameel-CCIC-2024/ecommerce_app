import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../models/logged_user.dart';

class CachingUtils {
  static const String _userCachingKey = 'user';
  static late SharedPreferences _prefs;

  static Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static Future<void> cacheUser(Map<String, dynamic> value) async {
    await _prefs.setString(_userCachingKey, jsonEncode(value));
  }

  static LoggedUser? get user {
    if (_prefs.containsKey(_userCachingKey)) {
      return LoggedUser.fromJson(jsonDecode(_prefs.getString(_userCachingKey)!));
    }
    return null;
  }

  static bool get isLogged => user != null;

  static Future<void> clearCache() async {
    await _prefs.remove(_userCachingKey);
  }
}