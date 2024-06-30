// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'TaskOpenWebsite.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TaskOpenWebsite _$TaskOpenWebsiteFromJson(Map<String, dynamic> json) =>
    TaskOpenWebsite(
      json['id'] as String?,
      json['name'] as String,
      json['description'] as String,
      $enumDecode(_$TaskTypeEnumMap, json['taskType']),
      $enumDecode(_$TaskStatusEnumMap, json['taskStatus']),
      json['image'] as String?,
      json['webURL'] as String,
    );

Map<String, dynamic> _$TaskOpenWebsiteToJson(TaskOpenWebsite instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'taskType': _$TaskTypeEnumMap[instance.taskType]!,
      'taskStatus': _$TaskStatusEnumMap[instance.taskStatus]!,
      'image': instance.image,
      'webURL': instance.webURL,
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
