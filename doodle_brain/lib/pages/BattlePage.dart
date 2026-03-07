import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../controllers/cubit/user_cubit.dart';
import '../controllers/cubit/user_state.dart';
import '../CustomWidget/buildPointColumn.dart';
import '../CustomWidget/buildDifficultyButtons.dart';
import '../CustomWidget/buildPlayButton.dart';
import '../CustomWidget/buildTopicButtons.dart';

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
                      buildPointColumn("Points", "${user.points}"),
                      buildPointColumn("Points", "${user.points}"),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Image.asset(
                  equippedChar.image_url,
                  width: double.infinity,
                  height: 250,
                  fit: BoxFit.contain,
                  errorBuilder: (context, error, stackTrace) =>
                      Image.asset("lib/assets/char.png", height: 250),
                ),
                const SizedBox(height: 20),
                buildPlayButton(),
                const SizedBox(height: 25),
                buildDifficultyButtons("Easy"),
                const SizedBox(height: 20),
                buildTopicButtons("Islamic"),
              ],
            ),
          );
        }
        return const SizedBox();
      },
    );
  }
}
