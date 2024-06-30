import 'package:flutter/material.dart';
import '../../logic/data/enums/MediaActions.dart';
import 'dropdown_selector.dart';
import 'volume_control_widget.dart';

class MediaActionTaskWidget extends StatefulWidget {
  final Function(MediaAction) onMediaActionChanged;
  final Function(VolumeAction) onVolumeActionChanged;

  const MediaActionTaskWidget({
    super.key,
    required this.onMediaActionChanged,
    required this.onVolumeActionChanged,
  });

  @override
  MediaActionTaskWidgetState createState() => MediaActionTaskWidgetState();
}

class MediaActionTaskWidgetState extends State<MediaActionTaskWidget> {
  MediaAction? _selectedMediaAction;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey.shade800,
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GenericDropdown<MediaAction>(
            value: _selectedMediaAction,
            onChanged: (newValue) {
              setState(() {
                _selectedMediaAction = newValue;
              });
              widget.onMediaActionChanged(newValue!);
            },
            textColor: Colors.white,
            dropdownColor: Colors.black,
            items: MediaAction.values,
            itemToString: (MediaAction action) => action.toDisplayName(),
            labelText: 'Media Action',
          ),
          const SizedBox(height: 20),
          if (_selectedMediaAction == MediaAction.SetVolume) ...[
            const Text(
              'Set Volume',
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
            const SizedBox(height: 10),
            VolumeControlWidget(
              onVolumeActionChanged: widget.onVolumeActionChanged,
            ),
          ],
        ],
      ),
    );
  }
}
