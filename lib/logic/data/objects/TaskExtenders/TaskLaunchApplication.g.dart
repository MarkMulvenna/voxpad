// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'TaskLaunchApplication.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TaskLaunchApplication _$TaskLaunchApplicationFromJson(
        Map<String, dynamic> json) =>
    TaskLaunchApplication(
      json['id'] as String,
      json['name'] as String,
      json['description'] as String,
      $enumDecode(_$TaskTypeEnumMap, json['taskType']),
      $enumDecode(_$TaskStatusEnumMap, json['taskStatus']),
      json['image'] as String?,
      json['filePath'] as String,
    );

Map<String, dynamic> _$TaskLaunchApplicationToJson(
        TaskLaunchApplication instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'taskType': _$TaskTypeEnumMap[instance.taskType]!,
      'taskStatus': _$TaskStatusEnumMap[instance.taskStatus]!,
      'image': instance.image,
      'filePath': instance.filePath,
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
