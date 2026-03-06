import 'package:doodle_brain/models/enums.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final Map<Topic, ThemeData> fightTheme = {
  Topic.islam: ThemeData(
    useMaterial3: false,
    colorScheme: ColorScheme.light(
      primary: Color(0xffe6d2b5),
      onPrimary: Color(0xff4a2e1f),
      primaryContainer: Color(0xffe6d2b5),
      onPrimaryContainer: Color(0xff4a2e1f),
    ),

    // Elevated Button Theme
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: Color(0xffe6d2b5),
        foregroundColor: Color(0xff4a2e1f),
        textStyle: GoogleFonts.medievalSharp(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: BorderSide(width: 3, color: Color(0xff4a2e1f)),
        ),
      ),
    ),

    // Default Text Theme (affects buttons + text widgets)
    textTheme: GoogleFonts.cinzelDecorativeTextTheme(),
  ),
  Topic.general: ThemeData(
    useMaterial3: false,
    colorScheme: ColorScheme.light(
      primary: Color(0xffe6d2b5),
      onPrimary: Color(0xff4a2e1f),
      primaryContainer: Color(0xffe6d2b5),
      onPrimaryContainer: Color(0xff4a2e1f),
    ),

    // Elevated Button Theme
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: Color(0xffe6d2b5),
        foregroundColor: Color(0xff4a2e1f),
        textStyle: GoogleFonts.medievalSharp(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: BorderSide(width: 3, color: Color(0xff4a2e1f)),
        ),
      ),
    ),

    // Default Text Theme (affects buttons + text widgets)
    textTheme: GoogleFonts.cinzelDecorativeTextTheme(),
  ),
  Topic.math: ThemeData(
    useMaterial3: false,
    colorScheme: ColorScheme.light(
      primary: Colors.white,
      onPrimary: Color(0xffEF4444),
      primaryContainer: Colors.white,
      onPrimaryContainer: Color(0xffEF4444),
    ),

    // Elevated Button Theme
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        textStyle: TextStyle(
          fontSize: 18,
          fontFamily: 'bios',
          fontWeight: FontWeight.bold,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: BorderSide(width: 3, color: Color(0xffEF4444)),
        ),
      ),
    ),

    // Default Text Theme (affects buttons + text widgets)
    textTheme: TextTheme(displayMedium: TextStyle(fontFamily: 'bios')),
  ),
  Topic.programming: ThemeData(
    useMaterial3: false,
    colorScheme: ColorScheme.light(
      primary: Color(0xff3B82F6),
      onPrimary: Color(0xff0F172A),
      primaryContainer: Color(0xff3B82F6),
      onPrimaryContainer: Color(0xff0F172A),
    ),

    // Elevated Button Theme
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: Color(0xff3B82F6),
        foregroundColor: Color(0xff0F172A),
        textStyle: TextStyle(
          fontSize: 18,
          fontFamily: 'bios',
          fontWeight: FontWeight.bold,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: BorderSide(width: 3, color: Color(0xff0F172A)),
        ),
      ),
    ),

    // Default Text Theme (affects buttons + text widgets)
    textTheme: TextTheme(displayMedium: TextStyle(fontFamily: 'bios')),
  ),
};

final Map<Topic, String> monsterUrl = {
  Topic.islam: "lib/assets/graphics/enemies/islam.png",
  Topic.general: "lib/assets/graphics/enemies/general.png",
  Topic.math: "lib/assets/graphics/enemies/math.png",
  Topic.programming: "lib/assets/graphics/enemies/programming.png",
};
final Map<Topic, String> backgrounds = {
  Topic.islam: "lib/assets/graphics/background/1.png",
  Topic.general: "lib/assets/graphics/background/1.png",
  Topic.math: "lib/assets/graphics/background/2.jpeg",
  Topic.programming: "lib/assets/graphics/background/3.jpeg",
};
