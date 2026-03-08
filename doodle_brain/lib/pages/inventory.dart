import 'package:doodle_brain/CustomWidget/boxDecoration.dart';
import 'package:doodle_brain/CustomWidget/item_card.dart';
import 'package:doodle_brain/models/item_model.dart';
import 'package:doodle_brain/controllers/cubit/user_state.dart';
import 'package:doodle_brain/controllers/cubit/user_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class Inventory extends StatelessWidget {
  const Inventory({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Column(
        children: [
          const SizedBox(height: 10),
           Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
            decoration: boxDecoration(),
            child: Text(
              "INVENTORY",
              style: GoogleFonts.uncialAntiqua(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                letterSpacing: 2,
                color: const Color(0xff2a1b14),
              ),
            ),
          ),
          
           TabBar(
            labelColor: const Color(0xff2a1b14).withOpacity(0.9),
            unselectedLabelColor: const Color(0xff2a1b14).withOpacity(0.65),
            indicatorWeight: 3,
            dividerColor: Colors.transparent,
            indicator: UnderlineTabIndicator(
              borderRadius: BorderRadius.circular(35),
              borderSide: const BorderSide(width: 3, color: Color(0xffc26a2e)),
            ),
            tabs: [
              Tab(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset("lib/assets/icons/helmet.png", width: 25, height: 25),
                    const SizedBox(width: 8),
                    Text("Characters", style: GoogleFonts.playfair(fontSize: 16, fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
              Tab(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset("lib/assets/icons/swords.png", width: 20, height: 20),
                    const SizedBox(width: 8),
                    Text("Weapons", style: GoogleFonts.playfair(fontSize: 16, fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
            ],
          ),

           Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TabBarView(
                children: [
                  buildInventoryGrid(isCharacters: true),
                  buildInventoryGrid(isCharacters: false),
                ],
              ),
            ),
          ),
          const SizedBox(height: 80), ],
      ),
    );
  }

  Widget buildInventoryGrid({required bool isCharacters}) {
    return BlocBuilder<UserCubit, UserState>(
      builder: (context, state) {
        List<Item> items = [];
        if (state is UserLoaded) {
          items = isCharacters ? state.getUserCharacters() : state.getUserWeapons();
        }

        if (items.isEmpty) {
          return Center(
            child: Text(
              isCharacters ? "No characters yet" : "No weapons yet",
              style: GoogleFonts.playfair(color: Colors.brown, fontSize: 18),
            ),
          );
        }

        return GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            mainAxisExtent: 280,
            crossAxisCount: 2,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
          ),
          itemCount: items.length,
          itemBuilder: (context, index) {
            return ItemCard(
              image: items[index].image_url,
              title: items[index].name,
              id: items[index].id,
            );
          },
        );
      },
    );
  }
}