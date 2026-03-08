import 'package:doodle_brain/controllers/quiz/cubit/quiz_cubit.dart';
import 'package:doodle_brain/models/enums.dart';
import 'package:doodle_brain/pages/fightScreen.dart';
import 'package:flutter/material.dart';
import 'package:doodle_brain/assets/fonts/app_fonts.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Widget PlayButton(
  BuildContext context,
  Topic topic,
  Difficulty difficulty,
) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 15),
    child: ElevatedButton(
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(200, 60),
        backgroundColor: const Color(0xffC9B2A0),
        foregroundColor: Colors.brown,
        side: const BorderSide(color: Colors.brown, width: 2),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      ),
      onPressed: () async {
        print("${context.read<QuizCubit>().state.isLevelFinished}  snack");
        await context.read<QuizCubit>().selectLevel(topic, difficulty);
        context.read<QuizCubit>().startRound();
        if (!context.read<QuizCubit>().state.isLevelFinished) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => Fightscreen()),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                "You finished all questions in this difficulty progress",
              ),
              duration: Duration(seconds: 2),
            ),
          );
        }
      },
      child: Text(
        "Play",
        style: AppFonts.titlesFont(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: Colors.brown,
        ),
      ),
    ),
  );
}
