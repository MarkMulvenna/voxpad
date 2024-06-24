import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vox_pad/logic/data/objects/StateManager.dart';
import 'package:vox_pad/user_interface/screens/splash_screen.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => StateManager(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: SplashScreen(),
    );
  }
}
