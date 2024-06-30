import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:vox_pad/logic/data/objects/TaskExtenders/Task.dart';
import 'package:vox_pad/logic/services/TaskService.dart';
import '../../services/WebsiteServices.dart';
import '../../services/SettingsService.dart';
import 'ServerConfiguration.dart';
import 'TaskExtenders/Setting.dart';

class StateManager extends ChangeNotifier {
  late WebServices webServices;
  late SettingsService settingsService;
  late TaskService taskService;

  //region Configuration
  ServerConfiguration? _serverConfiguration;

  ServerConfiguration? get serverConfiguration => _serverConfiguration;

  set serverConfiguration(ServerConfiguration? configuration) {
    _serverConfiguration = configuration;
    notifyListeners();
  }

  void updateWebServices(String baseUrl) {
    webServices = WebServices(baseUrl);
    settingsService = SettingsService(webServices, this);
    taskService = TaskService(webServices, this);
    notifyListeners();
  }
  //endregion Configuration

  //region Settings
  List<Setting> _settings = [];

  List<Setting> get settings => _settings;

  set settings(List<Setting> settings) {
    _settings = settings;
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
  //endregion Settings

  //region Tasks
  List<Task> _tasks = [];

  List<Task> get tasks => _tasks;

  set tasks(List<Task> tasks) {
    _tasks = tasks;
    notifyListeners();
  }

  Future<void> fetchTasks() async {
    try {
      final fetchedTasks = await taskService.fetchAndSetTasks();
      _tasks = fetchedTasks;
      notifyListeners();
    } catch (e) {
      print('Failed to fetch tasks: $e');
    }
  }

  Future<void> addTask(Map<String, dynamic> taskJson) async {
    try {
      await taskService.addTask(taskJson);
      final createdTask = await taskService.createTaskFromJson(taskJson);
      _tasks.add(createdTask);
      notifyListeners();
    } catch (e) {
      print('Failed to add task: $e');
    }
  }

  Future<void> updateTask(String id, Map<String, dynamic> taskJson) async {
    try {
      await taskService.updateTask(id, taskJson);
      final updatedTask = await taskService.createTaskFromJson(taskJson);
      int index = _tasks.indexWhere((task) => task.id == id);
      if (index != -1) {
        _tasks[index] = updatedTask;
        notifyListeners();
      }
    } catch (e) {
      print('Failed to update task: $e');
    }
  }

  Future<void> deleteTask(String id) async {
    try {
      await taskService.deleteTask(id);
      _tasks.removeWhere((task) => task.id == id);
      notifyListeners();
    } catch (e) {
      print('Failed to delete task: $e');
    }
  }
  //endregion Tasks

  //region Colors
  Color _primaryColor = Colors.pink;
  Color _secondaryColor = Colors.blue;

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
  //endregion Colors

  StateManager() {
    webServices = WebServices('');
    settingsService = SettingsService(webServices, this);
    taskService = TaskService(webServices, this);
  }
}
