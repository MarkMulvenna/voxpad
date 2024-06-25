import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SettingsDisplayText extends StatefulWidget {
  final String label;
  final String value;
  final bool intOnly;
  final int? maxValue;
  final ValueChanged<String> onChanged;

  const SettingsDisplayText({
    super.key,
    required this.label,
    required this.value,
    required this.intOnly,
    this.maxValue,
    required this.onChanged,
  });

  @override
  _SettingsDisplayTextState createState() => _SettingsDisplayTextState();
}

class _SettingsDisplayTextState extends State<SettingsDisplayText> {
  late TextEditingController _controller;
  late FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.value);
    _focusNode = FocusNode();

    _focusNode.addListener(() {
      if (!_focusNode.hasFocus) {
        _handleChange(_controller.text);
      }
    });
  }

  @override
  void didUpdateWidget(covariant SettingsDisplayText oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.value != _controller.text) {
      _controller.text = widget.value;
    }
  }

  void _handleChange(String newValue) {
    if (widget.intOnly && widget.maxValue != null) {
      int intValue = int.tryParse(newValue) ?? widget.maxValue!;
      if (intValue > widget.maxValue!) {
        intValue = widget.maxValue!;
        _controller.text = intValue.toString();
      }
      widget.onChanged(intValue.toString());
    } else {
      widget.onChanged(newValue);
    }
  }

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
            widget.label,
            style: const TextStyle(
              fontSize: 18.0,
              color: Colors.black87,
            ),
          ),
          SizedBox(
            width: 150.0,
            child: TextField(
              focusNode: _focusNode,
              controller: _controller,
              keyboardType: widget.intOnly ? TextInputType.number : TextInputType.text,
              inputFormatters: widget.intOnly
                  ? <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly]
                  : <TextInputFormatter>[],
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

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }
}
