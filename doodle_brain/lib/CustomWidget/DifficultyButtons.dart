import 'package:flutter/material.dart';
// import '../CustomWidget/expandedButton.dart';
import 'CustomRadio.dart';

Widget DifficultyButtons(String selected,BuildContext context) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        CustomRadio("Easy", const Color(0xFF81A263), selected == "easy",RadioType.difficulty,context),
        const SizedBox(width: 10),
        CustomRadio(
          "Medium",
          const Color(0xFFE79E4F),
          selected == "intermediate",RadioType.difficulty,context
        ),
        const SizedBox(width: 10),
        CustomRadio("Hard", const Color(0xFFAD524A), selected == "hard",RadioType.difficulty,context),
      ],
    ),
  );
}
