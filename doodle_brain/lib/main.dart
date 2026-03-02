import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'cubit/NavigationCubit.dart';
import './CustomWidget/boxDecoration.dart';
import 'CustomWidget/NavBar.dart';
import 'CustomWidget/expandedButton.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BlocProvider(
        create: (context) => NavigationCubit(),
        child: const GameHomeScreen(),
      ),
    );
  }
}

class GameHomeScreen extends StatelessWidget {
  const GameHomeScreen({super.key});

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
            child: Image.asset("lib/assets/background.jpeg", fit: BoxFit.cover),
          ),
          Column(
            children: [
              const SizedBox(height: 10),
              _buildHeader(context),
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

  Widget _buildHeader(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.all(12),
      decoration: boxDecoration(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () => context.read<NavigationCubit>().updateIndex(0),
            child: Image.asset("lib/assets/image.png", width: 25, height: 25),
          ),
          const Text(
            "Doodle Draw",
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.brown,
            ),
          ),
          Row(
            children: const [
              Icon(Icons.monetization_on, color: Colors.amber),
              SizedBox(width: 4),
              Text("215"),
            ],
          ),
        ],
      ),
    );
  }
}

class BattlePage extends StatelessWidget {
  const BattlePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
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
              _buildPointColumn("Points", "+0"),
              _buildPointColumn("Points", "+0"),
            ],
          ),
        ),
        const SizedBox(height: 20),
        Expanded(
          child: Column(
            children: [
              Image.asset("lib/assets/char.png", width: 800, height: 250),
              const SizedBox(height: 20),
              _buildPlayButton(),
              const SizedBox(height: 25),
              _buildDifficultyButtons(),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildPointColumn(String title, String value) {
    return Column(
      children: [
        Text(title),
        Row(
          children: [
            Image.asset("lib/assets/coins.png", width: 20, height: 20),
            Text(value),
          ],
        ),
      ],
    );
  }

  Widget _buildPlayButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          minimumSize: const Size(200, 60),
          backgroundColor: const Color(0xffC9B2A0),
          foregroundColor: Colors.brown,
          side: const BorderSide(color: Colors.brown, width: 2),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        onPressed: () {},
        child: const Text(
          "Play",
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Widget _buildDifficultyButtons() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          expandedButton("Easy", const Color(0xFF81A263)),
          const SizedBox(width: 10),
          expandedButton("Medium", const Color(0xFFE79E4F)),
          const SizedBox(width: 10),
          expandedButton("Hard", const Color(0xFFAD524A)),
        ],
      ),
    );
  }
}
