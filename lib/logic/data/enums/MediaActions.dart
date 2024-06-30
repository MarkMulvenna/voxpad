enum MediaAction {
  Play,
  Pause,
  Next,
  Previous,
  Stop,
  SetVolume
}

enum VolumeAction {
  VolumeUp,
  VolumeDown,
  VolumeMute,
}

extension MediaActionExtension on MediaAction {
  String toDisplayName() {
    switch (this) {
      case MediaAction.Play:
        return 'Play';
      case MediaAction.Pause:
        return 'Pause';
      case MediaAction.Next:
        return 'Previous';
      case MediaAction.Previous:
        return 'Previous';
      case MediaAction.Stop:
        return 'Stop';
      case MediaAction.SetVolume:
        return 'Set Volume';
    }
  }
}