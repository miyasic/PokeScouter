import 'package:flutter/material.dart';
import 'package:poke_scouter/constants/provider_name.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final themeProvider = Provider.family<ThemeData, Brightness>((ref, brightness) {
  return ThemeData(
    brightness: brightness,
    primarySwatch: Colors.teal,
  );
}, name: kProviderNameTheme);
