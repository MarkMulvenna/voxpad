// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Task.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Task _$TaskFromJson(Map<String, dynamic> json) => Task(
      json['id'] as String,
      json['name'] as String,
      json['description'] as String,
      $enumDecode(_$TaskTypeEnumMap, json['taskType']),
      $enumDecode(_$TaskStatusEnumMap, json['taskStatus']),
      json['image'] as String?,
    );

Map<String, dynamic> _$TaskToJson(Task instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'taskType': _$TaskTypeEnumMap[instance.taskType]!,
      'taskStatus': _$TaskStatusEnumMap[instance.taskStatus]!,
      'image': instance.image,
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
