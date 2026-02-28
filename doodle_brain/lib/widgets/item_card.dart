import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ItemCard extends StatelessWidget {
  final String id;
  final String image;
  final String title;
  final String desc;
  // final bool isEquipped;

  const ItemCard({
    super.key,
    required this.image,
    required this.title,
    required this.id,
    required this.desc,
    // required this.isEquipped,
  });

  @override
  Widget build(BuildContext context) {
    final Color primaryColor = Theme.of(context).colorScheme.primary;

    return Align(
      alignment: Alignment.center,
      child: Container(
        width: 220,
        height: 220,
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        decoration: BoxDecoration(
          border: Border.all(
            color: Color(0xFF1c1c1c).withOpacity(0.9),
            width: 4,
          ),
          borderRadius: BorderRadius.circular(18),
        ),

        child: Column(
          children: [
            ClipRRect(child: Image.asset(image, width: 85, height: 85)),
            Text(
              title,
              style: GoogleFonts.permanentMarker(
                // fredoka
                fontSize: 24,
                letterSpacing: 1.0,
                fontWeight: FontWeight.bold,
                color: Color(0xffff5c5c),
              ),
            ),
            Spacer(),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFFf4b400),
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 10),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
                elevation: 8,
              ),
              onPressed: () {},
              child: Text(
                "EQUIP",
                style: GoogleFonts.baloo2(
                  // patrick hand
                  fontWeight: FontWeight.w700,
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}