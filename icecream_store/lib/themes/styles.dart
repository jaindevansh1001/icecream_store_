import 'package:flutter/material.dart';

abstract class Styles {
  static const lightColorScheme = ColorScheme(
    brightness: Brightness.light,
    primary: Color.fromARGB(255, 232, 112, 170),
    onPrimary: Color.fromARGB(255, 228, 116, 116),
    primaryContainer: Color.fromARGB(255, 234, 134, 156),
    onPrimaryContainer: Color.fromARGB(255, 252, 151, 193),
    secondary: Color(0xFF75565D),
    onSecondary: Color(0xFFFFFFFF),
    secondaryContainer: Color.fromARGB(255, 238, 116, 142),
    onSecondaryContainer: Color(0xFF2B151B),
    tertiary: Color(0xFF4C6708),
    onTertiary: Color(0xFFFFFFFF),
    tertiaryContainer: Color(0xFFCDEF85),
    onTertiaryContainer: Color(0xFF141F00),
    error: Color.fromARGB(255, 181, 84, 84),
    errorContainer: Color(0xFFFFDAD6),
    onError: Color(0xFFFFFFFF),
    onErrorContainer: Color(0xFF410002),
    background: Color(0xFFFFFBFF),
    onBackground: Color(0xFF201A1B),
    surface: Color.fromARGB(235, 249, 160, 202),
    onSurface: Color(0xFF201A1B),
    surfaceVariant: Color.fromARGB(255, 227, 141, 157),
    onSurfaceVariant: Color.fromARGB(255, 8, 0, 2),
    outline: Color(0xFF847376),
    onInverseSurface: Color.fromARGB(255, 230, 152, 159),
    inverseSurface: Color.fromARGB(255, 190, 114, 126),
    inversePrimary: Color.fromARGB(255, 237, 150, 172),
    shadow: Color(0xFF000000),
    surfaceTint: Color.fromARGB(255, 229, 158, 192),
    outlineVariant: Color(0xFFD6C2C5),
    scrim: Color(0xFF000000),
  );

  
static const darkColorScheme = ColorScheme(
  brightness: Brightness.dark,
  primary: Color.fromARGB(255, 211, 121, 143),
  onPrimary: Color.fromARGB(255, 217, 106, 156),
  primaryContainer: Color.fromARGB(255, 223, 132, 176),
  onPrimaryContainer: Color.fromARGB(255, 231, 145, 164),
  secondary: Color.fromARGB(255, 229, 128, 150),
  onSecondary: Color.fromARGB(255, 209, 125, 149),
  secondaryContainer: Color.fromARGB(255, 226, 156, 173),
  onSecondaryContainer: Color(0xFFFFD9E1),
  tertiary: Color(0xFFB1D26C),
  onTertiary: Color(0xFF253500),
  tertiaryContainer: Color(0xFF384E00),
  onTertiaryContainer: Color(0xFFCDEF85),
  error: Color(0xFFFFB4AB),
  errorContainer: Color.fromARGB(255, 199, 106, 112),
  onError: Color(0xFF690005),
  onErrorContainer: Color(0xFFFFDAD6),
  background: Color(0xFF201A1B),
  onBackground: Color(0xFFECE0E1),
  surface: Color(0xFF201A1B),
  onSurface: Color(0xFFECE0E1),
  surfaceVariant: Color.fromARGB(255, 203, 134, 149),
  onSurfaceVariant: Color(0xFFD6C2C5),
  outline: Color(0xFF9E8C8F),
  onInverseSurface: Color(0xFF201A1B),
  inverseSurface: Color(0xFFECE0E1),
  inversePrimary: Color.fromARGB(255, 235, 150, 191),
  shadow: Color(0xFF000000),
  surfaceTint: Color(0xFFFFB1C4),
  outlineVariant: Color.fromARGB(255, 158, 118, 126),
  scrim: Color(0xFF000000),
);


  static const TextStyle productRowItemName = TextStyle(
    color: Color.fromRGBO(0, 0, 0, 1),
    fontSize: 18,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w600,
  );
  static const TextStyle productRowTotal = TextStyle(
    color: Color.fromRGBO(1, 0, 0, 0.929),
    fontSize: 18,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.bold,
  );
  static const TextStyle productRowItemPrice = TextStyle(
    color: Color.fromARGB(209, 0, 0, 0),
    fontSize: 18,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w400,
  );
  static const TextStyle searchText = TextStyle(
    color: Color.fromARGB(255, 0, 0, 1),
    fontSize: 14,
    fontStyle: FontStyle.normal,
  );
  static const TextStyle dilveryTimeTable = TextStyle(
    color: Color.fromARGB(255, 9, 1, 1),
    fontWeight: FontWeight.w300,
  );
  static const TextStyle dileveryTime = TextStyle(
    color: Color.fromARGB(255, 12, 1, 1),
  );
}
