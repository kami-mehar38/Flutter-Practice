import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';

class PreferencesManager {
  /// making the constructor private to avoid initialization
  PreferencesManager._privateConstructor();

  /// creating private instance of this class
  static final PreferencesManager _instance =
      PreferencesManager._privateConstructor();

  /// instance {get} returns the instance of PreferencesManager
  static PreferencesManager get instance {
    return _instance;
  }

  /// key for the name
  static const String _KEY_USER_NAME = "USER_NAME";

  /// gets the shared preferences instance
  Future<SharedPreferences> get _sharedPreferences {
    return SharedPreferences.getInstance();
  }

  /// This setter saves the name of the user
  /// * parameter
  ///   name: String value of user name
  Future<bool> setName(String name) async {
    final prefs = await _sharedPreferences;
    return prefs.setString(_KEY_USER_NAME, name) ;
  }

  /// This getter is returns the Future<String> for user name
  /// return @name
  Future<String> get name async {
    final prefs = await _sharedPreferences;
    return prefs.getString(_KEY_USER_NAME) ?? "";
  }

}
