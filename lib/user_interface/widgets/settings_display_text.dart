import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SettingsDisplayText extends StatelessWidget {
  final String label;
  final String value;
  final bool intOnly;
  final ValueChanged<String> onChanged;

  const SettingsDisplayText({super.key, 
    required this.label,
    required this.value,
    required this.intOnly,
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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontSize: 18.0,
              color: Colors.black87,
            ),
          ),
          SizedBox(
            width: 150.0,
            child: TextField(
              controller: TextEditingController(text: value),
              keyboardType: intOnly ? TextInputType.number : TextInputType.text,
              inputFormatters: intOnly
                  ? <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly]
                  : <TextInputFormatter>[],
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
          ),
        ],
      ),
    );
  }
}
