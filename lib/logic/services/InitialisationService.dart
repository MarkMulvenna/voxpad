import 'dart:ffi';

import 'package:flutter/services.dart';
import 'package:vox_pad/logic/data/objects/ServerConfiguration.dart';
import 'package:vox_pad/logic/data/objects/StateManager.dart';
import 'package:vox_pad/logic/services/ServerConfigurationService.dart';
import 'package:vox_pad/logic/services/SettingsService.dart';

import 'WebsiteServices.dart';

class InitialisationService {
  final ServerConfigurationService serverConfigurationService;
  final SettingsService settingsService;
  final WebServices webServices;
  ServerConfiguration? serverConfig;

  InitialisationService(
      this.serverConfigurationService, this.settingsService, this.webServices);

  Future<bool> initialise() async {
    try {
      serverConfig =
          await ServerConfigurationService.getFirstServerConfiguration();
      if (serverConfig != null) {
        StateManager().serverConfiguration = serverConfig;
        if (await webServices
            .testConnection('${serverConfig?.host}:${serverConfig?.port}/')) {
          await loadSettingsAndScreens();
        }
      } else {
        //Load connection_screen
      }
    } catch (e) {}
    return true;
  }

  Future<void> loadSettingsAndScreens() async {
    Map<String, dynamic> settings = await settingsService.fetchAllSettings();
    if (settings.isNotEmpty) {
      StateManager().settings = settings;
      //Load the main_menu with the setting "ButtonLayout" default value 3 columns 4 rows
    } else {
      //Notify the user the settings could not be loaded :(
    }
  }
}
