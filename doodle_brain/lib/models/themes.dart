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
  Topic.programming: ThemeData(
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
};

final Map<Topic, String> monsterUrl = {
  Topic.islam: "lib/assets/graphics/enemies/islam.png",
  Topic.general: "lib/assets/graphics/enemies/islam.png",
  Topic.math: "lib/assets/graphics/enemies/math.png",
  Topic.programming: "lib/assets/graphics/enemies/programming.png",
};
final Map<Topic, String> backgrounds = {
  Topic.islam: "lib/assets/graphics/background/1.jpeg",
  Topic.general: "lib/assets/graphics/background/1.png",
  Topic.math: "lib/assets/graphics/background/2.png",
  Topic.programming: "lib/assets/graphics/enemies/islam.png",
};
