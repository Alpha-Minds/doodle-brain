import 'package:doodle_brain/controllers/cubit/user_cubit.dart';
import 'package:doodle_brain/controllers/quiz/cubit/quiz_cubit.dart';
import 'package:doodle_brain/models/enums.dart';
import 'package:doodle_brain/models/user_model.dart';
import 'package:doodle_brain/pages/fightScreen.dart';
import 'package:doodle_brain/services/ItemSecrvice.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();
  Hive.registerAdapter(UserAdapter());

  final box = await Hive.openBox<User>('userBox');
  await Hive.openBox('quizProgress');

  await ItemService().loadItems();

   runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => UserCubit(box)),
        BlocProvider(create: (context) => QuizCubit()),
      ],
      child: const DoodleBrain(),
    ),
  );
}

class DoodleBrain extends StatelessWidget {
  const DoodleBrain({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Builder(
        builder: (context) {
          return Scaffold(
            body: Column(
              children: [ElevatedButton(
                    onPressed: () async {
                      await context.read<QuizCubit>().selectLevel(
                        Topic.general,
                        Difficulty.easy,
                      );
                       context.read<QuizCubit>().resetCurrentLevel();
                       print("reset");
                    },
                    child: const Text("click reset"),
                  ),
                Center(
                  child: ElevatedButton(
                    onPressed: () async {
                       await context.read<QuizCubit>().selectLevel(
                        Topic.general,
                        Difficulty.easy,
                      );
                
                      context.read<QuizCubit>().nextRound();
                      context.read<QuizCubit>().startTimer();
                
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (_) => Fightscreen(),
                        ),
                      );
                    },
                    child: const Text("click"),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}