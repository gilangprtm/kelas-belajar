// import 'dart:async';
// import 'dart:convert';
// import 'dart:io';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:firebase_remote_config/firebase_remote_config.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:get/get.dart';
// import 'package:get_storage/get_storage.dart';
// import 'package:hr_portal/app/mahas/mahas_storage.dart';
// import 'package:hr_portal/app/mahas/models/color_theme_model.dart';
// import 'package:hr_portal/app/models/menu_profile_model.dart';
// import 'package:hr_portal/app/models/update_app_values_model.dart';
// import 'package:overlay_support/overlay_support.dart';
// import 'package:package_info_plus/package_info_plus.dart';
// import '../../../firebase_options.dart';
// import '../controllers/auth_controller.dart';
// import 'package:hive_flutter/hive_flutter.dart';
// import '../mahas_complement/jadwal_storage.dart';
// import '../mahas_complement/profile_storage.dart';
// import '../mahas_complement/service_data.dart';
// import '../services/connection_checker_service.dart';
// import '../services/local_notification_service.dart';
// import 'mahas_colors.dart';
// import 'mahas_config.dart';
// import 'package:timezone/data/latest.dart' as tz;

// final authController = AuthController.instance;
// final remoteConfig = FirebaseRemoteConfig.instance;
// final auth = FirebaseAuth.instance;

// class MahasService {
//   // static PackageInfo? packageInfo;
//   static Future<void> backgroundHandler(RemoteMessage message) async {}

//   static Future<void> init() async {
//     // getstorange
//     await GetStorage.init();

//     // packageInfo
//     MahasConfig.packageInfo = await PackageInfo.fromPlatform();

//     // transparent status bar
//     SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
//       statusBarColor: Colors.transparent,
//     ));

//     //device orientation
//     await SystemChrome.setPreferredOrientations(
//       [DeviceOrientation.portraitUp],
//     );

//     // check connection
//     await InternetConnectionService.isInternet();

//     // init app
//     await initApp();

//     // checking internet
//     InternetConnectionService.checkInternet();

//     // hive local storage
//     await Hive.initFlutter();
//     mainStorage = await Hive.openBox('mainStorage');
//     await ProfileService.loadDataFromDB();
//     await JadwalService.loadDataFromDB();

//     // init notification
//     LocalNotificationService().initialize();

//     // lokal notif
//     tz.initializeTimeZones();
//     // LocalNotificationService().dateNotifications();

//     HttpOverrides.global = MyHttpOverrides();
//   }

//   static bool isInternetCausedError(String error) {
//     bool result = true;
//     for (var e in MahasConfig.noInternetErrorMessage) {
//       if (error.contains(RegExp(e, caseSensitive: false))) {
//         result = true;
//         break;
//       } else {
//         result = false;
//       }
//     }
//     return result;
//   }

//   static Future<void> initApp() async {
//     if (MahasConfig.hasInternet == true) {
//       try {
//         final Future<FirebaseApp> firebaseInitialization =
//             (defaultTargetPlatform == TargetPlatform.android ||
//                     defaultTargetPlatform == TargetPlatform.iOS)
//                 ? Firebase.initializeApp()
//                 : Firebase.initializeApp(
//                     options: DefaultFirebaseOptions.currentPlatform,
//                   );

//         await firebaseInitialization.then((value) async {
//           // notif
//           FirebaseMessaging.onBackgroundMessage(backgroundHandler);
//           if (!kIsWeb) {
//             if (Platform.isAndroid || Platform.isIOS) {
//               if (Platform.isAndroid) {
//                 androidNotification();
//               } else {
//                 appleNotification();
//               }
//             }
//           }

//           // remote config
//           await remoteConfig.setConfigSettings(
//             RemoteConfigSettings(
//               fetchTimeout: const Duration(seconds: 5),
//               minimumFetchInterval: Duration.zero,
//             ),
//           );
//           await remoteConfig.fetchAndActivate();

//           MahasConfig.urlApi = remoteConfig.getString('api');

//           String? appName = MahasStorage.getAppName();
//           if (appName != null) {
//             MahasConfig.appName = appName;
//           } else {
//             String remoteAppName = remoteConfig.getString("app_name");
//             if (remoteAppName.isNotEmpty) {
//               MahasConfig.appName = remoteAppName;
//               MahasStorage.setAppName(MahasConfig.appName);
//             }
//           }

//           ProfileMenuModel? profileMenuModel = MahasStorage.getProfileMenu();
//           if (MahasConfig.hasInternet == false) {
//             MahasConfig.profileMenu = profileMenuModel!;
//           } else {
//             String profileMenu = remoteConfig.getString("profile_menu");
//             if (profileMenu.isNotEmpty) {
//               MahasConfig.profileMenu =
//                   ProfileMenuModel.fromString(profileMenu);
//               MahasStorage.setProfileMenu(MahasConfig.profileMenu);
//             }
//           }

//           bool? historyProfile = MahasStorage.getHistoryProfile();
//           if (historyProfile != null) {
//             MahasConfig.hasHistory = historyProfile;
//           } else {
//             MahasConfig.hasHistory = remoteConfig.getBool('history_profile');
//             MahasStorage.setHistoryProfile(MahasConfig.hasHistory);
//           }

//           ColorThemeModel? colorThemeModel = MahasStorage.getColorTheme();
//           if (colorThemeModel != null) {
//             if (colorThemeModel.primary != null) {
//               MahasColors.primary = Color(int.parse(colorThemeModel.primary!));
//             }
//             if (colorThemeModel.danger != null) {
//               MahasColors.danger = Color(int.parse(colorThemeModel.danger!));
//             }
//             if (colorThemeModel.warning != null) {
//               MahasColors.warning = Color(int.parse(colorThemeModel.warning!));
//             }
//           } else {
//             String colorThemeRemoteConfig =
//                 remoteConfig.getString("theme_color");
//             if (colorThemeRemoteConfig.isNotEmpty) {
//               ColorThemeModel colorTheme =
//                   ColorThemeModel.fromJson(colorThemeRemoteConfig);
//               MahasStorage.setColorTheme(colorTheme);
//               if (colorTheme.primary != null) {
//                 MahasColors.primary = Color(int.parse(colorTheme.primary!));
//               }
//               if (colorTheme.danger != null) {
//                 MahasColors.danger = Color(int.parse(colorTheme.danger!));
//               }
//               if (colorTheme.warning != null) {
//                 MahasColors.warning = Color(int.parse(colorTheme.warning!));
//               }
//             }
//           }

//           String updateRemote = remoteConfig.getString("update_app_values");
//           if (updateRemote.isNotEmpty) {
//             MahasConfig.updateAppValues =
//                 UpdateappvaluesModel.fromJson(updateRemote);
//           }

//           String noInternetRemoteConfig =
//               remoteConfig.getString("no_internet_error_message");
//           if (noInternetRemoteConfig.isNotEmpty) {
//             List<dynamic> dataNoInternet = jsonDecode(noInternetRemoteConfig);
//             if (dataNoInternet.isNotEmpty) {
//               List<String> strlist = dataNoInternet.cast<String>();
//               MahasConfig.noInternetErrorMessage.clear();
//               MahasConfig.noInternetErrorMessage.addAll(strlist);
//             }
//           }

//           //go to authservice
//           Get.put(AuthController());
//         });
//         // ignore: empty_catches
//       } catch (e) {}
//     } else {
//       Get.put(AuthController());
//     }
//   }

//   //Notif Android
//   static Future<void> androidNotification() async {
//     //terminated state
//     FirebaseMessaging.instance.getInitialMessage().then((message) {});

//     //foreground state
//     FirebaseMessaging.onMessage.listen((message) {
//       LocalNotificationService.showNotificatiOnForeground(message);
//     });

//     //notif jadwal
//     // FirebaseMessaging.onMessage.listen((message) {
//     //   LocalNotificationService.showNotifJadwal(message);
//     // });

//     //background state
//     FirebaseMessaging.onMessageOpenedApp.listen((message) {});
//   }

//   //Notif Apple
//   static Future<void> appleNotification() async {
//     late final FirebaseMessaging messaging = FirebaseMessaging.instance;
//     NotificationSettings settings = await messaging.requestPermission(
//       alert: true,
//       announcement: false,
//       badge: true,
//       carPlay: false,
//       criticalAlert: false,
//       provisional: false,
//       sound: true,
//     );

//     if (settings.authorizationStatus == AuthorizationStatus.authorized) {
//       // For handling the received notifications
//       //terminated state
//       FirebaseMessaging.instance.getInitialMessage().then((message) {
//         //   showSimpleNotification(
//         //     Text("${message?.notification!.title}"),
//         //     subtitle: Text("${message?.notification!.body}"),
//         //     background: MahasColors.lightBlue,
//         //     duration: const Duration(seconds: 3),
//         //  );
//       });

//       //foreground state
//       await FirebaseMessaging.instance
//           .setForegroundNotificationPresentationOptions(
//         alert: true,
//         badge: true,
//         sound: true,
//       );

//       FirebaseMessaging.onMessage.listen((message) {
//         // LocalNotificationService.showNotificatiOnForeground(message);
//         showSimpleNotification(
//           Text("${message.notification!.title}"),
//           subtitle: Text("${message.notification!.body}"),
//           background: MahasColors.primary,
//           duration: const Duration(seconds: 3),
//         );
//       });

//       //background state
//       FirebaseMessaging.onMessageOpenedApp.listen((message) {
//         // showSimpleNotification(
//         //   Text("${message.notification!.title}"),
//         //   subtitle: Text("${message.notification!.body}"),
//         //   background: MahasColors.lightBlue,
//         //   duration: const Duration(seconds: 3),
//         // );
//       });
//     }
//   }
// }

// class MyHttpOverrides extends HttpOverrides {
//   @override
//   HttpClient createHttpClient(SecurityContext? context) {
//     return super.createHttpClient(context)
//       ..badCertificateCallback =
//           (X509Certificate cert, String host, int port) => true;
//   }
// }
