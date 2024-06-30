import 'package:flutter/material.dart';

class OpenWebsiteWidget extends StatelessWidget {
  final Function(String) onUrlChanged;
  final TextEditingController _urlController = TextEditingController();

  OpenWebsiteWidget({super.key, required this.onUrlChanged});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey.shade800,
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Text(
                'Website URL',
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: TextField(
                  controller: _urlController,
                  style: const TextStyle(color: Colors.white),
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
                  onChanged: (value) {
                    onUrlChanged(value);
                  },
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
