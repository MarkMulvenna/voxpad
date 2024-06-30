enum SettingCategory {
  General,
  Appearance,
  Layout,
  WebConfiguration,
  Miscellaneous,
}

extension SettingCategoryExtension on SettingCategory {
  String toDisplayName() {
    switch (this) {
      case SettingCategory.General:
        return 'General';
      case SettingCategory.Appearance:
        return 'Appearance';
      case SettingCategory.Layout:
        return 'Layout';
      case SettingCategory.WebConfiguration:
        return 'Web Configuration';
      case SettingCategory.Miscellaneous:
        return 'Miscellaneous';
      default:
        return '';
    }
  }
}
