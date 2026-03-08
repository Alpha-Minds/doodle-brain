import 'package:doodle_brain/CustomWidget/NavBar.dart';
import "package:flutter/material.dart";
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:doodle_brain/controllers/cubit/user_cubit.dart';
import 'package:doodle_brain/controllers/cubit/user_state.dart';
import 'package:auto_size_text/auto_size_text.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {

  // divider custom widget
  Widget _buildDivider() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      height: 4,
      width: double.infinity,
      decoration: BoxDecoration(
        color: const Color(0xff2a1b14),
        borderRadius: BorderRadius.circular(2),
      ),
    );
  }

  // purchased items custom card
  Widget _buildCard(String name, String imagePath, String buttonText) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 15),
      decoration: BoxDecoration(
        color: const Color(0xffe9d7b7),
        borderRadius: BorderRadius.circular(25),
        border: Border.all(color: const Color(0xff2a1b14), width: 3.0),
        boxShadow: const [
          BoxShadow(
            color: Colors.black,
            blurRadius: 8,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            imagePath,
            height: 130,
            fit: BoxFit.contain,
            errorBuilder: (context, error, stackTrace) =>
                const Icon(Icons.help_outline, size: 130),
          ),
          const SizedBox(height: 15),
          AutoSizeText(
            name.toUpperCase(),
            maxLines: 1,
            textAlign: TextAlign.center,
            style: GoogleFonts.uncialAntiqua(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: const Color(0xff2a1b14),
            ),
          ),
          const SizedBox(height: 20),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
            decoration: BoxDecoration(
              color: const Color(0xffc26a2e),
              borderRadius: BorderRadius.circular(30),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black,
                  blurRadius: 4,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: Text(
              buttonText,
              style: GoogleFonts.medievalSharp(
                color: const Color(0xffe9d7b7),
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // coins and points custom card
  Widget _buildStatCard(String title, String imagePath, String value) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 15),
      decoration: BoxDecoration(
        color: const Color(0xffe9d7b7),
        borderRadius: BorderRadius.circular(25),
        border: Border.all(color: const Color(0xff2a1b14), width: 3.0),
        boxShadow: const [
          BoxShadow(
            color: Colors.black,
            blurRadius: 8,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            imagePath,
            height: 130,
            fit: BoxFit.contain,
          ),
          const SizedBox(height: 15),
          AutoSizeText(
            title.toUpperCase(),
            maxLines: 1,
            style: GoogleFonts.uncialAntiqua(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: const Color(0xff2a1b14),
            ),
          ),
          const SizedBox(height: 20),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
            decoration: BoxDecoration(
              color: const Color(0xffc26a2e),
              borderRadius: BorderRadius.circular(30),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black,
                  blurRadius: 4,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: Text(
              value,
              style: GoogleFonts.medievalSharp(
                color: const Color(0xffe9d7b7),
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<UserCubit, UserState>(
        builder: (context, state) {

          if (state is UserLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is UserLoaded) {

            final equippedChar = state.getEquippedCharacter();
            final equippedWeapon = state.getEquippedWeapon();
            final user = state.user;

            return Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("lib/assets/graphics/background/1.png"),
                  fit: BoxFit.cover,
                ),
              ),
              child: SafeArea(
                child: Column(
                  children: [
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                      
                            const SizedBox(height: 30),
                      
                            // user name
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 40),
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 20, horizontal: 20),
                                decoration: BoxDecoration(
                                  color: const Color(0xffe9d7b7),
                                  borderRadius: BorderRadius.circular(25),
                                  border: Border.all(
                                      color: const Color(0xff2a1b14), width: 3),
                                  boxShadow: const [
                                    BoxShadow(
                                      color: Colors.black,
                                      blurRadius: 8,
                                      offset: Offset(0, 2),
                                    ),
                                  ],
                                ),
                                child: Center(
                                  child: Text(
                                    user.name.toUpperCase(),
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.uncialAntiqua(
                                      fontSize: 28,
                                      fontWeight: FontWeight.bold,
                                      color: const Color(0xff2a1b14),
                                      letterSpacing: 2,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                      
                            const SizedBox(height: 30),
                            _buildDivider(),
                            const SizedBox(height: 10),
                      
                            Center(
                              child: Text(
                                "PURCHASED ITEMS",
                                style: GoogleFonts.playfair(
                                  color: const Color(0xff1a1412),
                                  fontWeight: FontWeight.w900,
                                  fontSize: 32,
                                  letterSpacing: 2,
                                ),
                              ),
                            ),
                      
                            const SizedBox(height: 10),
                            _buildDivider(),
                            const SizedBox(height: 30),
                      
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 20),
                              child: Column(
                                children: [
                      
                                  // purchased items
                                  Row(
                                    children: [
                                      Expanded(
                                        child: _buildCard(
                                          equippedChar.name,
                                          equippedChar.image_url,
                                          "equipped",
                                        ),
                                      ),
                                      const SizedBox(width: 20),
                                      Expanded(
                                        child: _buildCard(
                                          equippedWeapon?.name ?? "no weapon",
                                          equippedWeapon?.image_url ?? "",
                                          equippedWeapon != null
                                              ? "equipped"
                                              : "empty",
                                        ),
                                      ),
                                    ],
                                  ),
                      
                                  const SizedBox(height: 30),
                                  _buildDivider(),
                                  const SizedBox(height: 10),
                                
                                  Center(
                                    child: Text(
                                      "COINS & POINTS",
                                      style: GoogleFonts.playfair(
                                        color: const Color(0xff1a1412),
                                        fontWeight: FontWeight.w900,
                                        fontSize: 32,
                                        letterSpacing: 2,
                                      ),
                                    ),
                                  ),
                      
                                // coins and points
                                  const SizedBox(height: 10),
                                  _buildDivider(),
                                  const SizedBox(height: 30),
                      
                                  Row(
                                    children: [
                                      Expanded(
                                        child: _buildStatCard(
                                          "coins",
                                          "lib/assets/graphics/others/coins.png",
                                          "${user.coins}",
                                        ),
                                      ),
                                      const SizedBox(width: 20),
                                      Expanded(
                                        child: _buildStatCard(
                                          "points",
                                          "lib/assets/graphics/others/points.png",
                                          "${user.points}",
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                      
                            const SizedBox(height: 50),
                          ],
                        ),
                      ),
                    ),
                    buildCustomNavBar(context)
                  ],
                ),
              ),
            );
          }

          return const SizedBox.shrink();
        },
      ),
    );
  }
}