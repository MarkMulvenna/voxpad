import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import '../../services/WebsiteServices.dart';
import 'ServerConfiguration.dart';
import 'TaskExtenders/Setting.dart';

class StateManager extends ChangeNotifier {
  ServerConfiguration? _serverConfiguration;
  List<Setting> _settings = [];
  late WebServices webServices;

  Color _primaryColor = Colors.pink;
  Color _secondaryColor = Colors.blue;

  StateManager() {
    webServices = WebServices('');
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

  void addSetting(Setting setting) {
    _settings.add(setting);
    notifyListeners();
  }

  void updateSetting(String id, Setting setting) {
    int index = _settings.indexWhere((s) => s.id == id);
    if (index != -1) {
      _settings[index] = setting;
      notifyListeners();
    }
  }

  void deleteSetting(String id) {
    _settings.removeWhere((setting) => setting.id == id);
    notifyListeners();
  }

  void updateWebServices(String baseUrl) {
    webServices = WebServices(baseUrl);
    notifyListeners();
  }
}
