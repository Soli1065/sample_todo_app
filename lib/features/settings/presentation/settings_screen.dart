import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/widgets/theme_switch.dart';

class SettingsScreen extends ConsumerWidget{
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: SizedBox(
        width: double.maxFinite,
        height: double.maxFinite,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Light '),
            ThemeSwitch(),
            Text(' Dark')
          ],
        ),
      ),
    );
  }
}