import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final double width;
  final double height;


  final Color? backgroundColor;


  final Color? foregroundColor;

  final VoidCallback? onPressed;

  const CustomButton({
    super.key,
    required this.text,
    required this.width,
    required this.height,
    this.backgroundColor,
    this.foregroundColor,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    const Color defaultBackground = Color(0xFFF5DEB3);
    const Color defaultForeground = Colors.black;

    final Color bgColor = backgroundColor ?? defaultBackground;
    final Color fgColor = foregroundColor ?? defaultForeground;

    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: bgColor,
          side: BorderSide(color: fgColor, width: 2),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: Text(
          text,
          style: GoogleFonts.baloo2(
            fontWeight: FontWeight.w700,
            fontSize: 16,
            color: fgColor,
          ),
        ),
      ),
    );
  }
}