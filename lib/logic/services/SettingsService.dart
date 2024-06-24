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
      if (response is List) {
        List<Setting> settings = response.map((json) => Setting.fromJson(json as Map<String, dynamic>)).toList();
        stateManager.settings = settings;
      } else {
        throw Exception('Unexpected response format');
      }
    } catch (e) {
      throw Exception('Failed to fetch settings: $e');
    }
  }

  dynamic getSettingValue(String name, {dynamic defaultValue}) {
    var setting = stateManager.settings.firstWhere(
          (setting) => setting.name == name,
      orElse: () => Setting(null, name, null, null, defaultValue),
    );
    return setting.value ?? defaultValue;
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
      stateManager.updateSetting(id, setting);
    } catch (e) {
      throw Exception('Failed to update setting: $e');
    }
  }

  Future<void> deleteSetting(String id) async {
    try {
      await webServices.deleteRequest('/settings/$id');
      stateManager.deleteSetting(id);
    } catch (e) {
      throw Exception('Failed to delete setting: $e');
    }
  }
}
