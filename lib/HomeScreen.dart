import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'store.dart';
import 'navbar.dart';
import 'nav_cubit.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavCubit, int>(
      builder: (context, currentIndex) {
        final List<Widget> pages = const [
          Center(child: Text("Battle")),
          Store(),
          Center(child: Text("Inventory")),
          Center(child: Text("Profile")),
        ];

        return Scaffold(
          extendBody: true,
          body: pages[currentIndex],
          bottomNavigationBar: const CustomNavBar(),
        );
      },
    );
  }
}