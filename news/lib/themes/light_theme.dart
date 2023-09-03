import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.transparent,
  ),
  brightness: Brightness.light,
  colorScheme: const ColorScheme.light(
    //? background
    background: Color(0xffFBFAF5),
    //? Containers
    primaryContainer: Colors.white,
    secondaryContainer: Color(0xffD8F0FA),
    tertiaryContainer: Color(0xff03DAC6),
    //? Texts , Icons
    primary: Colors.grey,
    secondary: Colors.black,
    tertiary: Colors.blue,
  ),
);
