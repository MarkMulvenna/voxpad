import 'package:json_annotation/json_annotation.dart';
import 'package:vox_pad/logic/data/enums/SettingCategory.dart';

part 'Setting.g.dart';

@JsonSerializable(explicitToJson: true)
class Setting {
  String id;
  String name;
  String description;
  SettingCategory category;
  dynamic value;


  Setting(this.id, this.name, this.description, this.category, this.value);

  factory Setting.fromJson(Map<String, dynamic> json) => _$SettingFromJson(json);
  Map<String, dynamic> toJson() => _$SettingToJson(this);  // Corrected method name
}
