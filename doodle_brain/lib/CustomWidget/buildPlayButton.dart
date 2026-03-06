import 'package:flutter/material.dart';

Widget buildPlayButton() {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 15),
    child: ElevatedButton(
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(200, 60),
        backgroundColor: const Color(0xffC9B2A0),
        foregroundColor: Colors.brown,
        side: const BorderSide(color: Colors.brown, width: 2),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      ),
      onPressed: () {},
      child: const Text(
        "Play",
        style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
      ),
    ),
  );
}
