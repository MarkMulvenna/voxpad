// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Setting.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Setting _$SettingFromJson(Map<String, dynamic> json) => Setting(
      json['id'] as String,
      json['name'] as String,
      json['description'] as String,
      $enumDecode(_$SettingCategoryEnumMap, json['category']),
      json['value'] as String?,
      json['settingOn'] as bool?,
    );

Map<String, dynamic> _$SettingToJson(Setting instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'category': _$SettingCategoryEnumMap[instance.category]!,
      'value': instance.value,
      'settingOn': instance.settingOn,
    };

const _$SettingCategoryEnumMap = {
  SettingCategory.General: 'General',
  SettingCategory.Appearance: 'Appearance',
  SettingCategory.Layout: 'Layout',
  SettingCategory.WebConfiguration: 'WebConfiguration',
};
