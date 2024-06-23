import 'package:flutter/foundation.dart';
import 'package:vox_pad/logic/data/objects/ServerConfiguration.dart';

class StateManager extends ChangeNotifier {
  ServerConfiguration? _serverConfiguration;
  Map<String, dynamic> _settings = {};

  ServerConfiguration? get serverConfiguration => _serverConfiguration;

  set serverConfiguration(ServerConfiguration? configuration) {
    _serverConfiguration = configuration;
    notifyListeners();
  }

  Map<String, dynamic> get settings => _settings;

  set settings(Map<String, dynamic> settings) {
    _settings = settings;
    notifyListeners();
  }

  void updateSetting(String key, dynamic value) {
    _settings[key] = value;
    notifyListeners();
  }

}
