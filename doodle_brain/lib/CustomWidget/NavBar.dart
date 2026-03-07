import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/NavigationCubit.dart';
import 'boxDecoration.dart';
import '../assets/fonts/app_fonts.dart';

Widget buildCustomNavBar(BuildContext context) {
  return Container(
    margin: const EdgeInsets.all(16),
    padding: const EdgeInsets.symmetric(vertical: 12),
    decoration: boxDecoration(),
    child: BlocBuilder<NavigationCubit, int>(
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            buildNavIcon(context, 'lib/assets/battle.png', "Battle", 0, state),
            buildNavIcon(context, 'lib/assets/store.png', "Shop", 1, state),
            buildNavIcon(
              context,
              'lib/assets/inventory.png',
              "Inventory",
              2,
              state,
            ),
            buildNavIcon(
              context,
              'lib/assets/profile.png',
              "Profile",
              3,
              state,
            ),
          ],
        );
      },
    ),
  );
}

Widget buildNavIcon(
  BuildContext context,
  String imagePath,
  String label,
  int index,
  int currentIndex,
) {
  bool isActive = currentIndex == index;
  return GestureDetector(
    onTap: () => context.read<NavigationCubit>().updateIndex(index),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Opacity(
          opacity: isActive ? 1.0 : 0.5,
          child: Image.asset(imagePath, width: 35, height: 35),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: AppFonts.titlesFont(
            fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
            color: isActive ? Colors.brown : Colors.brown.withOpacity(0.6),
            fontSize: 14,
          ),
        ),
      ],
    ),
  );
}
