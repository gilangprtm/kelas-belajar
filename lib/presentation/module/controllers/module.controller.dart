import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../infrastructure/mahas/components/inputs/input_text_component.dart';
import '../../../infrastructure/theme/typografi.dart';
import '../../../infrastructure/widget/constant.dart';
import '../../../infrastructure/widget/mahas_card.dart';
import '../../../infrastructure/widget/mahas_snackbar.dart';

class ModuleController extends GetxController {
  final searchCon = InputTextController();
  List<Widget> items = List.generate(10, (index) {
    return GestureDetector(
      onTap: () {
        MahasSnackbar.show(Get.context!, 'Item $index clicked');
      },
      child: const MahasCustomizableCard(
        borderRadius: MahasBorderRadius.large,
        elevation: 0,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Modul Ajar',
              style: MahasTypography.subtitle1,
            ),
            Text(
              'Deskripsi',
              style: MahasTypography.bodyText2,
            ),
          ],
        ),
      ),
    );
  });

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
