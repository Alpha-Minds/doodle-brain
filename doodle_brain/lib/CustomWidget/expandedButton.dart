 import 'package:flutter/material.dart';

  Widget expandedButton(String label, Color color) {
    return Expanded(
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          foregroundColor: Colors.white,
          side: const BorderSide(color: Color(0xFF3E2723), width: 2),
        ),
        onPressed: () {},
        child: Text(label),
      ),
    );
  }