import 'package:flutter/material.dart';
import 'buildCustomRadio.dart';

Widget buildTopicButtons(String selected, BuildContext context) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        buildCustomRadio(
          "Math",
          const Color(0xFF3B82F6),
          selected == "math",
          RadioType.topic,
          context,
        ),
        // const SizedBox(width: 10),
        buildCustomRadio(
          "Programming",
          const Color(0xFFDE5155),
          selected == "programming",
          RadioType.topic,
          context,
        ),
        // const SizedBox(width: 10),
        buildCustomRadio(
          "Islamic",
          const Color(0xFFD0C2B7),
          selected == "islam",
          RadioType.topic,
          context,
        ),
        buildCustomRadio(
          "General",
          const Color.fromARGB(255, 55, 75, 153),
          selected == "general",
          RadioType.topic,
          context,
        ),
      ],
    ),
  );
}
