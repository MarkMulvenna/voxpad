import 'package:flutter/material.dart';
import 'package:vox_pad/logic/data/objects/ServerConfiguration.dart';
import 'package:vox_pad/logic/services/SharedPreferencesService.dart';
import '../../logic/services/NetworkService.dart';

class ModifyConnectionScreen extends StatefulWidget {
  final String initialName;
  final String initialIp;
  final String initialPort;

  const ModifyConnectionScreen({super.key,
    this.initialName = 'Default',
    this.initialIp = '',
    this.initialPort = '5000',
  });

  @override
  _ModifyConnectionScreenState createState() => _ModifyConnectionScreenState();
}

class _ModifyConnectionScreenState extends State<ModifyConnectionScreen> {
  late TextEditingController _nameController;
  late TextEditingController _ipController;
  late TextEditingController _portController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.initialName);
    _ipController = TextEditingController(text: widget.initialIp);
    _portController = TextEditingController(text: widget.initialPort);
    _loadIPAddress();
  }

  void _loadIPAddress() async {
    try {
      String ipAddress = await NetworkService.getIPAddress();
      setState(() {
        _ipController.text = ipAddress;
      });
    } catch (e) {}
  }

  @override
  void dispose() {
    _nameController.dispose();
    _ipController.dispose();
    _portController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Center(
        child: Container(
          width: 300,
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [

              _buildNetworkConfigurationTextbox('Name', _nameController, (value) {}),
              const SizedBox(height: 20),

              _buildNetworkConfigurationTextbox('IP', _ipController, (value) {}),
              const SizedBox(height: 20),

              _buildNetworkConfigurationTextbox('Port', _portController, (value) {}),
              const SizedBox(height: 20),

              ElevatedButton(
                onPressed: () {
                  //SaveConfiguration();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.purple[200],
                  padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 50),
                ),
                child: const Text('Save Configuration'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNetworkConfigurationTextbox(
      String label,
      TextEditingController controller,
      ValueChanged<String> onChanged,
      ) {
    return TextField(
      controller: controller,
      onChanged: onChanged,
      decoration: InputDecoration(
        labelText: label,
        border: const OutlineInputBorder(),
      ),
    );
  }
}

