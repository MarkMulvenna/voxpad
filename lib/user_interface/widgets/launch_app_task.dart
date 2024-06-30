import 'dart:io' show Platform;
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';

class LaunchAppWidget extends StatefulWidget {
  final Function(String) onDirectoryChanged;

  const LaunchAppWidget({super.key, required this.onDirectoryChanged});

  @override
  LaunchAppWidgetState createState() => LaunchAppWidgetState();
}

class LaunchAppWidgetState extends State<LaunchAppWidget> {
  final TextEditingController _directoryController = TextEditingController();

  Future<void> _browseExecutable(BuildContext context) async {
    if (Platform.isWindows) {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['exe', 'bat', 'cmd'],
      );
      if (result != null && result.files.single.path != null) {
        setState(() {
          _directoryController.text = result.files.single.path!;
        });
        widget.onDirectoryChanged(result.files.single.path!);
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Executable browsing is only supported on Windows')),
      );
    }
  }

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
                'App Directory',
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: TextField(
                  controller: _directoryController,
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
                    widget.onDirectoryChanged(value);
                  },
                ),
              ),
              if (Platform.isWindows)
                IconButton(
                  icon: const Icon(Icons.folder_open, color: Colors.white),
                  onPressed: () => _browseExecutable(context),
                ),
            ],
          ),
          const SizedBox(height: 20),
          Center(
            child: Column(
              children: [
                Container(
                  width: 200,
                  height: 200,
                  color: Colors.grey,
                  child: const Icon(
                    Icons.rocket_launch,
                    size: 100,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.purple,
                  ),
                  onPressed: () {
                    // Handle icon load logic here
                  },
                  child: const Text('Use Loaded Icon'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
