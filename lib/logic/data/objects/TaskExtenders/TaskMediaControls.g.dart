// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'TaskMediaControls.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TaskMediaControls _$TaskMediaControlsFromJson(Map<String, dynamic> json) =>
    TaskMediaControls(
      json['id'] as String?,
      json['name'] as String,
      json['description'] as String,
      $enumDecode(_$TaskTypeEnumMap, json['taskType']),
      $enumDecode(_$TaskStatusEnumMap, json['taskStatus']),
      json['image'] as String?,
      $enumDecode(_$MediaActionEnumMap, json['mediaAction']),
      $enumDecode(_$VolumeActionEnumMap, json['volumeAction']),
    );

Map<String, dynamic> _$TaskMediaControlsToJson(TaskMediaControls instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'taskType': _$TaskTypeEnumMap[instance.taskType]!,
      'taskStatus': _$TaskStatusEnumMap[instance.taskStatus]!,
      'image': instance.image,
      'mediaAction': _$MediaActionEnumMap[instance.mediaAction]!,
      'volumeAction': _$VolumeActionEnumMap[instance.volumeAction]!,
    };

const _$TaskTypeEnumMap = {
  TaskType.ApplicationRun: 'ApplicationRun',
  TaskType.MediaInteraction: 'MediaInteraction',
  TaskType.Macro: 'Macro',
  TaskType.OpenWebsite: 'OpenWebsite',
  TaskType.ThirdPartyIntegration: 'ThirdPartyIntegration',
};

const _$TaskStatusEnumMap = {
  TaskStatus.Completed: 'Completed',
  TaskStatus.Failed: 'Failed',
  TaskStatus.Awaiting: 'Awaiting',
  TaskStatus.Scheduled: 'Scheduled',
};

const _$MediaActionEnumMap = {
  MediaAction.Play: 'Play',
  MediaAction.Pause: 'Pause',
  MediaAction.Next: 'Next',
  MediaAction.Previous: 'Previous',
  MediaAction.Stop: 'Stop',
  MediaAction.SetVolume: 'SetVolume',
};

const _$VolumeActionEnumMap = {
  VolumeAction.VolumeUp: 'VolumeUp',
  VolumeAction.VolumeDown: 'VolumeDown',
  VolumeAction.VolumeMute: 'VolumeMute',
};
