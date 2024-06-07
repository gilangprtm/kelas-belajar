import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import 'package:get/get.dart';

import 'domain/service/mahas_service.dart';
import 'infrastructure/navigation/navigation.dart';
import 'infrastructure/navigation/routes.dart';
import 'infrastructure/theme/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await MahasService.init();
  var initialRoute = await Routes.initialRoute;

  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "HR Portal",
      initialRoute: initialRoute,
      getPages: Nav.routes,
      builder: EasyLoading.init(),
      theme: MahasTheme.lightTheme,
      darkTheme: MahasTheme.darkTheme,
      themeMode: ThemeMode.system,
    ),
  );
}
