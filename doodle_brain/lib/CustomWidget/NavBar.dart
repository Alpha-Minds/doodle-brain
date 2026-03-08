import 'package:doodle_brain/pages/GameHomeScreen.dart';
import 'package:doodle_brain/pages/inventory.dart';
import 'package:doodle_brain/pages/profileScreen.dart';
import 'package:doodle_brain/pages/store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../controllers/cubit/NavigationCubit.dart';
import 'boxDecoration.dart';
import '../assets/fonts/app_fonts.dart';

Widget buildCustomNavBar(BuildContext context) {
  return Container(
    margin: const EdgeInsets.all(16),
    padding: const EdgeInsets.symmetric(vertical: 10),
    decoration: boxDecoration(),
    child: BlocBuilder<NavigationCubit, int>(
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            buildNavIcon(
              context,
              'lib/assets/graphics/others/battle.png',
              "Battle",
              0,
              state,
            ),
            buildNavIcon(
              context,
              'lib/assets/graphics/others/store.png',
              "Shop",
              1,
              state,
            ),
            buildNavIcon(
              context,
              'lib/assets/graphics/others/inventory.png',
              "Inventory",
              2,
              state,
            ),
            buildNavIcon(
              context,
              'lib/assets/graphics/others/profile.png',
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

void navigatePages( BuildContext context,int index){
  switch (index) {
    case 0:
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => GameHomeScreen(),));
      break;
    case 1:
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => StoreScreen(),));
      break; 
    case 2:
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Inventory(),));
      break; 
    case 3:
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Profile(),));
      break;
  }
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
    onTap: () { context.read<NavigationCubit>().updateIndex(index);
    navigatePages(context, index);
    },
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Opacity(
          opacity: isActive ? 1.0 : 0.5,
          child: Image.asset(imagePath, width: 30, height: 30),
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
