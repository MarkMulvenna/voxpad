import 'package:json_annotation/json_annotation.dart';
import '../../enums/TaskStatus.dart';
import '../../enums/TaskType.dart';

part 'Task.g.dart';

@JsonSerializable(explicitToJson: true)
class Task {
  String? id;
  String name;
  String description;
  TaskType taskType;
  TaskStatus taskStatus;
  String? image;

  Task(this.id, this.name, this.description, this.taskType, this.taskStatus, this.image);

  factory Task.fromJson(Map<String, dynamic> json) => _$TaskFromJson(json);
  Map<String, dynamic> toJson() => _$TaskToJson(this);
}
