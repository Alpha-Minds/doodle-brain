import 'dart:convert';
import 'package:flutter/services.dart';

class Item {
  final String id;
  final String name;
  final String image_url;
  final int price;

  Item({
    required this.id,
    required this.name,
    required this.image_url,
    required this.price,
  });
  /// function that convert json to an item object
  factory Item.fromJson(Map<String, dynamic> json) {
    return Item(
      id: json["id"],
      name: json["name"],
      image_url: json["image_url"],
      price: json["price"],
    );
  }
}
