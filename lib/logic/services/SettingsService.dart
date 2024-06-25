import 'package:flutter/foundation.dart';
import '../data/enums/SettingCategory.dart';
import '../data/enums/SettingsValueModifiers.dart';
import '../data/objects/StateManager.dart';
import '../data/objects/TaskExtenders/Setting.dart';
import 'WebsiteServices.dart';

class SettingsService {
  final WebServices webServices;
  final StateManager stateManager;

  SettingsService(this.webServices, this.stateManager);

  Future<void> fetchAndSetSettings() async {
    try {
      final response = await webServices.getRequest('/settings');
      List<dynamic> settingsJsonList = response['settings'];
      List<Setting> settings = settingsJsonList.map((json) => Setting.fromJson(json)).toList();
      stateManager.settings = settings;
    } catch (e) {
      throw Exception('Failed to fetch settings: $e');
    }
  }

  dynamic getSettingValue(String name, {dynamic defaultValue, SettingsValueModifiers valueModifier = SettingsValueModifiers.None}) {
    var setting = stateManager.settings.firstWhere(
          (setting) => setting.name == name,
      orElse: () => Setting(
        name: name,
        category: SettingCategory.Miscellaneous,
        value: defaultValue,
        valueModifier: valueModifier,
      ),
    );
    if (setting.value != null) {
      return setting.value;
    } else {
      return defaultValue;
    }
  }

  List<Setting> getAllSettings() {
    return stateManager.settings;
  }

  Future<void> addSetting(Setting setting) async {
    try {
      final response = await webServices.postRequest('/settings', setting.toJson());
      Setting createdSetting = Setting.fromJson(response);
      stateManager.addSetting(createdSetting);
    } catch (e) {
      throw Exception('Failed to add setting: $e');
    }
  }

  Future<void> updateSetting(String id, Setting setting) async {
    try {
      await webServices.putRequest('/settings/$id', setting.toJson());
    } catch (e) {
      throw Exception('Failed to update setting: $e');
    }
  }

  Future<void> deleteSetting(String id) async {
    try {
      await webServices.deleteRequest('/settings/$id');
    } catch (e) {
      throw Exception('Failed to delete setting: $e');
    }
  }
}
