import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../infrastructure/widget/mahas_responsive.dart';
import 'controllers/signup.controller.dart';
import 'screen/desktop.dart';
import 'screen/mobile.dart';
import 'screen/tablet.dart';

class SignupScreen extends GetView<SignupController> {
  const SignupScreen({super.key});
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
