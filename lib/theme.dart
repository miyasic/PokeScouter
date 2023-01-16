import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:poke_scouter/constants/provider_name.dart';

final themeProvider = Provider.family<ThemeData, Brightness>((ref, brightness) {
  return ThemeData(
    brightness: brightness,
    primarySwatch: Colors.teal,
  );
}, name: kProviderNameTheme);

final themeModeProvider = StateProvider<ThemeMode>((ref) => ThemeMode.system);

extension Extension on ThemeMode {
  ThemeMode getNext() {
    switch (this) {
      case ThemeMode.system:
        return ThemeMode.light;
      case ThemeMode.light:
        return ThemeMode.dark;
      case ThemeMode.dark:
        return ThemeMode.system;
    }
  }

  IconData getIcon() {
    switch (this) {
      case ThemeMode.system:
        return Icons.brightness_medium;
      case ThemeMode.light:
        return Icons.light_mode;
      case ThemeMode.dark:
        return Icons.dark_mode;
    }
  }
}
