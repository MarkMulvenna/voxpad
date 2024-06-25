import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import '../data/objects/ServerConfiguration.dart';
import '../data/objects/StateManager.dart';
import 'ServerConfigurationService.dart';
import 'SettingsService.dart';
import 'ThemeManager.dart';

class InitialisationService {
  final ServerConfigurationService serverConfigurationService;
  final StateManager stateManager;
  late SettingsService settingsService;

  InitialisationService(this.serverConfigurationService, this.stateManager) {
    settingsService = SettingsService(stateManager.webServices, stateManager);
  }

  Future<bool> initialise() async {
    try {
      ServerConfiguration? serverConfig = await ServerConfigurationService.getFirstServerConfiguration();
      if (serverConfig != null) {
        stateManager.serverConfiguration = serverConfig;
        String baseUrl = 'http://${serverConfig.host}:${serverConfig.port}/api/v1.0';
        stateManager.updateWebServices(baseUrl);
        settingsService = SettingsService(stateManager.webServices, stateManager);
        if (await stateManager.webServices.testConnection()) {
          bool settingsLoaded = await loadSettingsAndScreens();
          if (settingsLoaded) {
            setThemeColors(settingsService, stateManager);
          }
          return settingsLoaded;
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print('Initialization error: $e');
      }
    }
    return false;
  }

  Future<bool> loadSettingsAndScreens() async {
    try {
      await settingsService.fetchAndSetSettings();
      if (stateManager.settings.isNotEmpty) {
        return true;
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error loading settings: $e');
      }
    }
    return false;
  }
}
