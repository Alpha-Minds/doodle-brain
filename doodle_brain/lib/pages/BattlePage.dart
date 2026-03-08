import 'package:doodle_brain/controllers/TopicSelector/cubit/topic_selector_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../controllers/cubit/user_cubit.dart';
import '../controllers/cubit/user_state.dart';
import '../CustomWidget/PointColumn.dart';
import '../CustomWidget/DifficultyButtons.dart';
import '../CustomWidget/PlayButton.dart';
import '../CustomWidget/TopicButtons.dart';

class BattlePage extends StatelessWidget {
  const BattlePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserCubit, UserState>(
      builder: (context, state) {
        if (state is UserLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state is UserLoaded) {
          final user = state.user;
          final equippedChar = state.getEquippedCharacter();

          return SingleChildScrollView(
            child: Column(
              children: [
                // const SizedBox(height: 1),
                // Container(
                //   margin: const EdgeInsets.symmetric(horizontal: 16),
                //   padding: const EdgeInsets.all(12),
                //   decoration: BoxDecoration(
                //     color: const Color(0xffC9B2A0),
                //     borderRadius: BorderRadius.circular(12),
                //     border: Border.all(color: Colors.brown, width: 2),
                //   ),
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.spaceAround,
                //     children: [
                //       buildPointColumn("Points", "${user.points}"),
                //       buildPointColumn("Points", "${user.points}"),
                //     ],
                //   ),
                // ),
                const SizedBox(height: 20),
                Image.asset(
                  equippedChar.image_url,
                  width: double.infinity,
                  height: 250,
                  fit: BoxFit.contain,
                  errorBuilder: (context, error, stackTrace) =>
                      Image.asset("lib/assets/char.png", height: 250),
                ),
                BlocProvider(
                  create: (context) => TopicSelectorCubit(),
                  child: BlocBuilder<TopicSelectorCubit, TopicSelectorState>(
                    builder: (context, state) {
                      return Column(
                        children: [
                          const SizedBox(height: 20),
                          PlayButton(
                            context,
                            state.currentTopic,
                            state.currentDifficulty,
                          ),
                          const SizedBox(height: 25),
                          DifficultyButtons(
                            state.currentDifficulty.name,
                            context,
                          ),
                          const SizedBox(height: 20),
                          TopicButtons(state.currentTopic.name, context),
                        ],
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        }
        return const SizedBox();
      },
    );
  }
}
