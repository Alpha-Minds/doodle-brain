import 'package:flutter/material.dart';
Widget buildCustomRadio(String label, Color color, bool isSelected) {
  return Expanded(
    child: Container(
      height: 45,
      decoration: BoxDecoration(
        color: isSelected ? color : color.withOpacity(0.2), 
         borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: isSelected ? const Color(0xFF3E2723) : Colors.grey.withOpacity(0.5),
          width: isSelected ? 3 : 1,
        ),
      ),
      child: Center(
        child: Text(
          label,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.black54,
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
            fontSize: 16,
          ),
        ),
      ),
    ),
  );
}