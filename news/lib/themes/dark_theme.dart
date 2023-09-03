import 'package:flutter/material.dart';

ThemeData darkTheme = ThemeData(
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.transparent,
  ),
  brightness: Brightness.dark,
  colorScheme: const ColorScheme.dark(
    //? Background
    background: Color(0xff121212),
    //? Containers
    primaryContainer: Color(0xff000000),
    secondaryContainer: Color(0xff6200EE),
    tertiaryContainer: Color(0xff03DAC6),
    //? Texts , Icons
    primary: Color(0xff000000),
    secondary: Colors.white,
    tertiary: Color(0xff6200EE),
  ),
);

//! hello in red
//? hello in blue
//Todo: hello in orange
//// hello in no color
