import 'package:doodle_brain/controllers/cubit/user_cubit.dart';
import 'package:doodle_brain/controllers/quiz/cubit/quiz_cubit.dart';
import 'package:doodle_brain/models/enums.dart';
import 'package:doodle_brain/models/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RewardScreen extends StatelessWidget {
  final String massage;
  RewardScreen({super.key, required this.massage});

  @override
  Widget build(BuildContext context) {
    int conisAmuont = 0;
    int pointsAmuont = 0;

    return BlocListener<QuizCubit, QuizState>(
      listenWhen: (previous, current) =>
          previous.roundStatus != current.roundStatus,
      listener: (context, state) async {
        if (state.roundStatus == RoundStatus.monsterDead) {
          switch (state.currentDifficulty) {
            case Difficulty.easy:
              conisAmuont = 10;
              pointsAmuont = 3;
              break;
            case Difficulty.intermediate:
              conisAmuont = 25;
              pointsAmuont = 7;
              break;
            case Difficulty.hard:
              conisAmuont = 50;
              pointsAmuont = 10;
              break;
            case null:
              // TODO: Handle this case.
              throw UnimplementedError();
          }
        } else if (state.roundStatus == RoundStatus.playerDead) {
          switch (state.currentDifficulty) {
            case Difficulty.easy:
              pointsAmuont = -3;
              break;
            case Difficulty.intermediate:
              pointsAmuont = -7;
              break;
            case Difficulty.hard:
              pointsAmuont = -10;
              break;
            case null:
              // TODO: Handle this case.
              throw UnimplementedError();
          }
        }
        await context.read<UserCubit>().changeCoins(conisAmuont);
        await context.read<UserCubit>().changePoints(pointsAmuont);
      },
      child: Theme(
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
                    children: [
                      Text(
                        massage,
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 100),
                      ElevatedButton(onPressed: () {}, child: Text("ok")),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
