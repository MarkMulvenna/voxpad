// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Setting.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Setting _$SettingFromJson(Map<String, dynamic> json) => Setting(
      id: json['id'] as String?,
      name: json['name'] as String?,
      description: json['description'] as String?,
      category:
          $enumDecodeNullable(_$SettingCategoryEnumMap, json['category']) ??
              SettingCategory.Miscellaneous,
      value: json['value'],
      valueModifier: $enumDecodeNullable(
              _$SettingsValueModifiersEnumMap, json['valueModifier']) ??
          SettingsValueModifiers.None,
    );

Map<String, dynamic> _$SettingToJson(Setting instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'category': _$SettingCategoryEnumMap[instance.category]!,
      'value': instance.value,
      'valueModifier': _$SettingsValueModifiersEnumMap[instance.valueModifier]!,
    };

const _$SettingCategoryEnumMap = {
  SettingCategory.General: 'General',
  SettingCategory.Appearance: 'Appearance',
  SettingCategory.Layout: 'Layout',
  SettingCategory.WebConfiguration: 'WebConfiguration',
  SettingCategory.Miscellaneous: 'Miscellaneous',
};

const _$SettingsValueModifiersEnumMap = {
  SettingsValueModifiers.TrueFalse: 'TrueFalse',
  SettingsValueModifiers.IntOnly: 'IntOnly',
  SettingsValueModifiers.MappedValue: 'MappedValue',
  SettingsValueModifiers.None: 'None',
};
