import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../logic/data/enums/SettingsValueModifiers.dart';
import '../../logic/data/objects/StateManager.dart';
import '../../logic/data/objects/TaskExtenders/Setting.dart';
import '../widgets/settings_category_list.dart';
import '../widgets/settings_display_on_off.dart';
import '../widgets/settings_display_text.dart';
import '../widgets/settings_display_list.dart';
import '../widgets/back_button.dart';
import 'main_menu.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  int selectedCategoryIndex = 0;
  List<Setting> localSettings = [];
  bool settingsChanged = false;

  @override
  void initState() {
    super.initState();
    _initializeLocalSettings();
  }

  void _initializeLocalSettings() {
    final stateManager = Provider.of<StateManager>(context, listen: false);
    localSettings = List<Setting>.from(stateManager.settings.map((setting) => Setting.fromJson(setting.toJson())));
  }

  void _onCategorySelected(int index) {
    setState(() {
      selectedCategoryIndex = index;
    });
  }

  void _onSettingChanged(Setting updatedSetting) {
    final index = localSettings.indexWhere((setting) => setting.id == updatedSetting.id);
    if (index != -1) {
      setState(() {
        localSettings[index] = updatedSetting;
        settingsChanged = true;
      });
    }
  }

  void _saveSettings() async {
    final stateManager = Provider.of<StateManager>(context, listen: false);

    for (final setting in localSettings) {
      final originalSetting = stateManager.settings.firstWhere((s) => s.id == setting.id);
      if (originalSetting.value != setting.value) {
        await stateManager.updateSetting(setting.id!, setting);
        settingsChanged = true;
      }
    }

    if (settingsChanged && mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Settings saved successfully!')),
      );
      setState(() {
        settingsChanged = false;
      });
    }
  }

  Widget _buildSettingsContent(List<Setting> settings) {
    if (settings.isEmpty) {
      return const Center(
        child: Text('No settings available for this category'),
      );
    }

    return Column(
      children: settings.map((setting) {
        switch (setting.valueModifier) {
          case SettingsValueModifiers.TrueFalse:
            return SettingsDisplayOnOff(
              label: setting.name!,
              value: setting.value as bool,
              onChanged: (newValue) {
                setting.value = newValue;
                _onSettingChanged(setting);
              },
            );
          case SettingsValueModifiers.IntOnly:
            return SettingsDisplayText(
              label: setting.name!,
              value: setting.value.toString(),
              intOnly: true,
              maxValue: setting.max,
              onChanged: (newValue) {
                int parsedValue = int.tryParse(newValue) ?? 0;
                if (setting.max != null && parsedValue > setting.max!) {
                  parsedValue = setting.max!;
                }
                setting.value = parsedValue;
                _onSettingChanged(setting);
              },
            );
          case SettingsValueModifiers.List:
            return SettingsDisplayList(
              label: setting.name!,
              value: (setting.value as List<dynamic>).join(', '),
              onChanged: (newValue) {
                setting.value = newValue.split(',').map((e) => e.trim()).toList();
                _onSettingChanged(setting);
              },
            );
          case SettingsValueModifiers.None:
          default:
            return SettingsDisplayText(
              label: setting.name!,
              value: setting.value.toString(),
              intOnly: false,
              onChanged: (newValue) {
                setting.value = newValue;
                _onSettingChanged(setting);
              },
            );
        }
      }).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final stateManager = Provider.of<StateManager>(context);
    final categories = stateManager.settings
        .map((setting) => setting.category.toString().split('.').last)
        .toSet()
        .toList();

    if (categories.isEmpty) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueGrey,
          title: const Row(
            children: [
              BackButtonWidget(destination: MainMenu()),
              SizedBox(width: 8),
              Text('Settings'),
            ],
          ),
        ),
        body: const Center(
          child: Text('No categories available'),
        ),
      );
    }

    final currentCategory = categories[selectedCategoryIndex];
    final settings = localSettings
        .where((setting) => setting.category.toString().split('.').last == currentCategory)
        .toList();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: const Row(
          children: [
            BackButtonWidget(destination: MainMenu()),
            SizedBox(width: 8),
            Text('Settings'),
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
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
                      child: _buildSettingsContent(settings),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Align(
              alignment: Alignment.bottomRight,
              child: ElevatedButton(
                onPressed: _saveSettings,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue, // Button color
                ),
                child: const Text('Save'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
