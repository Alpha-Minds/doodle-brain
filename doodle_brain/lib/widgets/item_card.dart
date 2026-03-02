import 'package:doodle_brain/controllers/cubit/user_cubit.dart';
import 'package:doodle_brain/controllers/cubit/user_state.dart';
import 'package:doodle_brain/widgets/equip_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class ItemCard extends StatelessWidget {
  final String id;
  final String image;
  final String title;

  const ItemCard({
    super.key,
    required this.image,
    required this.title,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Container(
        width: 220,
        height: 220,
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        decoration: BoxDecoration(
          color: Color(0xffe6d2b5),
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 2),
              blurRadius: 10,
              spreadRadius: 3,
              color: Color(0xff6b4a34),
            ),
          ],
          border: Border.all(color: Color(0xFF2a1b14), width: 4),
          borderRadius: BorderRadius.circular(18),
        ),

        child: Column(
          children: [
            ClipRRect(child: Image.asset(image, width: 120, height: 75)),
            Text(
              title,
              style: GoogleFonts.uncialAntiqua(
                // fredoka
                fontSize: 30,
                letterSpacing: 1.0,
                fontWeight: FontWeight.bold,
                color: Color(0xff4a2e1f),
              ),
            ),
            Spacer(),
            BlocBuilder<UserCubit, UserState>(
              builder: (context, state) {
                bool isEquipped = false;
                if (state is UserLoaded) {
                  if (id.startsWith('c')) {
                    isEquipped = (state.getEquippedCharacter().id == id)
                        ? true
                        : false;
                  } else if (id.startsWith('w')) {
                    isEquipped = (state.getEquippedWeapon()?.id == id)
                        ? true
                        : false;
                  }
                }
                return isEquipped
                    ? ButtonEquipped(itemId: id)
                    : ButtonEquip(itemId: id);
              },
            ),
          ],
        ),
      ),
    );
  }
}
