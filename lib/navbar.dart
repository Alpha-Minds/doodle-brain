import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'nav_cubit.dart';

class CustomNavBar extends StatelessWidget {
  const CustomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavCubit, int>(
      builder: (context, currentIndex) {
        return Padding(
          padding: const EdgeInsets.all(16),
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 12),
            decoration: BoxDecoration(
              color: const Color(0xFFD2B48C),
              borderRadius: BorderRadius.circular(30),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.25),
                  blurRadius: 10,
                  offset: const Offset(0, 5),
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: List.generate(4, (index) {
                String path = "";
                String label = "";

                switch (index) {
                  case 0:
                    path = "assets/first.jpeg";
                    label = "Battle";
                    break;
                  case 1:
                    path = "assets/secound.jpeg";
                    label = "Shop";
                    break;
                  case 2:
                    path = "assets/three.jpeg";
                    label = "Inventory";
                    break;
                  case 3:
                    path = "assets/last.jpeg";
                    label = "Profile";
                    break;
                }

                return GestureDetector(
                  onTap: () {
                    context.read<NavCubit>().changeIndex(index);
                  },
                  child: _buildNavItem(
                    path,
                    label,
                    index == currentIndex,
                  ),
                );
              }),
            ),
          ),
        );
      },
    );
  }

  Widget _buildNavItem(String path, String label, bool isSelected) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            color: isSelected
                ? Colors.orange.withOpacity(0.3)
                : Colors.transparent,
            shape: BoxShape.circle,
            border: Border.all(
              color: const Color(0xFFA0522D),
              width: 2,
            ),
          ),
          padding: const EdgeInsets.all(8),
          child: Image.asset(path, fit: BoxFit.contain),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.bold,
            color: isSelected
                ? Colors.orange
                : const Color(0xFFA0522D),
          ),
        ),
      ],
    );
  }
}