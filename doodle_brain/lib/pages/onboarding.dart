import 'package:auto_size_text/auto_size_text.dart';
import 'package:doodle_brain/CustomWidget/boxDecoration.dart';
import 'package:doodle_brain/models/enums.dart';
import 'package:doodle_brain/models/themes.dart';
import 'package:doodle_brain/pages/enterName.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';


class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final PageController _controller = PageController();
  int currentIndex = 0;

  final List<Map<String, String>> pages = [
    {
      "description":
          "In a world that had finally found peace after a long and devastating war, the warriors laid down their weapons and returned to their beloved city. Life slowly began to flourish again, and hope returned to the land.",
      "image": "lib/assets/graphics/on_board/1.png",
    },
    {
      "description":
          "But that peace did not last. Without warning, strange portals began to tear open across the land. From these mysterious gateways poured a dark and terrifying force, bringing with it creatures of pure evil.",
      "image": "lib/assets/graphics/on_board/3.png",
    },
    {
      "description":
          "Monsters from distant multiverses flooded into the world, spreading wherever they appeared.Now the fate of the world rests in your hands. Rise, fight the monsters, close the portals, and save your world.",
      "image": "lib/assets/graphics/on_board/2.png",
    },
  ];

  void nextPage() {
    if (currentIndex == pages.length - 1) {
      // Navigate to Home Screen
      // Hive.box('settings').put('seenOnboard', true);
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Entername()),
      );
    } else {
      _controller.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void skip() {
    _controller.jumpToPage(pages.length - 1);
  }

  Widget buildPage(Map<String, String> page) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 40),
      child: Container(
        decoration: boxDecoration(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(page["image"]!, height: 250),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 3.0),
              child: AutoSizeText(
                page["description"]!,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w800,
                ),
                maxLines: 7,
                minFontSize: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildIndicator() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        pages.length,
        (index) => Container(
          margin: const EdgeInsets.all(4),
          width: currentIndex == index ? 20 : 8,
          height: 8,
          decoration: BoxDecoration(
            color: currentIndex == index ? Color(0xff6b4a34) : Colors.grey,
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: fightTheme[Topic.general]!,
      child: Scaffold(
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
                  /// Skip Button
                  Align(
                    alignment: Alignment.topRight,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 12.0, right: 12),
                      child: ElevatedButton(
                        onPressed: skip,
                        child: const Text("Skip"),
                      ),
                    ),
                  ),

                  /// PageView
                  Expanded(
                    child: PageView.builder(
                      controller: _controller,
                      itemCount: pages.length,
                      onPageChanged: (index) {
                        setState(() {
                          currentIndex = index;
                        });
                      },
                      itemBuilder: (context, index) {
                        return buildPage(pages[index]);
                      },
                    ),
                  ),

                  /// Indicator
                  buildIndicator(),

                  const SizedBox(height: 30),

                  /// Next Button
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: nextPage,
                        child: Text(
                           "Next",
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 30),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
