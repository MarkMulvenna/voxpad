import 'package:flutter/material.dart';
import 'package:vox_pad/user_interface/screens/connection_screen.dart'; // Import your connection_screen.dart file

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: ModifyConnectionScreen(), // Update to ConnectionScreen()
    );
  }
}
