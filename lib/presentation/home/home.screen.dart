import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../infrastructure/widget/mahas_responsive.dart';
import 'controllers/home.controller.dart';
import 'screen/desktop.dart';
import 'screen/mobile.dart';
import 'screen/tablet.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: MahasResponsive(
        mobile: MobileLayout(),
        tablet: TabletLayout(),
        desktop: DesktopLayout(),
      ),
    );
  }
}
