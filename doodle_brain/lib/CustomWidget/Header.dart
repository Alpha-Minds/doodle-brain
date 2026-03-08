  import 'package:auto_size_text/auto_size_text.dart';
  import 'package:doodle_brain/assets/fonts/app_fonts.dart';
  import 'package:flutter/material.dart';
  import 'package:flutter_bloc/flutter_bloc.dart';
  import '../controllers/cubit/NavigationCubit.dart';
  import 'boxDecoration.dart';
  import '../controllers/cubit/user_cubit.dart';
  import '../controllers/cubit/user_state.dart';

  Widget Header(BuildContext context, {String title = "Doodle Brain"}) {
    return BlocBuilder<UserCubit, UserState>(
      builder: (context, state) {
        if (state is UserLoaded) {
          final user = state.user;
          return Container(
            margin: const EdgeInsets.symmetric(horizontal: 16),
            padding: const EdgeInsets.all(12),
            decoration: boxDecoration(),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () => context.read<NavigationCubit>().updateIndex(0),
                  child: Image.asset(
                    "lib/assets/image.png",
                    width: 25,
                    height: 25,
                  ),
                ),
                Text(
                  title,
                  style: AppFonts.titlesFont(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.brown,
                  ),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      "lib/assets/graphics/others/points.png",
                      width: 30,
                      height: 30,
                    ),
                    const SizedBox(width: 4),
                    AutoSizeText(
                      "${user.points}",
                      style: AppFonts.buttonsFont(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                      minFontSize: 10,
                      maxLines: 1,
                    ),
                    const SizedBox(width: 6),
                    Image.asset(
                      "lib/assets/graphics/others/coins.png",
                      width: 30,
                      height: 30,
                    ),
                    const SizedBox(width: 4),
                  AutoSizeText(
                      "${user.coins}",
                      style: AppFonts.buttonsFont(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                      minFontSize: 10,
                      maxLines: 1,
                    ),
                  ],
                ),
              ],
            ),
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
