import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import '../../services/WebsiteServices.dart';
import '../../services/SettingsService.dart';
import 'ServerConfiguration.dart';
import 'TaskExtenders/Setting.dart';

class StateManager extends ChangeNotifier {
  ServerConfiguration? _serverConfiguration;
  List<Setting> _settings = [];
  late WebServices webServices;
  late SettingsService settingsService;

  Color _primaryColor = Colors.pink;
  Color _secondaryColor = Colors.blue;

  StateManager() {
    webServices = WebServices('');
    settingsService = SettingsService(webServices, this);
  }

  ServerConfiguration? get serverConfiguration => _serverConfiguration;

  set serverConfiguration(ServerConfiguration? configuration) {
    _serverConfiguration = configuration;
    notifyListeners();
  }

  List<Setting> get settings => _settings;

  set settings(List<Setting> settings) {
    _settings = settings;
    notifyListeners();
  }

  Color get primaryColor => _primaryColor;

  set primaryColor(Color color) {
    _primaryColor = color;
    notifyListeners();
  }

  Color get secondaryColor => _secondaryColor;

  set secondaryColor(Color color) {
    _secondaryColor = color;
    notifyListeners();
  }

  void addSetting(Setting setting) async {
    try {
      await settingsService.addSetting(setting);
      _settings.add(setting);
      notifyListeners();
    } catch (e) {
      print('Failed to add setting: $e');
    }
  }

  Future<void> updateSetting(String id, Setting setting) async {
    try {
      await settingsService.updateSetting(id, setting);
      int index = _settings.indexWhere((s) => s.id == id);
      if (index != -1) {
        _settings[index] = setting;
        notifyListeners();
      }
    } catch (e) {
      print('Failed to update setting: $e');
    }
  }

  void deleteSetting(String id) async {
    try {
      await settingsService.deleteSetting(id);
      _settings.removeWhere((setting) => setting.id == id);
      notifyListeners();
    } catch (e) {
      print('Failed to delete setting: $e');
    }
  }

  void updateWebServices(String baseUrl) {
    webServices = WebServices(baseUrl);
    settingsService = SettingsService(webServices, this);
    notifyListeners();
  }
}
