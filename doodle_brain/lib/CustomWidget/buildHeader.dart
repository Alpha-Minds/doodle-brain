import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/NavigationCubit.dart';
import 'boxDecoration.dart';
import '../controllers/cubit/user_cubit.dart';
import '../controllers/cubit/user_state.dart';

Widget buildHeader(BuildContext context) {
  return BlocBuilder<UserCubit, UserState>(
    builder: (context, state) {
      if (state is UserLoaded) {
        final user = state.user;
        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 16),
          padding: const EdgeInsets.all(12),
          decoration: boxDecoration(),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () => context.read<NavigationCubit>().updateIndex(0),
                child: Image.asset(
                  "lib/assets/image.png",
                  width: 25,
                  height: 25,
                ),
              ),
              const Text(
                "DOODLE DRAW",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.brown,
                ),
              ),
              Row(
                children: [
                  const Icon(Icons.monetization_on, color: Colors.amber),
                  const SizedBox(width: 4),
                  Text("${user.coins}"),
                ],
              ),
            ],
          ),
        );
      }
      return const SizedBox.shrink();
    },
  );
}
