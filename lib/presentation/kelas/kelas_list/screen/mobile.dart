import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kelas_belajar/infrastructure/widget/constant.dart';

import '../../../../infrastructure/mahas/components/inputs/input_text_component.dart';
import '../../../../infrastructure/widget/mahas_button.dart';
import '../../../../infrastructure/widget/mahas_grid.dart';
import '../controllers/kelas_list.controller.dart';

class MobileLayout extends GetView<KelasListController> {
  const MobileLayout({super.key});

  @override
  Widget build(BuildContext context) {
    final KelasListController controller = Get.put(KelasListController());
    return Column(
      children: [
        Row(
          children: [
            const Spacer(),
            Card(
              child: SizedBox(
                width: context.width * 0.8,
                child: InputTextComponent(
                  placeHolder: "Cari Kelas Belajar",
                  marginBottom: 0,
                  controller: controller.searchCon,
                  editable: true,
                ),
              ),
            ),
            Card(
              child: MahasButton(
                icon: const Icon(
                  Icons.filter_list,
                  size: 24.0,
                ),
                onPressed: () {
                  controller.getAllKelas();
                },
                type: ButtonType.icon,
                borderRadius: MahasBorderRadius.large,
              ),
            ),
            const Spacer(),
          ],
        ),
        Obx(() => Expanded(
              child: MahasGrid(
                // ignore: invalid_use_of_protected_member
                items: controller.items.value,
              ),
            )),
      ],
    );
  }
}
