import 'package:riverpod/riverpod.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../data/shared_preferences_service.dart';

class ThemeNotifier extends StateNotifier<ThemeMode> {
  final SharedPreferencesService _sharedPreferencesService;

  ThemeNotifier(this._sharedPreferencesService) : super(ThemeMode.light) {
    _initializeTheme();
  }

  Future<void> _initializeTheme() async {
    final isDark = await _sharedPreferencesService.isDarkMode();
    state = isDark ? ThemeMode.dark : ThemeMode.light;
  }

  Future<void> toggleTheme() async {
    final newMode = state == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    state = newMode;
    await _sharedPreferencesService.setDarkMode(newMode == ThemeMode.dark);
  }
}

final themeNotifierProvider = StateNotifierProvider<ThemeNotifier, ThemeMode>((ref) {
  return ThemeNotifier(ref.read(sharedPreferencesServiceProvider));
});


final sharedPreferencesProvider = Provider<SharedPreferences>((ref) {
  return SharedPreferences.getInstance() as SharedPreferences;
});