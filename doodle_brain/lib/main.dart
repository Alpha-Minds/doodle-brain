import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:doodle_brain/controllers/cubit/user_cubit.dart';
import 'package:doodle_brain/models/user_model.dart';
import 'package:doodle_brain/services/ItemSecrvice.dart';
import 'cubit/NavigationCubit.dart';
import './pages/GameHomeScreen.dart';

void main() async {
   WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();
  if (!Hive.isAdapterRegistered(UserAdapter().typeId)) {
    Hive.registerAdapter(UserAdapter());
  }

  final box = await Hive.openBox<User>('userBox');
  await ItemService().loadItems();

   runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => UserCubit(box)),
         BlocProvider(create: (context) => NavigationCubit()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Doodle Brain',
      theme: ThemeData(primarySwatch: Colors.brown),
       home:  GameHomeScreen(),
    );
  }
}