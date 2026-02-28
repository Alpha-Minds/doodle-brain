import 'dart:convert';
import 'package:doodle_brain/models/item_model.dart';
import 'package:flutter/services.dart';

class ItemService {
  static final ItemService _instance = ItemService._internal();
  factory ItemService() => _instance;

  ItemService._internal();

  List<Item> _items = [];

  ///function read the json file and load all the items in the memory
  Future<void> loadItems() async {
    final jsonString = await rootBundle.loadString('lib/assets/data/items.json');
    final List decoded = json.decode(jsonString);
    _items = decoded.map((item) => Item.fromJson(item)).toList();
  }
  ///function to get all item
  List<Item> getAllItems() {
    return _items;
  }
  ///function to get all the characters 
  List<Item> getAllCharacters() {
    return _items.where((item) => item.id.startsWith('c')).toList();
  }
  ///function to get all the weapons
  List<Item> getAllWeapons() {
    return _items.where((item) => item.id.startsWith('w')).toList();
  }
  ///function to get list of items by ids
  List<Item> getItemsByIds(List<String> ids) {
    return _items.where((item) => ids.contains(item.id)).toList();
  }
  ///function to get an item by id
  Item getItemById(String id) {
    return _items.where((item) => id.contains(item.id)).toList()[0];
  }
}
