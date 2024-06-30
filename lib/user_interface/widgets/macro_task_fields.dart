import 'package:flutter/material.dart';
import 'keystroke_dropdown_widget.dart';

class MacroTaskWidget extends StatefulWidget {
  final Function(List<String>) onKeystrokesChanged;

  const MacroTaskWidget({super.key, required this.onKeystrokesChanged});

  @override
  MacroTaskWidgetState createState() => MacroTaskWidgetState();
}

class MacroTaskWidgetState extends State<MacroTaskWidget> {
  final List<String> _keystrokes = [''];

  void _addDropdown() {
    setState(() {
      _keystrokes.add('');
    });
  }

  void _updateKeystroke(int index, String newKeystroke) {
    setState(() {
      _keystrokes[index] = newKeystroke;
      widget.onKeystrokesChanged(_keystrokes);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey.shade800,
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _keystrokes.length,
              itemBuilder: (context, index) {
                return KeystrokeDropdownWidget(
                  value: _keystrokes[index],
                  onChanged: (newValue) {
                    _updateKeystroke(index, newValue!);
                  },
                );
              },
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: FloatingActionButton(
              onPressed: _addDropdown,
              backgroundColor: Colors.purple,
              child: const Icon(Icons.add),
            ),
          ),
        ],
      ),
    );
  }
}
