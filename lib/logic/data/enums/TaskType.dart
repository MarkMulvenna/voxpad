enum TaskType {
  ApplicationRun,
  MediaInteraction,
  Macro,
  OpenWebsite,
  ThirdPartyIntegration,
}

extension TaskTypeExtension on TaskType {
  String toDisplayName() {
    switch (this) {
      case TaskType.ApplicationRun:
        return 'Application Run';
      case TaskType.MediaInteraction:
        return 'Media Interaction';
      case TaskType.Macro:
        return 'Macro';
      case TaskType.OpenWebsite:
        return 'Open Website';
      case TaskType.ThirdPartyIntegration:
        return 'Third Party Integration';
      default:
        return '';
    }
  }
}
