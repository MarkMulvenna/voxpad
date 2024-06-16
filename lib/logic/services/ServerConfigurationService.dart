import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../data/objects/ServerConfiguration.dart';

class ServerConfigurationService {

  static const String _serverKeyPrefix = 'serverConfig_';

  static Future<void> saveServerConfiguration(String name, ServerConfiguration config) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('$_serverKeyPrefix$name', jsonEncode(config.toJson()));
  }

  static Future<ServerConfiguration?> loadServerConfiguration(String name) async {
    final prefs = await SharedPreferences.getInstance();
    final String? jsonString = prefs.getString('$_serverKeyPrefix$name');
    if (jsonString != null) {
      final Map<String, dynamic> jsonMap = jsonDecode(jsonString);
      return ServerConfiguration.fromJson(jsonMap);
    }
    return null;
  }

  static Future<List<ServerConfiguration>> getAllServerConfigurations() async {
    final prefs = await SharedPreferences.getInstance();
    final keys = prefs.getKeys().where((key) => key.startsWith(_serverKeyPrefix));
    List<ServerConfiguration> configurations = [];
    for (var key in keys) {
      final String? jsonString = prefs.getString(key);
      if (jsonString != null) {
        final Map<String, dynamic> jsonMap = jsonDecode(jsonString);
        configurations.add(ServerConfiguration.fromJson(jsonMap));
      }
    }
    return configurations;
  }

  static Future<void> removeServerConfiguration(String name) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('$_serverKeyPrefix$name');
  }

  static Future<void> clearAllServerConfigurations() async {
    final prefs = await SharedPreferences.getInstance();
    final keys = prefs.getKeys().where((key) => key.startsWith(_serverKeyPrefix));
    for (var key in keys) {
      await prefs.remove(key);
    }
  }
}