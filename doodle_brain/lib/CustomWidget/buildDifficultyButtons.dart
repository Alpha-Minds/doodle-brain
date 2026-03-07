import 'package:flutter/material.dart';
import 'buildCustomRadio.dart';

Widget buildDifficultyButtons(String selected) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16),
    child: Row(
      children: [
        buildCustomRadio("Easy", const Color(0xFF81A263), selected == "Easy"),
        const SizedBox(width: 10),
        buildCustomRadio(
          "Medium",
          const Color(0xFFE79E4F),
          selected == "Medium",
        ),
        const SizedBox(width: 10),
        buildCustomRadio("Hard", const Color(0xFFAD524A), selected == "Hard"),
      ],
    ),
  );
}
