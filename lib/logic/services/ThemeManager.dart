import 'package:flutter/material.dart';
import '../data/objects/StateManager.dart';
import 'SettingsService.dart';

void setThemeColors(SettingsService settingsService, StateManager stateManager) {
  String primaryColorString = settingsService.getSettingValue("PrimaryColour", defaultValue: "Colors.pink");
  String secondaryColorString = settingsService.getSettingValue("SecondaryColor", defaultValue: "Colors.blue");

  stateManager.primaryColor = _colorFromString(primaryColorString);
  stateManager.secondaryColor = _colorFromString(secondaryColorString);
}

  Color _colorFromString(String colorString) {
    switch (colorString) {
      case "Colors.pink":
        return Colors.pink;
      case "Colors.blue":
        return Colors.blue;
      case "Colors.red":
        return Colors.red;
      case "Colors.green":
        return Colors.green;
      case "Colors.orange":
        return Colors.orange;
      case "Colors.yellow":
        return Colors.yellow;
      case "Colors.purple":
        return Colors.purple;
      case "Colors.cyan":
        return Colors.cyan;
      case "Colors.teal":
        return Colors.teal;
      case "Colors.indigo":
        return Colors.indigo;
      case "Colors.lime":
        return Colors.lime;
      case "Colors.amber":
        return Colors.amber;
      case "Colors.brown":
        return Colors.brown;
      case "Colors.grey":
        return Colors.grey;
      case "Colors.blueGrey":
        return Colors.blueGrey;
      case "Colors.lightBlue":
        return Colors.lightBlue;
      case "Colors.lightGreen":
        return Colors.lightGreen;
      case "Colors.deepOrange":
        return Colors.deepOrange;
      case "Colors.deepPurple":
        return Colors.deepPurple;
      case "Colors.black":
        return Colors.black;
      case "Colors.white":
        return Colors.white;
      default:
        return Colors.pink;
    }
}
