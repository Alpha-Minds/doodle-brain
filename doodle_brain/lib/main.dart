
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

Future<void> main() async {

  WidgetsFlutterBinding.ensureInitialized(); 

  await Hive.initFlutter(); 

 

  runApp(const DoodleBrain());
}

class DoodleBrain extends StatelessWidget {
  const DoodleBrain({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

    );
  }
}