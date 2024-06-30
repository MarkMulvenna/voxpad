import '../data/objects/StateManager.dart';
import '../data/objects/TaskExtenders/Task.dart';
import '../data/objects/TaskExtenders/TaskLaunchApplication.dart';
import '../data/objects/TaskExtenders/TaskMacro.dart';
import '../data/objects/TaskExtenders/TaskMediaControls.dart';
import '../data/objects/TaskExtenders/TaskOpenWebsite.dart';
import 'WebsiteServices.dart';

class TaskService {
  final WebServices webServices;
  final StateManager stateManager;

  TaskService(this.webServices, this.stateManager);

  Future<List<Task>> fetchAndSetTasks() async {
    try {
      final response = await webServices.getRequest('/tasks');
      List<dynamic> tasksJsonList = response['tasks'];
      List<Task> tasks = tasksJsonList.map((json) => createTaskFromJson(json)).toList();
      return tasks;
    } catch (e) {
      throw Exception('Failed to fetch tasks: $e');
    }
  }

  Future<void> addTask(Map<String, dynamic> taskJson) async {
    try {
      await webServices.postRequest('/tasks', taskJson);
    } catch (e) {
      throw Exception('Failed to add task: $e');
    }
  }

  Future<void> updateTask(String id, Map<String, dynamic> taskJson) async {
    try {
      await webServices.putRequest('/task/$id', taskJson);
    } catch (e) {
      throw Exception('Failed to update task: $e');
    }
  }

  Future<void> deleteTask(String id) async {
    try {
      await webServices.deleteRequest('/task/$id');
    } catch (e) {
      throw Exception('Failed to delete task: $e');
    }
  }

  Task createTaskFromJson(Map<String, dynamic> json) {
    switch (json['taskType']) {
      case 'ApplicationRun':
        return TaskLaunchApplication.fromJson(json);
      case 'MediaInteraction':
        return TaskMediaControls.fromJson(json);
      case 'Macro':
        return TaskMacro.fromJson(json);
      case 'OpenWebsite':
        return TaskOpenWebsite.fromJson(json);
      default:
        throw Exception('Unknown task type');
    }
  }
}
