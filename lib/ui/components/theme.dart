import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const Color accentColor = Color(0xff00AEEF);
const Color primaryColor = Color(0xffffffff);
const Color textDark = Color(0xff080808);

ThemeData mainThemeLight(BuildContext context) {
  return ThemeData(
    brightness: Brightness.light,
    fontFamily: GoogleFonts.lato().fontFamily,
    accentColor: accentColor,
    primaryColor: primaryColor,
    primaryIconTheme: IconThemeData(color: textDark),
    backgroundColor: Colors.black.withOpacity(0.04),
    buttonColor: textDark,
    bottomAppBarColor: Colors.white,
    accentTextTheme: TextTheme(headline1: TextStyle(color: Colors.white)),
    textTheme: TextTheme(
        headline1: TextStyle(color: textDark.withOpacity(0.9)),
        bodyText1: TextStyle(color: textDark.withOpacity(0.95))),
    hintColor: Colors.black.withOpacity(0.35),
    cupertinoOverrideTheme: CupertinoThemeData(
      textTheme: CupertinoTextThemeData(
          textStyle: TextStyle(
              fontFamily: GoogleFonts.mada().fontFamily, color: Colors.black)),
    ),
  );
}
