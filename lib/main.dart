import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'HomeScreen.dart';
import 'nav_cubit.dart';

void main() {
  runApp(
    BlocProvider(
      create: (context) => NavCubit(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}