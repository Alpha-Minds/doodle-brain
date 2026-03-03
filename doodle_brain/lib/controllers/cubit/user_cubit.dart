import 'package:doodle_brain/controllers/cubit/user_state.dart';
import 'package:doodle_brain/services/ItemSecrvice.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:doodle_brain/models/user_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

// this is cubit for the user
class UserCubit extends Cubit<UserState> {
  final Box<User> box;

  UserCubit(this.box) : super(UserLoading()){
    loadUser();
  }
  ///function load the user from the database and if it the initialization of the app it will make the init user model
  Future<void> loadUser()async{
    User? user = box.get('currentUser');

  if (user == null) {
    user = User(
      name: 'player',
      points: 0,
      coins: 0,
      inventoryItemsIds: ['c1'],
      equippedCharacter: "c1",
    );

    await box.put('currentUser', user);
  }
  emit(UserLoaded(user));
  }
  ///function for change coins by adding (if you want to buy make the amount negative to subtract)
  Future<void> changeCoins(int amount) async{
    if(state is UserLoaded){
      final current = (state as UserLoaded).user;
      final updated = current.copyWith(coins: current.coins+amount);
      await box.put('currentUser', updated);
      emit(UserLoaded(updated));
    }
  }
  /// function for change points by adding (if the user lose in game make the amount negative to subtract)
  Future<void> changePoints(int amount) async{
    if(state is UserLoaded){
      final current = (state as UserLoaded).user;
      final updated = current.copyWith(points: current.points+amount);
      await box.put('currentUser', updated);
      emit(UserLoaded(updated));
    }
  }
  /// function for buy item and add it to inventory and subtract the price from thr user coins
  Future<bool> buyItem(String itemId) async {
    if (state is UserLoaded) {
      final current = (state as UserLoaded).user;

      if (current.inventoryItemsIds.contains(itemId)) return false;

      final price = ItemService().getItemById(itemId).price;

      if (current.coins < price ) {
      return false;
    }
    await changeCoins(-price);

      String? newWeaponId = current.equippedWeapon;

      if (itemId.startsWith('w') && newWeaponId == null) {
        newWeaponId = itemId;
      }

      final updated = current.copyWith(
        inventoryItemsIds: [...current.inventoryItemsIds, itemId],
        equippedWeapon: newWeaponId,
      );

      await box.put('currentUser', updated);
      emit(UserLoaded(updated));
      return true;
    }
    return false;
  }
  ///function equipped the character from inventory
  Future<void> equipCharacter(String characterId) async {
    if (state is UserLoaded) {
      final current = (state as UserLoaded).user;

      if (!current.inventoryItemsIds.contains(characterId)) return;
      if (!characterId.startsWith('c')) return;

      final updated = current.copyWith(equippedCharacter: characterId);
      await box.put('currentUser', updated);
      emit(UserLoaded(updated));
    }
  }
  ///function equipped the weapon from inventory
  Future<void> equipWeapon(String weaponId) async {
    if (state is UserLoaded) {
      final current = (state as UserLoaded).user;

      if (!current.inventoryItemsIds.contains(weaponId)) return;
      if (!weaponId.startsWith('w')) return;

      final updated = current.copyWith(equippedWeapon: weaponId);
      await box.put('currentUser', updated);
      emit(UserLoaded(updated));
    }
  }
}
