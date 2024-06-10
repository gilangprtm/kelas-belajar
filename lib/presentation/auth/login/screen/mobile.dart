import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../infrastructure/theme/typografi.dart';
import '../../../../infrastructure/widget/constant.dart';
import '../../../../infrastructure/widget/mahas_button.dart';
import '../controllers/login.controller.dart';

class MobileLayout extends GetView<LoginController> {
  const MobileLayout({super.key});

  @override
  Widget build(BuildContext context) {
    final LoginController controller = Get.put(LoginController());

    return SafeArea(
      child: Scaffold(
        body: Container(
          margin: const EdgeInsets.all(20),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(child: Container()),
                SizedBox(
                  height: 100,
                  child: Container(
                    height: 100,
                    width: 100,
                    decoration: const BoxDecoration(
                      color: Colors.red,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  'Kelas Belajar',
                  textAlign: TextAlign.center,
                  style: MahasTypography.headline5,
                ),
                const SizedBox(height: 50),
                const Text(
                  "Selamat datang di Kelas Belajar, aplikasi yang bertujuan untuk memudahkan pembelajaran di kelas.",
                  textAlign: TextAlign.center,
                  maxLines: 5,
                ),
                const SizedBox(height: 20),
                const Text(
                  "Melanjutkan dengan",
                  textAlign: TextAlign.center,
                  maxLines: 5,
                ),
                const SizedBox(height: 10),
                MahasButton(
                  isFullWidth: true,
                  text: 'Google',
                  onPressed: () {
                    controller.login();
                  },
                ),
                Visibility(
                  visible: true,
                  child: MahasButton(
                    text: 'Demo',
                    onPressed: () {},
                    type: ButtonType.text,
                    borderRadius: MahasBorderRadius.extraLarge,
                  ),
                ),
                Expanded(child: Container()),
                const Text(
                  "Dengan melanjutkan, anda menyetujui persyaratan Penguna dan Kebijakan Privasi Kelas Belajar.",
                  textAlign: TextAlign.center,
                  maxLines: 5,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
