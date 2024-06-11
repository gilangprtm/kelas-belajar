import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../infrastructure/widget/constant.dart';
import '../../../infrastructure/widget/mahas_responsive.dart';
import 'controllers/kelas_list.controller.dart';
import 'screen/desktop.dart';
import 'screen/mobile.dart';
import 'screen/tablet.dart';

class KelasListScreen extends GetView<KelasListController> {
  // ignore: use_super_parameters
  const KelasListScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kelas Belajar'),
        centerTitle: true,
        backgroundColor: MahasColors.transparent,
        surfaceTintColor: MahasColors.transparent,
        iconTheme:
            const IconThemeData(color: MahasColors.darkSecondaryLightColor),
      ),
      body: const MahasResponsive(
        mobile: MobileLayout(),
        tablet: TabletLayout(),
        desktop: DesktopLayout(),
      ),
    );
  }
}
