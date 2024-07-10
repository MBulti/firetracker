import 'package:flutter/material.dart';

ThemeData getLightTheme() {
  return ThemeData(
    colorScheme: ColorScheme.fromSeed(seedColor: Colors.redAccent),
    useMaterial3: true,
  );
}

ThemeData getDarkTheme() {
  return ThemeData(
    colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
    useMaterial3: true,
  );
}