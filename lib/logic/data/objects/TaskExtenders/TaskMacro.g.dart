// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'TaskMacro.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TaskMacro _$TaskMacroFromJson(Map<String, dynamic> json) => TaskMacro(
      json['id'] as String,
      json['name'] as String,
      json['description'] as String,
      $enumDecode(_$TaskTypeEnumMap, json['taskType']),
      $enumDecode(_$TaskStatusEnumMap, json['taskStatus']),
      json['image'] as String?,
      (json['keys'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$TaskMacroToJson(TaskMacro instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'taskType': _$TaskTypeEnumMap[instance.taskType]!,
      'taskStatus': _$TaskStatusEnumMap[instance.taskStatus]!,
      'image': instance.image,
      'keys': instance.keys,
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
