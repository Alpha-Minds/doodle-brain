import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';

// Imports الخاصة بالكود الحالي (الخدمات والموديلات)
import 'package:doodle_brain/controllers/cubit/user_cubit.dart';
import 'package:doodle_brain/models/user_model.dart';
import 'package:doodle_brain/services/ItemSecrvice.dart';

// Imports الخاصة بك (التنقل والشاشات)
import 'cubit/NavigationCubit.dart';
import './pages/GameHomeScreen.dart';

void main() async {
  // 1. تأمين تهيئة الفريمورك لأننا نستخدم async
  WidgetsFlutterBinding.ensureInitialized();

  // 2. تهيئة قاعدة البيانات Hive وتحميل البيانات
  await Hive.initFlutter();
  if (!Hive.isAdapterRegistered(UserAdapter().typeId)) {
    Hive.registerAdapter(UserAdapter());
  }

  final box = await Hive.openBox<User>('userBox');
  await ItemService().loadItems();

  // 3. تشغيل التطبيق مع توفير الـ Cubits المطلوبة
  runApp(
    MultiBlocProvider(
      providers: [
        // الـ Cubit الخاص ببيانات المستخدم (من الكود الحالي)
        BlocProvider(create: (context) => UserCubit(box)),
        // الـ Cubit الخاص بالتنقل (من كودك أنت)
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
      // الشاشة الرئيسية هي GameHomeScreen التي تحتوي على الـ NavBar
      home:  GameHomeScreen(),
    );
  }
}