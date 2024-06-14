import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kelas_belajar/infrastructure/widget/constant.dart';

import '../../../../infrastructure/mahas/components/inputs/input_text_component.dart';
import '../../../../infrastructure/mahas/components/pages/setup_page_component.dart';
import '../controllers/kelas_setup.controller.dart';

class MobileLayout extends GetView<KelasSetupController> {
  const MobileLayout({super.key});

  @override
  Widget build(BuildContext context) {
    final KelasSetupController controller = Get.put(KelasSetupController());

    return SetupPageComponent(
      appBackgroundColor: MahasColors.transparent,
      controller: controller.formCon,
      title: "Kelas",
      children: () => [
        InputTextComponent(
          label: "Nama Kelas",
          controller: controller.namaCon,
          required: true,
          editable: controller.formCon.editable,
        ),
        InputTextComponent(
          label: "Tahun",
          controller: controller.tahunCon,
          required: true,
          editable: controller.formCon.editable,
        ),
        InputTextComponent(
          label: "Semester",
          controller: controller.semesterCon,
          editable: controller.formCon.editable,
        ),
      ],
    );
  }
}
