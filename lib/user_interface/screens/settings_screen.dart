import 'package:flutter/material.dart';
import 'package:vox_pad/user_interface/widgets/settings_category_list.dart';
import 'package:vox_pad/user_interface/widgets/settings_display_on_off.dart';
import 'package:vox_pad/user_interface/widgets/settings_display_text.dart';

import '../widgets/back_button.dart';
import 'main_menu.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  int selectedCategoryIndex = 0;
  final List<String> categories = [
    'General',
    'Account',
    'Notifications',
    'Privacy',
    'About',
  ];

  final Map<String, String> settingsValues = {
    'Setting 1': 'Value 1',
    'Setting 2': 'Value 2',
    'Setting 3': 'Value 3',
  };

  final Map<String, bool> switchValues = {
    'Toggle 1': true,
    'Toggle 2': false,
  };

  void _onCategorySelected(int index) {
    setState(() {
      selectedCategoryIndex = index;
    });
  }

  void _onSettingChanged(String key, String value) {
    setState(() {
      settingsValues[key] = value;
    });
  }

  void _onSwitchChanged(String key, bool value) {
    setState(() {
      switchValues[key] = value;
    });
  }

  Widget _buildSettingsContent() {
    if (selectedCategoryIndex == 0) {
      // General category
      return Column(
        children: [
          SettingsDisplayText(
            label: 'Setting 1',
            value: settingsValues['Setting 1']!,
            intOnly: false,
            onChanged: (newValue) => _onSettingChanged('Setting 1', newValue),
          ),
          SettingsDisplayText(
            label: 'Setting 2',
            value: settingsValues['Setting 2']!,
            intOnly: true,
            onChanged: (newValue) => _onSettingChanged('Setting 2', newValue),
          ),
          SettingsDisplayText(
            label: 'Setting 3',
            value: settingsValues['Setting 3']!,
            intOnly: false,
            onChanged: (newValue) => _onSettingChanged('Setting 3', newValue),
          ),
          SettingsDisplayOnOff(
            label: 'Toggle 1',
            value: switchValues['Toggle 1']!,
            onChanged: (newValue) => _onSwitchChanged('Toggle 1', newValue),
          ),
          SettingsDisplayOnOff(
            label: 'Toggle 2',
            value: switchValues['Toggle 2']!,
            onChanged: (newValue) => _onSwitchChanged('Toggle 2', newValue),
          ),
        ],
      );
    } else {
      // Placeholder for other categories
      return Center(
        child: Text(
          'Settings for ${categories[selectedCategoryIndex]}',
          style: const TextStyle(fontSize: 24),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: const Row(
          children: [
            BackButtonWidget(destination: MainMenu(columns: 4, rows: 3)),
            SizedBox(width: 8),
            Text('Settings'),
          ],
        ),
      ),
      body: Row(
        children: [
          // Left part - Categories
          Container(
            width: MediaQuery.of(context).size.width * 0.25,
            color: Colors.grey[200],
            child: SettingsCategoryList(
              categories: categories,
              onCategorySelected: _onCategorySelected,
              selectedIndex: selectedCategoryIndex,
            ),
          ),
          // Right part - Settings widgets
          Expanded(
            child: Container(
              color: Colors.grey[100],
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: _buildSettingsContent(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
