import 'package:doodle_brain/controllers/cubit/user_cubit.dart';
import 'package:doodle_brain/models/user_model.dart';
import 'package:doodle_brain/pages/inventory.dart';
import 'package:doodle_brain/services/ItemSecrvice.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();
  Hive.registerAdapter(UserAdapter());

  final box = await Hive.openBox<User>('userBox');

  await ItemService().loadItems();

  runApp(
    BlocProvider(create: (context) => UserCubit(box), child: DoodleBrain()),
  );
}

class DoodleBrain extends StatelessWidget {
  const DoodleBrain({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: Inventory());
  }
}
