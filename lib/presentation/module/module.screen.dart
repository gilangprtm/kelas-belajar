import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:kelas_belajar/infrastructure/widget/constant.dart';

import '../../infrastructure/widget/mahas_responsive.dart';
import 'controllers/module.controller.dart';
import 'screen/desktop.dart';
import 'screen/mobile.dart';
import 'screen/tablet.dart';

class ModuleScreen extends GetView<ModuleController> {
  const ModuleScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Modul Belajar'),
        centerTitle: true,
        backgroundColor: MahasColors.transparent,
        surfaceTintColor: MahasColors.transparent,
      ),
      body: const MahasResponsive(
        mobile: MobileLayout(),
        tablet: TabletLayout(),
        desktop: DesktopLayout(),
      ),
    );
  }
}
