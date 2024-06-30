import 'package:flutter/material.dart';
import 'package:vox_pad/user_interface/widgets/dropdown_selector.dart';
import '../../logic/data/enums/TaskType.dart';

class TaskFormFieldsWidget extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final Function(String) onTaskNameSaved;
  final Function(String) onTaskDescriptionSaved;
  final Function(TaskType?) onTaskTypeChanged;
  final Function(String) onTaskImageSaved;
  final TaskType? taskType;

  const TaskFormFieldsWidget({super.key,
    required this.formKey,
    required this.onTaskNameSaved,
    required this.onTaskDescriptionSaved,
    required this.onTaskTypeChanged,
    required this.onTaskImageSaved,
    required this.taskType,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            decoration: const InputDecoration(
              labelText: 'Title',
              labelStyle: TextStyle(color: Colors.white),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
              ),
            ),
            style: const TextStyle(color: Colors.white),
            onSaved: (value) {
              onTaskNameSaved(value!);
            },
          ),
          TextFormField(
            decoration: const InputDecoration(
              labelText: 'Description',
              labelStyle: TextStyle(color: Colors.white),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
              ),
            ),
            style: const TextStyle(color: Colors.white),
            onSaved: (value) {
              onTaskDescriptionSaved(value!);
            },
          ),
          GenericDropdown<TaskType>(
            value: taskType,
            onChanged: onTaskTypeChanged,
            textColor: Colors.white,
            dropdownColor: Colors.black,
            items: TaskType.values,
            itemToString: (TaskType type) => type.toDisplayName(),
            labelText: 'Task Type',
          ),
          TextFormField(
            decoration: const InputDecoration(
              labelText: 'Image',
              labelStyle: TextStyle(color: Colors.white),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
              ),
            ),
            style: const TextStyle(color: Colors.white),
            onSaved: (value) {
              onTaskImageSaved(value!);
            },
          ),
        ],
      ),
    );
  }
}
