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

  int coinsAmount = 0;
  int pointsAmount = 0;

  bool rewardGiven =false;

  @override
  void initState() {
    _calculateReward();
    super.initState();
  }

  void _calculateReward() async  {

    if (rewardGiven) return;
    final state = context.read<QuizCubit>().state;

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

    rewardGiven = true;
  }

  Widget rewardRow(String asset, int value){
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(asset,width: 40,height: 40,), SizedBox(width: 10,),
        TweenAnimationBuilder(tween: IntTween(begin: 0,end: value), duration: const Duration(seconds: 2), builder: (context, animatedValue, child) {
          return Text(animatedValue >= 0?"+$animatedValue":"$animatedValue",style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: animatedValue >= 0 ? Colors.green : Colors.red
          ),);
        },)
      ],
    );
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
              top: 200,
              child: SafeArea(
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      widget.message,
                      style: const TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 40),

                    rewardRow(
                    "lib/assets/graphics/others/coins.png",
                    coinsAmount,
                  ),
                  const SizedBox(height: 20),

                  rewardRow(
                    "lib/assets/graphics/others/points.png",
                    pointsAmount,
                  ),

                  const SizedBox(height: 60),

                    ElevatedButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => GameHomeScreen(),
                          ),
                        );
                      },
                      child: const Text("Continue"),
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
