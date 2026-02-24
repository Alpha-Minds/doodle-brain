import 'package:bloc/bloc.dart';
import 'package:doodle_brain/models/user_model.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:meta/meta.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(UserInitial());
  final Box<User> box = Hive.box<User>('userBox');

  void loadUser() {
    final user = box.get('current_user');

    if (user != null) {
      emit(UserLoaded(user));
    }
  }

  void addItemToInventory(String id) {
    final user = box.get('current_user');
    if (user != null) {
      final updateUser=
      user.copyWith(inventoryItemsIds: [...user.inventoryItemsIds, id]);
      box.put('current_user', updateUser);
      emit(UserLoaded(updateUser));
    }
  }
  void changePointsBy(int points) {
    final user = box.get('current_user');
    if (user != null) {
      final updateUser=
      user.copyWith(points: user.points +points);
      box.put('current_user', updateUser);
      emit(UserLoaded(updateUser));
    }
  }
}
