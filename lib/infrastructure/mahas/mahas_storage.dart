// import 'package:get_storage/get_storage.dart';
// import 'package:hr_portal/app/mahas/models/color_theme_model.dart';
// import 'package:hr_portal/app/models/menu_profile_model.dart';

// class MahasStorage {
//   static GetStorage box = GetStorage();
//   // storage
//   static const String themeColor = "theme_color";
//   static const String appName = "app_name";
//   static const String historyProfile = "history_profile";
//   static const String profileMenu = "profile_menu";

//   static void clearAll() {
//     box.erase();
//   }

//   // get set
//   static void setColorTheme(ColorThemeModel? value) => _setBase(
//         themeColor,
//         value?.toJson(),
//         expDateInDays: 30,
//       );

//   static ColorThemeModel? getColorTheme() => _getBase<ColorThemeModel>(
//         themeColor,
//         fromJson: ColorThemeModel.mapFromJson,
//       );

//   static void setAppName(String value) => _setBase(
//         appName,
//         value,
//         expDateInDays: 30,
//       );

//   static String? getAppName() => _getBase<String>(
//         appName,
//       );

//   static void setHistoryProfile(bool value) => _setBase(
//         historyProfile,
//         value,
//         expDateInDays: 7,
//       );

//   static bool? getHistoryProfile() => _getBase<bool>(
//         historyProfile,
//       );

//   static void setProfileMenu(ProfileMenuModel? value) => _setBase(
//         profileMenu,
//         value?.toJson(),
//         expDateInDays: 2,
//       );

//   static ProfileMenuModel? getProfileMenu() => _getBase<ProfileMenuModel>(
//         profileMenu,
//         fromJson: ProfileMenuModel.fromJson,
//       );

//   // private
//   static String _getExpName(String name) => "${name}_exp";
//   static String _getExpDateInDays(int days) =>
//       DateTime.now().add(Duration(days: days)).toIso8601String();

//   static T? _getBase<T>(String name,
//       {T Function(Map<String, dynamic> json)? fromJson}) {
//     var storage = box.read(name);
//     if (storage == null) {
//       return null;
//     }
//     var expired = DateTime.parse(box.read(_getExpName(name)));
//     if (expired.isBefore(DateTime.now())) {
//       return null;
//     }
//     if (fromJson != null) {
//       return fromJson(storage);
//     }
//     return storage;
//   }

//   static void _setBase(String name, dynamic value, {int expDateInDays = 1}) {
//     box.write(name, value);
//     box.write(
//       _getExpName(name),
//       value == null ? null : _getExpDateInDays(expDateInDays),
//     );
//   }
// }
