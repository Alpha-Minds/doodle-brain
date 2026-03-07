import 'package:doodle_brain/CustomWidget/NavBar.dart';
import 'package:doodle_brain/CustomWidget/buildHeader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:doodle_brain/controllers/cubit/user_cubit.dart';
import 'package:doodle_brain/controllers/cubit/user_state.dart';
import 'package:doodle_brain/models/item_model.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserCubit, UserState>(
      builder: (context, state) {
        if (state is! UserLoaded) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }

        final characters = state.getShopCharacters();
        final weapons = state.getShopWeapons();

        return Scaffold(
          body: Stack(
            children: [
              /// Background
              Positioned.fill(
                child: Image.asset(
                  "lib/assets/graphics/background/1.png",
                  fit: BoxFit.cover,
                ),
              ),

              Positioned.fill(
                child: Container(color: Colors.white.withOpacity(0.2)),
              ),

              Column(
                children: [
                  buildHeader(context, title: "Store"),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          const SizedBox(height: 20),

                          /// ===== STORE TITLE =====
                          // Column(
                          //   children: [
                          //     Text(
                          //       "STORE",
                          //       style: GoogleFonts.uncialAntiqua(
                          //         fontSize: 44,
                          //         fontWeight: FontWeight.bold,
                          //         color: Colors.black,
                          //       ),
                          //     ),
                          //     const SizedBox(height: 8),
                          //     Container(
                          //       width: 250,
                          //       height: 6,
                          //       decoration: BoxDecoration(
                          //         color: const Color(0xffc26a2e),
                          //         borderRadius: BorderRadius.circular(20),
                          //       ),
                          //     ),
                          //   ],
                          // ),

                          // const SizedBox(height: 10),

                          /// ===== CHARACTERS =====
                          _section(context, "CHARACTERS", characters),

                          const SizedBox(height: 28),

                          /// ===== WEAPONS =====
                          _section(context, "WEAPONS", weapons),
                        ],
                      ),
                    ),
                  ),
                  buildCustomNavBar(context),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _section(BuildContext context, String title, List<Item> items) {
    if (items.isEmpty) return const SizedBox();

    return Column(
      children: [
        Text(
          title,
          style: GoogleFonts.uncialAntiqua(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Color(0xff2a1b14),
          ),
        ),
        const SizedBox(height: 22),
        SizedBox(
          height: 230,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            itemCount: items.length,
            itemBuilder: (context, index) {
              final item = items[index];
              return _itemCard(context, item);
            },
          ),
        ),
      ],
    );
  }

  Widget _itemCard(BuildContext context, Item item) {
    return Container(
      width: 170,
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: const Color(0xffe6d2b5),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Color(0xff6b4a34), width: 3),

        /// 👇 Shadow هنا
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.25),
            blurRadius: 10,
            spreadRadius: 1,
            offset: const Offset(0, 6), // نازل لتحت شوية
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(child: Image.asset(item.image_url, fit: BoxFit.contain)),
          Text(
            item.name,
            textAlign: TextAlign.center,
            style: GoogleFonts.uncialAntiqua(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xffc26a2e),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            onPressed: () async {
              final success = await context.read<UserCubit>().buyItem(item.id);

              if (!context.mounted) return;

              if (!success) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Not enough coins")),
                );
              }
            },
            child: Text(
              "Buy ${item.price}",
              style: GoogleFonts.medievalSharp(
                color: Colors.white,
                fontSize: 14,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
