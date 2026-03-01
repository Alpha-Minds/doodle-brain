import 'package:doodle_brain/controllers/cubit/user_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class ButtonEquip extends StatelessWidget {
  const ButtonEquip({super.key, required this.itemId});

  final String itemId;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.green,
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 10),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
        elevation: 8,
      ),
      onPressed: () {
        if (itemId.startsWith('c')) {
          context.read<UserCubit>().equipCharacter(itemId);
        } else if (itemId.startsWith('w')) {
          context.read<UserCubit>().equipWeapon(itemId);
        }
      },
      child: Text(
        "EQUIP",
        style: GoogleFonts.baloo2(
          fontWeight: FontWeight.w700,
          fontSize: 18,
          color: Colors.white,
        ),
      ),
    );
  }
}

class ButtonEquipped extends StatelessWidget {
  const ButtonEquipped({super.key, required this.itemId});

  final String itemId;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.grey,
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 10),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
        elevation: 8,
      ),
      onPressed: () {
        null;
      },
      child: Text(
        "EQUIPPED",
        style: GoogleFonts.baloo2(
          fontWeight: FontWeight.w700,
          fontSize: 18,
          color: Colors.white,
        ),
      ),
    );
  }
}
