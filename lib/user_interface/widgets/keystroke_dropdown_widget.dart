import 'package:flutter/material.dart';

class KeystrokeDropdownWidget extends StatelessWidget {
  final String? value;
  final ValueChanged<String?> onChanged;

  const KeystrokeDropdownWidget({
    Key? key,
    required this.value,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dropdownItems = [
      const DropdownMenuItem<String>(
        value: 'alphabet',
        enabled: false,
        child: Text('Alphabet', style: TextStyle(color: Colors.grey)),
      ),
      ...'abcdefghijklmnopqrstuvwxyz'.split('').map((letter) {
        return DropdownMenuItem<String>(
          value: letter,
          child: Text(letter, style: const TextStyle(color: Colors.white)),
        );
      }),
      const DropdownMenuItem<String>(
        value: 'specialCharacters',
        enabled: false,
        child: Text('Special Characters', style: TextStyle(color: Colors.grey)),
      ),
      ...['Ctrl', 'Home', 'Shift', 'Delete', 'Up', 'Down', 'Left', 'Right', 'Win'].map((key) {
        return DropdownMenuItem<String>(
          value: key,
          child: Text(key, style: const TextStyle(color: Colors.white)),
        );
      }),
    ];

    return DropdownButtonFormField<String>(
      value: dropdownItems.any((item) => item.value == value) ? value : null,
      onChanged: onChanged,
      decoration: const InputDecoration(
        filled: true,
        fillColor: Colors.black,
        border: OutlineInputBorder(),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
      ),
      dropdownColor: Colors.black,
      items: dropdownItems,
    );
  }
}
