import 'package:flutter/material.dart';
import '../CustomWidget/expandedButton.dart';

Widget buildDifficultyButtons() {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16),
    child: Row(
      children: [
        expandedButton("Easy", const Color(0xFF81A263)),
        const SizedBox(width: 10),
        expandedButton("Medium", const Color(0xFFE79E4F)),
        const SizedBox(width: 10),
        expandedButton("Hard", const Color(0xFFAD524A)),
      ],
    ),
  );
}
