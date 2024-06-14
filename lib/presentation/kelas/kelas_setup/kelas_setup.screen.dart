import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../infrastructure/widget/mahas_responsive.dart';
import 'controllers/kelas_setup.controller.dart';
import 'screen/desktop.dart';
import 'screen/mobile.dart';
import 'screen/tablet.dart';

class KelasSetupScreen extends GetView<KelasSetupController> {
  const KelasSetupScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return const MahasResponsive(
      mobile: MobileLayout(),
      tablet: TabletLayout(),
      desktop: DesktopLayout(),
    );
  }
}
