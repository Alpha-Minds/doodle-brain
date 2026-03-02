import 'package:equatable/equatable.dart';
import 'package:hive_flutter/hive_flutter.dart';
part 'user_model.g.dart';

@HiveType(typeId: 0)
class User extends HiveObject with EquatableMixin {

  @HiveField(0)
  final String name;

  @HiveField(1)
  final int points;

  @HiveField(2)
  final int coins;

  @HiveField(3)
  final List<String> inventoryItemsIds;

  @HiveField(4)
  final String equippedCharacter;

  @HiveField(5)
  final String? equippedWeapon;

  User({
    required this.name,
    required this.points,
    required this.coins,
    required this.inventoryItemsIds,
    required this.equippedCharacter,
    this.equippedWeapon,
  });

  User copyWith({
    String? name,
    int? points,
    int? coins,
    List<String>? inventoryItemsIds,
    String? equippedCharacter,
    String? equippedWeapon,
  }) {
    return User(
      name: name ?? this.name,
      points: points ?? this.points,
      coins: coins ?? this.coins,
      inventoryItemsIds:
          inventoryItemsIds ?? this.inventoryItemsIds,
      equippedCharacter: equippedCharacter ?? this.equippedCharacter,
      equippedWeapon: equippedWeapon ?? this.equippedWeapon,
    );
  }

  
  
  @override
 List<Object?> get props => [
        name,
        points,
        coins,
        inventoryItemsIds,
        equippedCharacter,
        equippedWeapon,
      ]; 
}