import 'package:json_annotation/json_annotation.dart';

import '../../enums/TaskStatus.dart';
import '../../enums/TaskType.dart';
import 'Task.dart';

part 'TaskLaunchApplication.g.dart'; // Add this line

@JsonSerializable(explicitToJson: true)
class TaskLaunchApplication extends Task {
  String filePath;

  TaskLaunchApplication(
      String id,
      String name,
      String description,
      TaskType taskType,
      TaskStatus taskStatus,
      String? image,
      this.filePath,
      ) : super(id, name, description, taskType, taskStatus, image);

  factory TaskLaunchApplication.fromJson(Map<String, dynamic> json) => _$TaskLaunchApplicationFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$TaskLaunchApplicationToJson(this);
}
