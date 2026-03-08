import 'package:flutter/material.dart';
import 'CustomRadio.dart';

Widget TopicButtons(String selected, BuildContext context) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomRadio(
          "Math",
          const Color(0xFF3B82F6),
          selected == "math",
          RadioType.topic,
          context,
        ),
        // const SizedBox(width: 10),
        CustomRadio(
          "Programming",
          const Color(0xFFDE5155),
          selected == "programming",
          RadioType.topic,
          context,
        ),
        // const SizedBox(width: 10),
        CustomRadio(
          "Islamic",
          const Color(0xFFD0C2B7),
          selected == "islam",
          RadioType.topic,
          context,
        ),
        CustomRadio(
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
