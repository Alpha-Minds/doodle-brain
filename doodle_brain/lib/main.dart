import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'package:doodle_brain/controllers/cubit/user_cubit.dart';
import 'package:doodle_brain/controllers/quiz/cubit/quiz_cubit.dart';
import 'package:doodle_brain/models/user_model.dart';
import 'package:doodle_brain/services/ItemSecrvice.dart';
import 'package:doodle_brain/store.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  /// 🔹 Initialize Hive
  await Hive.initFlutter();
  Hive.registerAdapter(UserAdapter());

  /// 🔹 Open Hive Boxes
  final box = await Hive.openBox<User>('userBox');
  await Hive.openBox('quizProgress');

  /// 🔹 Load items before app starts
  await ItemService().loadItems();

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => UserCubit(box),
        ),
        BlocProvider(
          create: (context) => QuizCubit(),
        ),
      ],
      child: const DoodleBrain(),
    ),
  );
}

class DoodleBrain extends StatelessWidget {
  const DoodleBrain({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: StoreScreen(),
    );
  }
}