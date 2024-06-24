// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Setting.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Setting _$SettingFromJson(Map<String, dynamic> json) => Setting(
      json['id'] as String?,
      json['name'] as String,
      json['description'] as String?,
      json['category'] as String?,
      json['value'],
    );

Map<String, dynamic> _$SettingToJson(Setting instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'category': instance.category,
      'value': instance.value,
    };
