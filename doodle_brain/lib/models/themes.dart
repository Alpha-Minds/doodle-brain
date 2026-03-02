import 'package:doodle_brain/models/enums.dart';
import 'package:flutter/material.dart';

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
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
      ),

      // Default Text Theme (affects buttons + text widgets)
      textTheme: const TextTheme(
        bodyMedium: TextStyle(fontFamily: 'Montserrat'),
      ),
    ),
    Topic.general: ThemeData(
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
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
      ),

      // Default Text Theme (affects buttons + text widgets)
      textTheme: const TextTheme(
        bodyMedium: TextStyle(fontFamily: 'Montserrat'),
      ),
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
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
      ),

      // Default Text Theme (affects buttons + text widgets)
      textTheme: const TextTheme(
        bodyMedium: TextStyle(fontFamily: 'Montserrat'),
      ),
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
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
      ),

      // Default Text Theme (affects buttons + text widgets)
      textTheme: const TextTheme(
        bodyMedium: TextStyle(fontFamily: 'Montserrat'),
      ),
    ),
  };