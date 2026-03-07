import 'package:flutter/material.dart';
import 'buildCustomRadio.dart';

Widget buildTopicButtons(String selected) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16),
    child: Row(
      children: [
        buildCustomRadio("Math", const Color(0xFF3B82F6), selected == "Math"),
        const SizedBox(width: 10),
        buildCustomRadio(
          "programming",
          const Color(0xFFDE5155),
          selected == "programming",
        ),
        const SizedBox(width: 10),
        buildCustomRadio(
          "General",
          const Color(0xFFD0C2B7),
          selected == "General",
        ),
        buildCustomRadio(
          "Islamic",
          const Color.fromARGB(255, 55, 75, 153),
          selected == "Islamic",
        ),
      ],
    ),
  );
}
