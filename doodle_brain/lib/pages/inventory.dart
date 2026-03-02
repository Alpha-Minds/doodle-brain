import 'package:doodle_brain/models/item_model.dart';
import 'package:doodle_brain/widgets/item_card.dart';
import 'package:doodle_brain/controllers/cubit/user_state.dart';
import 'package:doodle_brain/controllers/cubit/user_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class Inventory extends StatelessWidget {
  Inventory({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("lib/assets/backgrounds/Background.png"),
              fit: BoxFit.cover,
            ),
          ),
        ),
        DefaultTabController(
          length: 2,
          child: SafeArea(
            child: Scaffold(
              backgroundColor: Colors.transparent,
              appBar: AppBar(
                backgroundColor: Colors.transparent,
                title: Container(
                  margin: EdgeInsets.symmetric(vertical: 15),

                  // padding: EdgeInsets.symmetric(horizontal: 150, vertical: 7),
                  child: Column(
                    children: [
                      Container(
                        child: Text(
                          "INVENTORY",
                          style: GoogleFonts.uncialAntiqua(
                            fontSize: 45,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 5,
                            color: Color(0xff2a1b14),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                centerTitle: true,
                bottom: TabBar(
                  labelColor: Color(0xff2a1b14).withOpacity(0.9),
                  unselectedLabelColor: Color(0xff2a1b14).withOpacity(0.65),
                  indicatorWeight: 3,
                  dividerColor: Colors.transparent,
                  overlayColor: MaterialStateProperty.resolveWith<Color?>((
                    Set<MaterialState> states,
                  ) {
                    if (states.contains(MaterialState.hovered))
                      return Colors.black26;
                    if (states.contains(MaterialState.pressed))
                      return Colors.black54;
                    return null; // Default
                  }),
                  indicator: UnderlineTabIndicator(
                    borderRadius: BorderRadius.circular(35),
                    borderSide: BorderSide(width: 3, color: Color(0xffc26a2e)),
                  ),
                  tabs: [
                    Tab(
                      child: Row(
                        children: [
                          Container(
                            margin: EdgeInsets.only(bottom: 3),
                            child: Image.asset(
                              "lib/assets/icons/helmet.png",
                              width: 45,
                              height: 45,
                            ),
                          ),
                          SizedBox(width: 2),
                          Text(
                            "Characters",
                            style: GoogleFonts.playfair(
                              fontSize: 30,
                              fontWeight: FontWeight.w700,
                              letterSpacing: 1.25,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Tab(
                      child: Row(
                        children: [
                          Image.asset(
                            "lib/assets/icons/swords.png",
                            width: 33,
                            height: 33,
                          ),
                          SizedBox(width: 8.5),
                          Text(
                            "Weapons",
                            style: GoogleFonts.playfair(
                              fontSize: 30,
                              fontWeight: FontWeight.w700,
                              letterSpacing: 1.25,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              body: Padding(
                padding: EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Expanded(
                      child: TabBarView(
                        children: [
                          BlocBuilder<UserCubit, UserState>(
                            builder: (BuildContext context, state) {
                              List<Item> characters = [];
                              if (state is UserLoaded) {
                                characters = state.getUserCharacters();
                              }
                              return GridView.builder(
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                      mainAxisExtent: 310,
                                      crossAxisCount: 2,
                                      mainAxisSpacing: 10,
                                      crossAxisSpacing: 10,
                                    ),
                                shrinkWrap: true,
                                itemCount: characters.length,
                                itemBuilder: (context, index) {
                                  return ItemCard(
                                    image: characters[index].image_url,
                                    title: characters[index].name,
                                    id: characters[index].id,
                                  );
                                },
                              );
                            },
                          ),
                          BlocBuilder<UserCubit, UserState>(
                            builder: (BuildContext context, state) {
                              List<Item> weapons = [];
                              if (state is UserLoaded) {
                                weapons = state.getUserWeapons();
                              }
                              return GridView.builder(
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                      mainAxisExtent: 310,
                                      crossAxisCount: 2,
                                      mainAxisSpacing: 10,
                                      crossAxisSpacing: 10,
                                    ),
                                shrinkWrap: true,
                                itemCount: weapons.length,
                                itemBuilder: (context, index) {
                                  return ItemCard(
                                    image: weapons[index].image_url,
                                    title: weapons[index].name,
                                    id: weapons[index].id,
                                  );
                                },
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
