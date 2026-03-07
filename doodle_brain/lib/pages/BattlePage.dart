import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../controllers/cubit/user_cubit.dart';
import '../controllers/cubit/user_state.dart';
import '../CustomWidget/buildPointColumn.dart';
import '../CustomWidget/buildDifficultyButtons.dart';
import '../CustomWidget/buildPlayButton.dart';

class BattlePage extends StatelessWidget {
  const BattlePage({super.key});

  @override
  Widget build(BuildContext context) {
    // BlocBuilder listens to UserCubit changes to rebuild the UI accordingly
    return BlocBuilder<UserCubit, UserState>(
      builder: (context, state) {
        // Display a loading spinner while the user data is being fetched from Hive
        if (state is UserLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        // Once the user data is loaded, display the battle interface
        if (state is UserLoaded) {
          final user = state.user;
          // Retrieve the character currently equipped by the user
          final equippedChar = state.getEquippedCharacter();

          return Column(
            children: [
              const SizedBox(height: 12),
              // Header container displaying real-time points from the database
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
                    // Displaying dynamic points using the user model
                    buildPointColumn("Points", "${user.points}"),
                    buildPointColumn("Points", "${user.points}"),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: Column(
                  children: [
                    // Display the image of the character equipped in the user's state
                    Image.asset(
                      equippedChar.image_url,
                      width: 800,
                      height: 250,
                      // Fallback image if the specific character image fails to load
                      errorBuilder: (context, error, stackTrace) =>
                          Image.asset("lib/assets/graphics/character/1.png"),
                    ),
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
        // Default empty state if no specific state is matched
        return const SizedBox();
      },
    );
  }
}
