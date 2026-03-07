import 'package:flutter/material.dart';
import 'package:doodle_brain/assets/fonts/app_fonts.dart';

Widget buildPlayButton() {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 15),
    child: ElevatedButton(
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(200, 60),
        backgroundColor: const Color(0xffC9B2A0),
        foregroundColor: Colors.brown,
        side: const BorderSide(color: Colors.brown, width: 2),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      ),
      onPressed: () {},
      child: Text(
        "Play",
        style: AppFonts.titlesFont(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: Colors.brown,
        ),
      ),
    ),
  );
}