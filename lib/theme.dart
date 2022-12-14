import 'package:flutter/material.dart';
import 'package:flutter_template/constants/provider_name.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final themeProvider = Provider.family<ThemeData, Brightness>((ref, brightness) {
  return ThemeData(
    brightness: brightness,
    primarySwatch: Colors.blue,
  );
}, name: kProviderNameTheme);
