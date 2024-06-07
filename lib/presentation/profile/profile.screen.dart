import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../infrastructure/widget/mahas_responsive.dart';
import 'controllers/profile.controller.dart';
import 'screen/desktop.dart';
import 'screen/mobile.dart';
import 'screen/tablet.dart';

class ProfileScreen extends GetView<ProfileController> {
  const ProfileScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: const MahasResponsive(
        mobile: MobileLayout(),
        tablet: TabletLayout(),
        desktop: DesktopLayout(),
      ),
    );
  }
}
