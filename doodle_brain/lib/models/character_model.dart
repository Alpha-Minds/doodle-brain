import 'dart:convert';
import 'package:doodle_brain/models/user_model.dart';
import 'package:flutter/services.dart';

class Character {
  final String id;
  final String name;
  final String image_url;
  final int price;

  Character({
    required this.id,
    required this.name,
    required this.image_url,
    required this.price,
  });

  factory Character.fromJson(Map<String, dynamic> json) {
    return Character(
      id: json["id"],
      name: json["name"],
      image_url: json["image_url"],
      price: json["price"],
    );
  }
  static Future<List> loadCharacters() async {
    String data = await rootBundle.loadString('assets/data/users.json');

    List<dynamic> jsonResult = jsonDecode(data);
    return jsonResult.map((e) => Character.fromJson(e)).toList();
  }
}
