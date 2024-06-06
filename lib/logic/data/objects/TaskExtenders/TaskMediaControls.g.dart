// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'TaskMediaControls.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TaskMediaControls _$TaskMediaControlsFromJson(Map<String, dynamic> json) =>
    TaskMediaControls(
      json['id'] as String,
      json['name'] as String,
      json['description'] as String,
      $enumDecode(_$TaskTypeEnumMap, json['taskType']),
      $enumDecode(_$TaskStatusEnumMap, json['taskStatus']),
      json['image'] as String?,
      (json['mediaActions'] as List<dynamic>)
          .map((e) => $enumDecode(_$MediaActionEnumMap, e))
          .toList(),
    );

Map<String, dynamic> _$TaskMediaControlsToJson(TaskMediaControls instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'taskType': _$TaskTypeEnumMap[instance.taskType]!,
      'taskStatus': _$TaskStatusEnumMap[instance.taskStatus]!,
      'image': instance.image,
      'mediaActions':
          instance.mediaActions.map((e) => _$MediaActionEnumMap[e]!).toList(),
    };

const _$TaskTypeEnumMap = {
  TaskType.ApplicationRun: 'ApplicationRun',
  TaskType.MediaInteraction: 'MediaInteraction',
  TaskType.Macro: 'Macro',
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
