import 'package:doodle_brain/pages/store.dart';
import 'package:flutter/material.dart';
import 'BattlePage.dart';
import '../CustomWidget/Header.dart';
import '../CustomWidget/NavBar.dart';
import '../controllers/cubit/NavigationCubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GameHomeScreen extends StatelessWidget {
  GameHomeScreen({super.key});

  final List<Widget> _pages = const [
    BattlePage(),
    StoreScreen(),
    Center(
      child: Text(
        "Inventory Page",
        style: TextStyle(fontSize: 28, color: Colors.brown),
      ),
    ),
    Center(
      child: Text(
        "Profile Page",
        style: TextStyle(fontSize: 28, color: Colors.brown),
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    builder: (context, state) {
                      return BattlePage();
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
