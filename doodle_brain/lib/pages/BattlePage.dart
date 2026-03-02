import 'package:flutter/material.dart';
import '../CustomWidget/buildPointColumn.dart';
import '../CustomWidget/buildDifficultyButtons.dart';
import '../CustomWidget/buildPlayButton.dart';

class BattlePage extends StatelessWidget {
  const BattlePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 12),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 16),
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: const Color(0xffC9B2A0),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.brown, width: 2),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              buildPointColumn("Points", "+0"),
              buildPointColumn("Points", "+0"),
            ],
          ),
        ),
        const SizedBox(height: 20),
        Expanded(
          child: Column(
            children: [
              Image.asset("lib/assets/char.png", width: 800, height: 250),
              const SizedBox(height: 20),
              buildPlayButton(),
              const SizedBox(height: 25),
              buildDifficultyButtons(),
            ],
          ),
        ),
      ],
    );
  }
}
