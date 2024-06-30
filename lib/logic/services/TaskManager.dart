import 'package:vox_pad/logic/data/objects/TaskExtenders/TaskMediaControls.dart';
import '../../logic/data/enums/TaskType.dart';
import '../../logic/data/enums/TaskStatus.dart';
import '../../logic/data/objects/TaskExtenders/TaskLaunchApplication.dart';
import '../../logic/data/objects/TaskExtenders/TaskOpenWebsite.dart';
import '../../logic/data/objects/TaskExtenders/TaskMacro.dart';
import '../data/enums/MediaActions.dart';

class TaskManager {
  Future<Map<String, dynamic>> createTaskJson({
    required String name,
    required String description,
    required TaskType taskType,
    required TaskStatus taskStatus,
    required String? image,
    String? appDirectory,
    String? webURL,
    MediaAction? mediaAction,
    VolumeAction? volumeAction,
    List<String>? keystrokes,
  }) async {
    final verificationResult = await verifyTask(name, description, taskType, taskStatus, image);

    if (!verificationResult['success']) {
      return {"Error": verificationResult['message']};
    }

    switch (taskType) {
      case TaskType.ApplicationRun:
        return verifyAndSaveLaunchApplicationTask(name, description, taskType, taskStatus, image, appDirectory);
      case TaskType.MediaInteraction:
        return verifyAndSaveMediaInteractionTask(name, description, taskType, taskStatus, image, mediaAction, volumeAction);
      case TaskType.Macro:
        return verifyAndSaveMacroTask(name, description, taskType, taskStatus, image, keystrokes);
      case TaskType.OpenWebsite:
        return verifyAndSaveOpenWebsiteTask(name, description, taskType, taskStatus, image, webURL);
      default:
        return {"Error" : "Task Type could not be determined"};
    }
  }

  Future<Map<String, dynamic>> createLaunchApplicationTaskJson(String name, String description, TaskType taskType, TaskStatus taskStatus, String? image, String? appDirectory) async {
    return TaskLaunchApplication(
      '',
      name,
      description,
      taskType,
      taskStatus,
      image,
      appDirectory!,
    ).toJson();
  }

  Future<Map<String, dynamic>> createOpenWebsiteTaskJson(String name, String description, TaskType taskType, TaskStatus taskStatus, String? image, String? webURL) async {
    return TaskOpenWebsite(
      '',
      name,
      description,
      taskType,
      taskStatus,
      image,
      webURL!,
    ).toJson();
  }

  Future<Map<String, dynamic>> createMacroTaskJson(String name, String description, TaskType taskType, TaskStatus taskStatus, String? image, List<String>? keystrokes) async {
    return TaskMacro(
      '',
      name,
      description,
      taskType,
      taskStatus,
      image,
      keystrokes!,
    ).toJson();
  }

  Future<Map<String, dynamic>> createMediaTaskJson(String name, String description, TaskType taskType, TaskStatus taskStatus, String? image, MediaAction? mediaAction, VolumeAction? volumeAction) async {
    return TaskMediaControls(
      '',
      name,
      description,
      taskType,
      taskStatus,
      image,
      mediaAction!,
      volumeAction!,
    ).toJson();
  }

  Future<Map<String, dynamic>> verifyTask(
      String name,
      String description,
      TaskType? taskType,
      TaskStatus? taskStatus,
      String? image,
      ) async {
    if (name.isEmpty || description.isEmpty) {
      return {"success": false, "message": "Name or description is empty."};
    }

    if (taskType == null) {
      return {"success": false, "message": "Task type is not specified."};
    }

    if (taskStatus == null) {
      return {"success": false, "message": "Task status is not specified."};
    }

    if (image == null || image.isEmpty) {
      return {"success": false, "message": "Image is not specified."};
    }

    if (description.length > 500) {
      return {"success": false, "message": "Description is too long."};
    }

    if (name.length > 100) {
      return {"success": false, "message": "Name is too long."};
    }

    return {"success": true, "message": "Validation passed."};
  }

  Future<Map<String, dynamic>> verifyAndSaveLaunchApplicationTask(String name, String description, TaskType taskType, TaskStatus taskStatus, String? image, String? appDirectory) async {
    final windowsRegex = RegExp(r'^[a-zA-Z]:\\(?:[^\\/:*?"<>|\r\n]+\\)*[^\\/:*?"<>|\r\n]*$');
    if (appDirectory == null || appDirectory.isEmpty || !windowsRegex.hasMatch(appDirectory)) {
      return {"Error": "Directory specified is unspecified or invalid."};
    }
    return createLaunchApplicationTaskJson(name, description, taskType, taskStatus, image, appDirectory);
  }

  Future<Map<String, dynamic>> verifyAndSaveMediaInteractionTask(String name, String description, TaskType taskType, TaskStatus taskStatus, String? image, MediaAction? mediaAction, VolumeAction? volumeAction) async {
    if (mediaAction == null) {
      return {"Error": "Media action not specified"};
    }

    if (mediaAction == MediaAction.SetVolume && volumeAction == null) {
      return {"Error": "Volume action not specified"};
    }

    return createMediaTaskJson(name, description, taskType, taskStatus, image, mediaAction, volumeAction);
  }

  Future<Map<String, dynamic>> verifyAndSaveMacroTask(String name, String description, TaskType taskType, TaskStatus taskStatus, String? image, List<String>? keystrokes) async {
    if (keystrokes == null || keystrokes.isEmpty) {
      return {"Error": "Macro Keys is empty or null"};
    }

    return createMacroTaskJson(name, description, taskType, taskStatus, image, keystrokes);
  }

  Future<Map<String, dynamic>> verifyAndSaveOpenWebsiteTask(String name, String description, TaskType taskType, TaskStatus taskStatus, String? image, String? webURL) async {
    final urlRegex = RegExp(r'^(https?:\/\/)?(([a-zA-Z0-9\-_]+\.)+[a-zA-Z]{2,})(:\d+)?(\/[a-zA-Z0-9\-_\.\/]*)?(\?[a-zA-Z0-9\-_=&]*)?$');
    if (webURL == null || !urlRegex.hasMatch(webURL)) {
      return {"Error": "Web URL is unspecified or invalid"};
    }
    return createOpenWebsiteTaskJson(name, description, taskType, taskStatus, image, webURL);
  }
}
