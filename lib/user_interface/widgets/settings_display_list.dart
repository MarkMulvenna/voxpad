import 'package:flutter/material.dart';

class SettingsDisplayList extends StatelessWidget {
  final String label;
  final String value;
  final ValueChanged<String> onChanged;

  const SettingsDisplayList({
    super.key,
    required this.label,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(color: Colors.grey[300]!),
          bottom: BorderSide(color: Colors.grey[300]!),
        ),
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontSize: 18.0,
              color: Colors.black87,
            ),
          ),
          const SizedBox(
            height: 8.0,
          ),
          TextField(
            controller: TextEditingController(text: value),
            onChanged: onChanged,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
                borderSide: BorderSide.none,
              ),
              fillColor: Colors.grey[200],
              filled: true,
              isDense: true,
            ),
            style: const TextStyle(fontSize: 16.0),
          ),
        ],
      ),
    );
  }
}
