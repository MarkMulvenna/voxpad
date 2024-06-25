import 'package:json_annotation/json_annotation.dart';
import '../../enums/TaskStatus.dart';
import '../../enums/TaskType.dart';
import 'Task.dart';

part 'TaskMacro.g.dart';

@JsonSerializable(explicitToJson: true)
class TaskMacro extends Task {
  List<String> keys;

  TaskMacro(
      super.id,
      super.name,
      super.description,
      super.taskType,
      super.taskStatus,
      super.image,
      this.keys,
      );

  factory TaskMacro.fromJson(Map<String, dynamic> json) => _$TaskMacroFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$TaskMacroToJson(this);
}