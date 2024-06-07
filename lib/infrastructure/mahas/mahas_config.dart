import 'package:package_info_plus/package_info_plus.dart';

class MahasConfig {
  static PackageInfo? packageInfo;
  static String urlApi = 'http://192.168.100.201:3000';
  static bool? hasInternet = true;
  static bool apiStaging = false;
  static bool updateRequired = false;
  // static String urlApi = 'https://localhost:7159';
  static bool isLaravelBackend = false;
  static bool demoLogin = false;
}
