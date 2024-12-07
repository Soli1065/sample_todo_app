// widgets/theme_switch.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/theme_notifier.dart';

class ThemeSwitch extends StatelessWidget {
  const ThemeSwitch({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        final themeNotifier = ref.watch(themeNotifierProvider);

        return Switch(
          value: themeNotifier == ThemeMode.dark,
          onChanged: (value) {
            ref.read(themeNotifierProvider.notifier).toggleTheme();
          },
          activeTrackColor: Colors.lightBlueAccent,
          activeColor: Colors.blue,
        );
      },
    );
  }
}