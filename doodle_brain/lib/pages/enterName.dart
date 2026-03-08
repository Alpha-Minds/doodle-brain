import 'package:doodle_brain/CustomWidget/boxDecoration.dart';
import 'package:doodle_brain/controllers/cubit/user_cubit.dart';
import 'package:doodle_brain/controllers/cubit/user_state.dart';
import 'package:doodle_brain/models/enums.dart';
import 'package:doodle_brain/models/themes.dart';
import 'package:doodle_brain/pages/GameHomeScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';

class Entername extends StatelessWidget {
  Entername({super.key});

  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: fightTheme[Topic.general]!,
      child: Scaffold(
        body: Stack(
          children: [
            Positioned.fill(
              child: Image.asset(
                "lib/assets/graphics/background/1.png",
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    decoration: boxDecoration(),
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        children: [
                          Text(
                            "Enter your name",
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextField(
                            controller: _controller,
                            decoration: InputDecoration(
                              hintText: "Ex: warrior",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 150),
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: BlocBuilder<UserCubit, UserState>(
                      builder: (context, state) {
                        return ElevatedButton(
                          onPressed: state is UserLoaded
                              ? () async {
                                  FocusScope.of(context).unfocus();
                                  String name = _controller.text.trim();
                                  if (name.isEmpty) name = "warrior";

                                  await context.read<UserCubit>().changeName(
                                    name,
                                  );
                                  Hive.box('settings').put('seenOnboard', true);

                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (_) => GameHomeScreen(),
                                    ),
                                  );
                                }
                              : null, // disables button while loading
                          child: Text("Get Started"),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
