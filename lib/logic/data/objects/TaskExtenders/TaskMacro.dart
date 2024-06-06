import 'package:json_annotation/json_annotation.dart';
import '../../enums/TaskStatus.dart';
import '../../enums/TaskType.dart';
import 'Task.dart';

part 'TaskMacro.g.dart';

@JsonSerializable(explicitToJson: true)
class TaskMacro extends Task {
  List<String> keys;

  TaskMacro(
      String id,
      String name,
      String description,
      TaskType taskType,
      TaskStatus taskStatus,
      String? image,
      this.keys,
      ) : super(id, name, description, taskType, taskStatus, image);

  factory TaskMacro.fromJson(Map<String, dynamic> json) => _$TaskMacroFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$TaskMacroToJson(this);
}