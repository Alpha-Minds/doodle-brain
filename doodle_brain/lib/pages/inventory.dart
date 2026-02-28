import 'package:doodle_brain/models/item_model.dart';
import 'package:doodle_brain/models/user_model.dart';
import 'package:doodle_brain/widgets/item_card.dart';
import 'package:doodle_brain/controllers/cubit/user_state.dart';
import 'package:doodle_brain/controllers/cubit/user_cubit.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Inventory extends StatelessWidget {
  Inventory({super.key});

  
  

  // final List<Item> items = [
  //   Item(
  //     image: "assets/spartan.png",
  //     title: "Mark",
  //     desc: "armored character imroves your performance in the fight.",
  //     id: "c1",
  //   ),
  //   Item(
  //     image: "assets/weapons.png",
  //     title: "Magic Laser",
  //     desc: "high-quality weapon imroves your performance in the fight.",
  //     id: "w1",
  //   ),
  //   Item(
  //     image: "assets/spartan.png",
  //     title: "Mark",
  //     desc: "armored character imroves your performance in the fight.",
  //     id: "c1",
  //   ),
  //   Item(
  //     image: "assets/weapons.png",
  //     title: "Magic Laser",
  //     desc: "high-quality weapon imroves your performance in the fight.",
  //     id: "w1",
  //   ),
  // ];

  @override
  Widget build(BuildContext context) {

    final Color primaryColor = Theme.of(context).colorScheme.primary;

    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/sketch.jpeg"),
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
                          style: GoogleFonts.permanentMarker(
                            fontSize: 45,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 5,
                            color: Color(0xffff5c5c),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                centerTitle: true,
                bottom: TabBar(
                  labelColor: primaryColor,
                  unselectedLabelColor: primaryColor.withOpacity(0.6),

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
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide(width: 4, color: Color(0xffff5c5c)),
                  ),
                  tabs: [
                    Tab(
                      child: Row(
                        children: [
                          Image.asset(
                            "assets/spartan.png",
                            width: 40,
                            height: 40,
                          ),
                          SizedBox(width: 5),
                          Text(
                            "Characters",
                            style: GoogleFonts.baloo2(
                              fontSize: 25,
                              fontWeight: FontWeight.w700,
                              letterSpacing: 1.5,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Tab(
                      child: Row(
                        children: [
                          Image.asset(
                            "assets/weapons.png",
                            width: 45,
                            height: 45,
                          ),
                          SizedBox(width: 5),
                          Text(
                            "Weapons",
                            style: GoogleFonts.baloo2(
                              fontSize: 25,
                              fontWeight: FontWeight.w700,
                              letterSpacing: 1.5,
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
                          GridView.builder(
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  mainAxisSpacing: 10,
                                  crossAxisSpacing: 10,
                                ),
                            shrinkWrap: true,
                            itemCount: items.length,
                            itemBuilder: (context, index) {
                              return ItemCard(
                                image: items[index].image,
                                title: items[index].title,
                                desc: items[index].desc,
                                id: items[index].id,
                              );
                            },
                          ),
                          GridView.builder(
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                ),
                            shrinkWrap: true,
                            itemCount: items.length,
                            itemBuilder: (context, index) {
                              return ItemCard(
                                image: items[index].image,
                                title: items[index].title,
                                desc: items[index].desc,
                                id: items[index].id,
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