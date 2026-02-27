import 'package:doodle_brain/models/item_model.dart';
import 'package:doodle_brain/models/user_model.dart';
import 'package:doodle_brain/services/ItemSecrvice.dart';

sealed class UserState {}

//state for loading if the user isn't loaded
class UserLoading extends UserState {}

//the main state of the user
class UserLoaded extends UserState {
  final User user;
  UserLoaded(this.user);
  ///getter for the equipped character
  Item getEquippedCharacter() {
    return ItemService().getItemById(user.equippedCharacter);
  }
  ///getter for the equipped weapon if you have
  Item? getEquippedWeapon() {
    final id = user.equippedWeapon;
    if (id == null) return null;
    return ItemService().getItemById(id);
  }
  ///function to get all items those are available for buy
  List<Item> getShopItems() {
  final allItems = ItemService().getAllItems();
  return allItems
      .where((item) => !user.inventoryItemsIds.contains(item.id))
      .toList();
}
  ///getter for all the items in the inventory of the user
  List<Item> getUserItems() =>
      ItemService().getItemsByIds(user.inventoryItemsIds);
  ///getter for all the characters in the inventory of the user
  List<Item> getUserCharacters() =>
      getUserItems().where((item) => item.id.startsWith('c')).toList();
  ///getter for all the weapons in the inventory of the user
  List<Item> getUserWeapons() =>
      getUserItems().where((item) => item.id.startsWith('w')).toList();
}
