import 'package:doodle_brain/controllers/cubit/user_cubit.dart';
import 'package:doodle_brain/controllers/quiz/cubit/quiz_cubit.dart';
import 'package:doodle_brain/models/enums.dart';
import 'package:doodle_brain/models/themes.dart';
import 'package:doodle_brain/pages/GameHomeScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RewardScreen extends StatefulWidget {
  final String message;

  const RewardScreen({super.key, required this.message});

  @override
  State<RewardScreen> createState() => _RewardScreenState();
}

class _RewardScreenState extends State<RewardScreen> {
  @override
  void initState() {
    super.initState();
    _giveReward();
  }

  Future<void> _giveReward() async {
    final state = context.read<QuizCubit>().state;

    int coinsAmount = 0;
    int pointsAmount = 0;

    if (state.roundStatus == RoundStatus.monsterDead) {
      switch (state.currentDifficulty) {
        case Difficulty.easy:
          coinsAmount = 10;
          pointsAmount = 3;
          break;

        case Difficulty.intermediate:
          coinsAmount = 25;
          pointsAmount = 7;
          break;

        case Difficulty.hard:
          coinsAmount = 50;
          pointsAmount = 10;
          break;

        case null:
          return;
      }
    } else if (state.roundStatus == RoundStatus.playerDead) {
      switch (state.currentDifficulty) {
        case Difficulty.easy:
          pointsAmount = -2;
          break;

        case Difficulty.intermediate:
          pointsAmount = -5;
          break;

        case Difficulty.hard:
          pointsAmount = -7;
          break;

        case null:
          return;
      }
    }

    await context.read<UserCubit>().changeCoins(coinsAmount);
    await context.read<UserCubit>().changePoints(pointsAmount);
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: fightTheme[Topic.general]!,
      child: Scaffold(
        body: Stack(
          alignment: Alignment.center,
          children: [
            Positioned.fill(
              top: 0,
              child: Image.asset(
                "lib/assets/graphics/background/1.png",
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              top: 300,
              child: SafeArea(
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      widget.message,
                      style: const TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 100),

                    ElevatedButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => GameHomeScreen(),
                          ),
                        );
                      },
                      child: const Text("OK"),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
