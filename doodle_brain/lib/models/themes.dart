import 'package:doodle_brain/models/enums.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final Map<Topic, ThemeData> fightTheme = {
  Topic.islam: ThemeData(
    colorScheme: const ColorScheme.light(
      primary: Colors.blue,
      secondary: Colors.orange,
    ),

    // Elevated Button Theme
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        textStyle: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          fontFamily: 'Montserrat',
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      ),
    ),

    // Default Text Theme (affects buttons + text widgets)
    textTheme: const TextTheme(bodyMedium: TextStyle(fontFamily: 'Montserrat')),
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
    colorScheme: const ColorScheme.light(
      primary: Colors.blue,
      secondary: Colors.orange,
    ),

    // Elevated Button Theme
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        textStyle: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          fontFamily: 'Montserrat',
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      ),
    ),

    // Default Text Theme (affects buttons + text widgets)
    textTheme: const TextTheme(bodyMedium: TextStyle(fontFamily: 'Montserrat')),
  ),
  Topic.programming: ThemeData(
    colorScheme: const ColorScheme.light(
      primary: Colors.blue,
      secondary: Colors.orange,
    ),

    // Elevated Button Theme
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        textStyle: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          fontFamily: 'Montserrat',
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      ),
    ),

    // Default Text Theme (affects buttons + text widgets)
    textTheme: const TextTheme(bodyMedium: TextStyle(fontFamily: 'Montserrat')),
  ),
};

final Map<Topic, String> monsterUrl = {
  Topic.islam: "lib/assets/graphics/enemies/islam.png",
  Topic.general: "lib/assets/graphics/enemies/islam.png",
  Topic.math: "lib/assets/graphics/enemies/islam.png",
  Topic.programming: "lib/assets/graphics/enemies/islam.png",
};
final Map<Topic, String> backgrounds = {
  Topic.islam: "lib/assets/graphics/background/2.jpeg",
  Topic.general: "lib/assets/graphics/background/1.png",
  Topic.math: "lib/assets/graphics/enemies/islam.png",
  Topic.programming: "lib/assets/graphics/enemies/islam.png",
};
