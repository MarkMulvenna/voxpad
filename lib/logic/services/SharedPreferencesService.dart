import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesService {
  static final Map<Type, Function> _saveValueFunctions = {
    String: (SharedPreferences prefs, String key, dynamic value) => prefs.setString(key, value),
    int: (SharedPreferences prefs, String key, dynamic value) => prefs.setInt(key, value),
    bool: (SharedPreferences prefs, String key, dynamic value) => prefs.setBool(key, value),
    double: (SharedPreferences prefs, String key, dynamic value) => prefs.setDouble(key, value),
    List<String>: (SharedPreferences prefs, String key, dynamic value) => prefs.setStringList(key, value),
  };

  static final Map<Type, Function> _getValueFunctions = {
    String: (SharedPreferences prefs, String key) => prefs.getString(key),
    int: (SharedPreferences prefs, String key) => prefs.getInt(key),
    bool: (SharedPreferences prefs, String key) => prefs.getBool(key),
    double: (SharedPreferences prefs, String key) => prefs.getDouble(key),
    List<String>: (SharedPreferences prefs, String key) => prefs.getStringList(key),
  };

  // Save a value (string, int, bool, double, List<String>)
  static Future<void> saveValue<T>(String key, T value) async {
    final prefs = await SharedPreferences.getInstance();
    final saveFunction = _saveValueFunctions[T];
    if (saveFunction != null) {
      await saveFunction(prefs, key, value);
    } else {
      throw ArgumentError("Unsupported type");
    }
  }

  // Retrieve a value (string, int, bool, double, List<String>)
  static Future<T?> getValue<T>(String key) async {
    final prefs = await SharedPreferences.getInstance();
    final getFunction = _getValueFunctions[T];
    if (getFunction != null) {
      return getFunction(prefs, key) as T?;
    } else {
      throw ArgumentError("Unsupported type");
    }
  }

  // Remove a specific key-value pair
  static Future<void> remove(String key) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(key);
  }

  // Clear all key-value pairs
  static Future<void> clear() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }
}
