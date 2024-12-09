import 'package:shared_preferences/shared_preferences.dart';

class ThemeModel {
  static const String _themeKey = 'theme';
  final SharedPreferences _prefs;

  ThemeModel(SharedPreferences prefs) : _prefs = prefs;

  Future<bool> isDarkMode() async {
    return _prefs.getBool(_themeKey) ?? false; // Defaults to light mode
  }

  Future<void> setDarkMode(bool isDark) async {
    await _prefs.setBool(_themeKey, isDark);
  }
}