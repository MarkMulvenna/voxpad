import 'package:json_annotation/json_annotation.dart';

import '../../enums/TaskStatus.dart';
import '../../enums/TaskType.dart';
import 'Task.dart';

part 'TaskLaunchApplication.g.dart'; // Add this line

@JsonSerializable(explicitToJson: true)
class TaskLaunchApplication extends Task {
  String filePath;

  TaskLaunchApplication(
      super.id,
      super.name,
      super.description,
      super.taskType,
      super.taskStatus,
      super.image,
      this.filePath,
      );

  factory TaskLaunchApplication.fromJson(Map<String, dynamic> json) => _$TaskLaunchApplicationFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$TaskLaunchApplicationToJson(this);
}
