import 'package:flutter/material.dart';
import 'BattlePage.dart';
import '../CustomWidget/buildHeader.dart';
import '../CustomWidget/NavBar.dart';
import '../cubit/NavigationCubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class GameHomeScreen extends StatelessWidget {
  GameHomeScreen({super.key});

  final List<Widget> _pages = const [
    BattlePage(),
    Center(
      child: Text(
        "Shop Page",
        style: TextStyle(fontSize: 28, color: Colors.brown),
      ),
    ),
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
            child: Image.asset("lib/assets/graphics/background/1.png", fit: BoxFit.cover),
          ),
          Column(
            children: [
              const SizedBox(height: 10),
              buildHeader(context),
              Expanded(
                child: BlocBuilder<NavigationCubit, int>(
                  builder: (context, state) {
                    return _pages[state];
                  },
                ),
              ),
              buildCustomNavBar(context),
            ],
          ),
        ],
      ),
    );
  }
}
