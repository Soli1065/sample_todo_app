import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../theme/theme_model.dart';
import '../theme/theme_notifier.dart';

class SharedPreferencesService {
  final ThemeModel _themeModel;

  SharedPreferencesService(SharedPreferences prefs) : _themeModel = ThemeModel(prefs);

  Future<bool> isDarkMode() => _themeModel.isDarkMode();

  Future<void> setDarkMode(bool isDark) => _themeModel.setDarkMode(isDark);
}

final sharedPreferencesServiceProvider = Provider<SharedPreferencesService>((ref) {
  final prefs = ref.watch(sharedPreferencesProvider);
  return SharedPreferencesService(prefs);
});