import 'package:doodle_brain/pages/inventory.dart';
import 'package:doodle_brain/pages/store.dart';
import 'package:flutter/material.dart';
import 'BattlePage.dart';
import '../CustomWidget/Header.dart';
import '../CustomWidget/NavBar.dart';
import '../controllers/cubit/NavigationCubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../pages/profileScreen.dart';

class GameHomeScreen extends StatelessWidget {
  GameHomeScreen({super.key});

  final List<Widget> pages = [
    const BattlePage(),
    const StoreScreen(),
    const Inventory(),
    const Profile(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              "lib/assets/graphics/background/1.png",
              fit: BoxFit.cover,
            ),
          ),

          SafeArea(
            child: Column(
              children: [
                const SizedBox(height: 5),
                Header(context),

                Expanded(
                  child: BlocBuilder<NavigationCubit, int>(
                    builder: (context, activeIndex) {
                      return IndexedStack(index: activeIndex, children: pages);
                    },
                  ),
                ),

                buildCustomNavBar(context),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
