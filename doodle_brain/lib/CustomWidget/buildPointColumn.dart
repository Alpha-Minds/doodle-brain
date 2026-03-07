import 'package:flutter/material.dart';
import 'package:doodle_brain/assets/fonts/app_fonts.dart';

Widget buildPointColumn(String title, String value) {
  return Column(
    mainAxisSize: MainAxisSize.min,
    children: [
      Text(
        title,
        style: AppFonts.titlesFont(
          fontSize: 14,
          color: Colors.brown.withOpacity(0.8),
        ),
      ),
      const SizedBox(height: 4),
      Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset("lib/assets/coins.png", width: 20, height: 20),
          const SizedBox(width: 6),
          Text(
            value,
            style: AppFonts.jokerFont(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.brown,
            ),
          ),
        ],
      ),
    ],
  );
}
