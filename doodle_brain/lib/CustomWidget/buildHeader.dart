import 'package:doodle_brain/assets/fonts/app_fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/NavigationCubit.dart';
import 'boxDecoration.dart';
import '../controllers/cubit/user_cubit.dart';
import '../controllers/cubit/user_state.dart';

Widget buildHeader(BuildContext context, {String title = "Doodle Brain"}) {
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
                  Text(
                    "${user.points}",
                    style: AppFonts.buttonsFont(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(width: 6),
                  Image.asset(
                    "lib/assets/graphics/others/coins.png",
                    width: 30,
                    height: 30,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    "${user.coins}",
                    style: AppFonts.buttonsFont(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
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
