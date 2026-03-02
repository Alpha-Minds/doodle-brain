import 'package:flutter/material.dart';
import '../CustomWidget/expandedButton.dart';
import '../CustomWidget/buildPointColumn.dart';

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
              _buildPlayButton(),
              const SizedBox(height: 25),
              buildDifficultyButtons(),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildPlayButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          minimumSize: const Size(200, 60),
          backgroundColor: const Color(0xffC9B2A0),
          foregroundColor: Colors.brown,
          side: const BorderSide(color: Colors.brown, width: 2),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        onPressed: () {},
        child: const Text(
          "Play",
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

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
}
