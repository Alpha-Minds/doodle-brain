import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: GameHomeScreen(),
    );
  }
}

class GameHomeScreen extends StatelessWidget {
  const GameHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset("lib/assets/background.jpeg", fit: BoxFit.cover),
          ),

          SafeArea(
            child: Column(
              children: [
                const SizedBox(height: 10),

                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 16),
                  padding: const EdgeInsets.all(12),
                  decoration: _boxDecoration(),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset(
                        "lib/assets/image.png",
                        width: 25,
                        height: 25,
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
                ),

                const SizedBox(height: 12),

                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 16),
                  padding: const EdgeInsets.all(12),
                  decoration: _boxDecoration(),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: [
                          Text("Points"),

                          Row(
                            children: [
                              Image.asset(
                                "lib/assets/coins.png",
                                width: 20,
                                height: 20,
                              ),
                              Text("+0"),
                            ],
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Text("Points"),
                          Row(
                            children: [
                              Image.asset(
                                "lib/assets/coins.png",
                                width: 20,
                                height: 20,
                              ),
                              Text("+0"),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 20),

                Expanded(
                  child: Column(
                    children: [
                      Image.asset(
                        "lib/assets/center.png",
                        width: 600,
                        height: 200,
                      ),

                      const SizedBox(height: 20),

                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 40,
                          vertical: 12,
                        ),
                        decoration: _boxDecoration(),
                        child: Text(
                          "Play",
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                Container(
                  margin: const EdgeInsets.all(16),
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  decoration: _boxDecoration(),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _buildNavIcon('lib/assets/battle.png', "Battle", true),
                      _buildNavIcon('lib/assets/store.png', "Shop", false),
                      _buildNavIcon(
                        'lib/assets/inventory.png',
                        "Inventory",
                        false,
                      ),
                      _buildNavIcon('lib/assets/profile.png', "Profile", false),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  BoxDecoration _boxDecoration() {
    return BoxDecoration(
      color: Color(0xffC9B2A0),
      borderRadius: BorderRadius.circular(12),
      border: Border.all(color: Colors.brown, width: 2),
    );
  }
}

Widget _buildNavIcon(String imagePath, String label, bool isActive) {
  return Column(
    mainAxisSize: MainAxisSize.min,
    children: [
      Image.asset(imagePath, width: 35, height: 35),
      const SizedBox(height: 4),
      Text(label),
    ],
  );
}
