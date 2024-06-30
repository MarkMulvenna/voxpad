import 'package:json_annotation/json_annotation.dart';

import '../../enums/MediaActions.dart';
import '../../enums/TaskStatus.dart';
import '../../enums/TaskType.dart';
import 'Task.dart';


part 'TaskMediaControls.g.dart';

@JsonSerializable(explicitToJson: true)
class TaskMediaControls extends Task {
  MediaAction mediaAction;
  VolumeAction? volumeAction;

  TaskMediaControls(
      super.id,
      super.name,
      super.description,
      super.taskType,
      super.taskStatus,
      super.image,
      this.mediaAction,
      this.volumeAction,
      );

  factory TaskMediaControls.fromJson(Map<String, dynamic> json) => _$TaskMediaControlsFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$TaskMediaControlsToJson(this);
}
