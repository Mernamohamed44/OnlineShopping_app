import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Themes{
  ThemeData themeData = ThemeData(
    fontFamily: GoogleFonts.poppins().fontFamily,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.white60
    ),
    textTheme: const TextTheme(
      headline1: TextStyle(
        fontSize: 30,
        height: 3,
        fontWeight: FontWeight.bold,
        color: Colors.red
      ),
        headline2: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white
        )
    ),
  );
}