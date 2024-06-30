import 'package:json_annotation/json_annotation.dart';
import '../../enums/TaskStatus.dart';
import '../../enums/TaskType.dart';
import 'Task.dart';

part 'TaskOpenWebsite.g.dart';

@JsonSerializable(explicitToJson: true)
class TaskOpenWebsite extends Task {
  String webURL;

  TaskOpenWebsite(
      super.id,
      super.name,
      super.description,
      super.taskType,
      super.taskStatus,
      super.image,
      this.webURL,
      );

  factory TaskOpenWebsite.fromJson(Map<String, dynamic> json) => _$TaskOpenWebsiteFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$TaskOpenWebsiteToJson(this);
}
