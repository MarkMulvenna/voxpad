import 'package:flutter/material.dart';
import '../../logic/data/enums/TaskType.dart';

class TaskIconWidget extends StatelessWidget {
  final TaskType? taskType;

  const TaskIconWidget({super.key, this.taskType});

  @override
  Widget build(BuildContext context) {
    IconData iconData;
    switch (taskType) {
      case TaskType.ApplicationRun:
        iconData = Icons.rocket_launch;
        break;
      case TaskType.MediaInteraction:
        iconData = Icons.music_note;
        break;
      case TaskType.Macro:
        iconData = Icons.keyboard;
        break;
      case TaskType.OpenWebsite:
        iconData = Icons.language;
        break;
      default:
        iconData = Icons.rocket_launch;
    }

    return Container(
      width: 100,
      height: 100,
      color: Colors.white,
      child: Center(
        child: Icon(
          iconData,
          size: 50,
          color: Colors.black,
        ),
      ),
    );
  }
}
