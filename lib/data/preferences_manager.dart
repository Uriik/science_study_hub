import 'package:shared_preferences/shared_preferences.dart';

class PreferencesManager {
  static const _keyLanguage = 'current_language';
  static const _keyModule = 'current_module';

  Future<String> getLanguage() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_keyLanguage) ?? 'en';
  }

  Future<void> setLanguage(String lang) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_keyLanguage, lang);
  }

  Future<int> getCurrentModule() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getInt(_keyModule) ?? 0;
  }

  Future<void> setCurrentModule(int index) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(_keyModule, index);
  }

  Future<void> clearAll() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }
}

