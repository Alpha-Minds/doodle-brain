import 'package:doodle_brain/controllers/cubit/user_cubit.dart';
import 'package:doodle_brain/controllers/cubit/user_state.dart';
import 'package:doodle_brain/controllers/quiz/cubit/quiz_cubit.dart';
import 'package:doodle_brain/main.dart';
import 'package:doodle_brain/models/enums.dart';
import 'package:doodle_brain/models/item_model.dart';
import 'package:doodle_brain/models/themes.dart';
import 'package:doodle_brain/models/user_model.dart';
import 'package:doodle_brain/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Fightscreen extends StatelessWidget {
  const Fightscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<QuizCubit, QuizState>(
      listener: (context, state){if (state.roundStatus != RoundStatus.playing) Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => MyWidget(),));},
      builder: (context, state) {
        if (state.isLoading) {
          return Scaffold(body: Center(child: CircularProgressIndicator()));
        }
        return Theme(
          data: fightTheme[state.currentTopic]!,
          child: Scaffold(
            body: Stack(
              children: [
                Positioned.fill(
                  top: 0,
                  child: Image.asset(
                    backgrounds[state.currentTopic]!,
                    fit: BoxFit.cover,
                  ),
                ),
                SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          "${state.remainingTime}",
                          style: const TextStyle(
                            fontSize: 50,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Column(
                              children: [
                                Row(
                                  children: List<Widget>.filled(
                                    state.currentMonsterHealth,
                                    Image.asset(
                                      "lib/assets/graphics/others/monster_heart.png",
                                      width: 30,
                                    ),
                                  ),
                                ),
                                Image.asset(
                                  monsterUrl[state.currentTopic]!,
                                  height: 150,
                                ),
                              ],
                            ),
                            BlocBuilder<UserCubit, UserState>(
                              builder: (context, state) {
                                if (state is UserLoaded) {
                                  return Column(
                                    children: [
                                      Row(
                                        children: List<Widget>.filled(
                                          context
                                              .watch<QuizCubit>()
                                              .state
                                              .currentPlayerHealth,
                                          Image.asset(
                                            "lib/assets/graphics/others/user_heart.png",
                                            width: 30,
                                          ),
                                        ),
                                      ),
                                      Image.asset(
                                        state.getEquippedCharacter().image_url,
                                        height: 150,
                                      ),
                                    ],
                                  );
                                }
                                return Container();
                              },
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 70,
                          child: ElevatedButton(
                            onPressed: () {},
                            child: Center(
                              child: Text(
                                state.currentRound.first.question,
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          // child: Container(
                          //   decoration: BoxDecoration(
                          //     borderRadius: BorderRadius.circular(7),
                          //     border: Border.all(
                          //       color: Theme.of(context).colorScheme.onPrimary,
                          //       width: 3,
                          //     ),
                          //     color: Theme.of(context).colorScheme.primary,
                          //   ),
                          //   child: Center(
                          //     child: Text(
                          //       state.currentRound.first.question,
                          //       style: TextStyle(
                          //         fontSize: 18,
                          //         fontWeight: FontWeight.bold,
                          //       ),
                          //     ),
                          //   ),
                          // ),
                        ),
                        SizedBox(height: 15),
                        SizedBox(
                          height: 200,
                          child: GridView.builder(
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  mainAxisExtent: 70,
                                  crossAxisSpacing: 10,
                                  mainAxisSpacing: 10,
                                ),
                            itemCount: 4,
                            itemBuilder: (context, index) => ElevatedButton(
                              onPressed: () {context.read<QuizCubit>().submitAnswer(state.currentRound.first.choices[index]);},
                              child: Text(
                                state.currentRound.first.choices[index],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
