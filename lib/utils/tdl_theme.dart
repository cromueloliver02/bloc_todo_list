import 'package:flutter/material.dart';
import '../utils/constants.dart';

enum TDLTheme { dark, light }

final lightTheme = ThemeData(
  primaryColorLight: kLightPrimaryColor,
  primaryColorDark: kDarkPrimaryColor,
  scaffoldBackgroundColor: const Color(0xffFFFFFF),
  colorScheme: const ColorScheme.light(
    primary: kLightPrimaryColor,
  ),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    foregroundColor: Colors.white,
    backgroundColor: kLightPrimaryColor,
    iconSize: 30,
  ),
  checkboxTheme: CheckboxThemeData(
    fillColor: MaterialStateProperty.all(kLightPrimaryColor),
  ),
  appBarTheme: const AppBarTheme(
    titleTextStyle: TextStyle(
      color: Colors.white,
      fontSize: kLargeFontSize + 6,
    ),
    iconTheme: IconThemeData(
      color: Colors.white,
      size: kRegularIconSize,
    ),
  ),
  iconTheme: const IconThemeData(color: Colors.grey),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: kLightPrimaryColor,
      padding: const EdgeInsets.symmetric(
        horizontal: 30,
        vertical: 10,
      ),
    ),
  ),
  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(
      padding: const EdgeInsets.symmetric(
        horizontal: 30,
        vertical: 10,
      ),
    ),
  ),
);

final darkTheme = ThemeData(
  primaryColorLight: kLightPrimaryColor,
  primaryColorDark: kDarkPrimaryColor,
  scaffoldBackgroundColor: const Color.fromARGB(255, 40, 40, 40),
  colorScheme: const ColorScheme.dark(
    primary: kDarkPrimaryColor,
  ),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    foregroundColor: Colors.white,
    backgroundColor: kDarkPrimaryColor,
    iconSize: 30,
  ),
  checkboxTheme: CheckboxThemeData(
    fillColor: MaterialStateProperty.all(kLightPrimaryColor),
  ),
  appBarTheme: const AppBarTheme(
    titleTextStyle: TextStyle(
      color: Colors.white,
      fontSize: kLargeFontSize + 6,
    ),
    iconTheme: IconThemeData(
      color: Colors.white,
      size: kRegularIconSize,
    ),
  ),
  iconTheme: const IconThemeData(color: Colors.grey),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: kDarkPrimaryColor,
      padding: const EdgeInsets.symmetric(
        horizontal: 30,
        vertical: 10,
      ),
    ),
  ),
  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(
      padding: const EdgeInsets.symmetric(
        horizontal: 30,
        vertical: 10,
      ),
    ),
  ),
  inputDecorationTheme: const InputDecorationTheme(
    labelStyle: TextStyle(color: Colors.white),
    prefixIconColor: kLightPrimaryColor,
    suffixIconColor: kLightPrimaryColor,
    focusedBorder: UnderlineInputBorder(
      borderSide: BorderSide(
        color: kLightPrimaryColor,
      ),
    ),
  ),
  textSelectionTheme: const TextSelectionThemeData(
    cursorColor: Colors.white,
  ),
);
