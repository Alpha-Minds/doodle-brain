  import 'package:flutter/material.dart';
  Widget buildPointColumn(String title, String value) {
    return Column(
      children: [
        Text(title),
        Row(
          children: [
            Image.asset("lib/assets/graphics/others/coins.png", width: 20, height: 20),
            Text(value),
          ],
        ),
      ],
    );
  }