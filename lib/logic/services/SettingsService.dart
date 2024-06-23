import 'WebsiteServices.dart';

class SettingsService {
  final WebServices webServices;
  Map<String, dynamic> _settings = {};

  SettingsService(this.webServices);

  Future<Map<String, dynamic>> fetchAllSettings() async {
    try {
      final response = await webServices.getRequest('/settings');
      _settings = Map.from(response);
      return _settings;
    } catch (e) {
      throw Exception('Failed to fetch settings: $e');
    }
  }

  dynamic getSetting(String key, [dynamic defaultValue]) {
    if (_settings.containsKey(key)) {
      return _settings[key];
    } else {
      return defaultValue;
    }
  }

  Map<String, dynamic> getAllSettings() {
    return _settings;
  }

  Future<void> addSetting(Map<String, dynamic> setting) async {
    try {
      final response = await webServices.postRequest('/settings', setting);
      _settings[response['id']] = setting;
    } catch (e) {
      throw Exception('Failed to add setting: $e');
    }
  }

  Future<void> updateSetting(String id, Map<String, dynamic> setting) async {
    try {
      await webServices.putRequest('/settings/$id', setting);
      _settings[id] = setting;
    } catch (e) {
      throw Exception('Failed to update setting: $e');
    }
  }

  Future<void> deleteSetting(String id) async {
    try {
      await webServices.deleteRequest('/settings/$id');
      _settings.remove(id);
    } catch (e) {
      throw Exception('Failed to delete setting: $e');
    }
  }
}
