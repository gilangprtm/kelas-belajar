import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../infrastructure/mahas/components/inputs/input_dropdown_component.dart';
import '../../../../infrastructure/mahas/components/inputs/input_text_component.dart';
import '../../../../infrastructure/theme/typografi.dart';
import '../../../../infrastructure/widget/mahas_button.dart';
import '../controllers/signup.controller.dart';

class MobileLayout extends GetView<SignupController> {
  const MobileLayout({super.key});

  @override
  Widget build(BuildContext context) {
    final SignupController controller = Get.put(SignupController());

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          controller: ScrollController(),
          child: Container(
            margin: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 100,
                ),
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
                  "Anda belum terdaftar. Silahkan daftarkan diri anda sebelum mengakses aplikasi ini.",
                  textAlign: TextAlign.center,
                  maxLines: 5,
                ),
                const SizedBox(height: 20),
                Card(
                  child: InputTextComponent(
                    placeHolder: "Nama",
                    marginBottom: 0,
                    controller: controller.namaCon,
                    editable: true,
                    required: true,
                  ),
                ),
                Card(
                  child: InputDropdownComponent(
                    hint: "Sebagai",
                    controller: controller.roleCon,
                    editable: true,
                    required: true,
                    marginBottom: 0,
                  ),
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: MahasButton(
                    isFullWidth: true,
                    text: 'Daftar',
                    onPressed: () {
                      controller.signup();
                    },
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  "Dengan melanjutkan, anda menyetujui persyaratan Penguna dan Kebijakan Privasi Kelas Belajar.",
                  textAlign: TextAlign.center,
                  maxLines: 5,
                  style: TextStyle(
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
