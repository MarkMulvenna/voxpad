import 'package:flutter/material.dart';
import '../../logic/data/enums/MediaActions.dart';

class VolumeControlWidget extends StatelessWidget {
  final Function(VolumeAction) onVolumeActionChanged;

  const VolumeControlWidget({super.key, required this.onVolumeActionChanged});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        IconButton(
          icon: const Icon(Icons.volume_off, color: Colors.white),
          onPressed: () {
            onVolumeActionChanged(VolumeAction.VolumeMute);
          },
        ),
        IconButton(
          icon: const Icon(Icons.volume_down, color: Colors.white),
          onPressed: () {
            onVolumeActionChanged(VolumeAction.VolumeDown);
          },
        ),
        IconButton(
          icon: const Icon(Icons.volume_up, color: Colors.white),
          onPressed: () {
            onVolumeActionChanged(VolumeAction.VolumeDown);
          },
        ),
      ],
    );
  }
}
