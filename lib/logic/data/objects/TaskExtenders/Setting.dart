import 'package:json_annotation/json_annotation.dart';
import '../../enums/SettingCategory.dart';
import '../../enums/SettingsValueModifiers.dart';

part 'Setting.g.dart';

@JsonSerializable(explicitToJson: true)
class Setting {
  String? id;
  String? name;
  String? description;
  SettingCategory category;
  dynamic value;
  SettingsValueModifiers valueModifier;

  Setting({
    this.id,
    this.name,
    this.description,
    this.category = SettingCategory.Miscellaneous,
    this.value,
    this.valueModifier = SettingsValueModifiers.None,
  });

  factory Setting.fromJson(Map<String, dynamic> json) => _$SettingFromJson(json);
  Map<String, dynamic> toJson() => _$SettingToJson(this);
}
