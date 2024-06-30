import 'package:flutter/material.dart';

class GenericDropdown<T> extends StatelessWidget {
  final T? value;
  final ValueChanged<T?> onChanged;
  final Color dropdownColor;
  final Color textColor;
  final String labelText;
  final List<T> items;
  final String Function(T) itemToString;

  const GenericDropdown({
    super.key,
    required this.value,
    required this.onChanged,
    this.dropdownColor = Colors.black,
    this.textColor = Colors.white,
    this.labelText = 'Select an option',
    required this.items,
    required this.itemToString,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<T>(
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: TextStyle(color: textColor),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: textColor),
        ),
      ),
      style: TextStyle(color: textColor),
      dropdownColor: dropdownColor,
      value: value,
      onChanged: onChanged,
      items: items.map((T item) {
        return DropdownMenuItem<T>(
          value: item,
          child: Text(itemToString(item), style: TextStyle(color: textColor)),
        );
      }).toList(),
    );
  }
}
