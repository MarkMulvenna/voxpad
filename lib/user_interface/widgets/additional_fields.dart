import 'package:flutter/material.dart';
import '../../logic/data/enums/MediaActions.dart';
import '../../logic/data/enums/TaskType.dart';
import '../widgets/launch_app_task.dart';
import '../widgets/media_action_task.dart';
import '../widgets/macro_task_fields.dart';
import 'launch_website_widget.dart';

class AdditionalFieldsWidget extends StatelessWidget {
  final TaskType? taskType;
  final Function(String) onDirectoryChanged;
  final Function(String)? onUrlChanged;
  final Function(MediaAction)? onMediaActionChanged;
  final Function(VolumeAction)? onVolumeActionChanged;
  final Function(List<String>)? onKeystrokesChanged;

  const AdditionalFieldsWidget({
    super.key,
    required this.taskType,
    required this.onDirectoryChanged,
    this.onUrlChanged,
    this.onMediaActionChanged,
    this.onVolumeActionChanged,
    this.onKeystrokesChanged,
  });

  @override
  Widget build(BuildContext context) {
    switch (taskType) {
      case TaskType.ApplicationRun:
        return LaunchAppWidget(onDirectoryChanged: onDirectoryChanged);
      case TaskType.MediaInteraction:
        return MediaActionTaskWidget(
          onMediaActionChanged: onMediaActionChanged!,
          onVolumeActionChanged: onVolumeActionChanged!,
        );
      case TaskType.Macro:
        return MacroTaskWidget(onKeystrokesChanged: onKeystrokesChanged!);
      case TaskType.OpenWebsite:
        return OpenWebsiteWidget(onUrlChanged: onUrlChanged!);
      default:
        return const Center(
          child: Text(
            'Additional Fields Widget',
            style: TextStyle(color: Colors.white),
          ),
        );
    }
  }
}
