import 'package:flutter/material.dart';
import '../../logic/data/enums/MediaActions.dart';
import '../../logic/data/enums/TaskType.dart';
import '../../logic/data/enums/TaskStatus.dart';
import '../../logic/services/TaskManager.dart';
import '../widgets/additional_fields.dart';
import '../widgets/task_icon_widget.dart';
import '../widgets/text_form_fields.dart';

class AddNewTaskScreen extends StatefulWidget {
  const AddNewTaskScreen({super.key});

  @override
  AddNewTaskScreenState createState() => AddNewTaskScreenState();
}

class AddNewTaskScreenState extends State<AddNewTaskScreen> {
  final _formKey = GlobalKey<FormState>();
  final TaskManager _taskManager = TaskManager();
  String _taskName = '';
  String _taskDescription = '';
  TaskType? _taskType;
  final TaskStatus _taskStatus = TaskStatus.Awaiting;
  String _taskImage = '';
  String _appDirectory = '';
  String _webURL = '';
  MediaAction? _mediaAction;
  VolumeAction? _volumeAction;
  List<String>? _keystrokes;
  String? _errorMessage;

  void _handleSave() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      final result = await _taskManager.createTaskJson(
        name: _taskName,
        description: _taskDescription,
        taskType: _taskType!,
        taskStatus: _taskStatus,
        image: _taskImage,
        appDirectory: _appDirectory,
        webURL: _webURL,
        mediaAction: _mediaAction,
        volumeAction: _volumeAction,
        keystrokes: _keystrokes,
      );

      if (result.containsKey("Error")) {
        setState(() {
          _errorMessage = result["Error"];
        });
      } else {
        setState(() {
          _errorMessage = null;
        });
        // Handle successful save (e.g., navigate back or clear the form)
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add New Task'),
      ),
      body: Column(
        children: [
          if (_errorMessage != null)
            Container(
              color: Colors.red,
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  const Icon(Icons.error, color: Colors.white),
                  const SizedBox(width: 8.0),
                  Expanded(
                    child: Text(
                      _errorMessage!,
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Task Icon
                  TaskIconWidget(taskType: _taskType),
                  const SizedBox(width: 20),
                  // Task Form Fields
                  Expanded(
                    child: TaskFormFieldsWidget(
                      formKey: _formKey,
                      onTaskNameSaved: (value) {
                        _taskName = value;
                      },
                      onTaskDescriptionSaved: (value) {
                        _taskDescription = value;
                      },
                      onTaskTypeChanged: (newValue) {
                        setState(() {
                          _taskType = newValue!;
                        });
                      },
                      onTaskImageSaved: (value) {
                        _taskImage = value;
                      },
                      taskType: _taskType,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: AdditionalFieldsWidget(
              taskType: _taskType,
              onDirectoryChanged: (value) {
                setState(() {
                  _appDirectory = value;
                });
              },
              onUrlChanged: (value) {
                setState(() {
                  _webURL = value;
                });
              },
              onMediaActionChanged: (value) {
                setState(() {
                  _mediaAction = value;
                });
              },
              onVolumeActionChanged: (value) {
                setState(() {
                  _volumeAction = value;
                });
              },
              onKeystrokesChanged: (value) {
                setState(() {
                  _keystrokes = value;
                });
              },
            ),
          ),
        ],
      ),
      backgroundColor: Colors.black87,
      floatingActionButton: FloatingActionButton(
        onPressed: _handleSave,
        child: const Icon(Icons.save),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: AddNewTaskScreen(),
  ));
}
