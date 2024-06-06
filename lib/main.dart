import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vox_pad/user_interface/screens/MediaControls.dart';

void main() {
  runApp(MaterialApp(
    home: MediaController(), // Example configuration with 3 columns and 4 rows in portrait, and 4 columns and 3 rows in landscape
  ));
}