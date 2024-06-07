import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kelas_belajar/infrastructure/widget/mahas_button.dart';

import '../../../infrastructure/mahas/components/inputs/input_text_component.dart';
import '../../../infrastructure/widget/constant.dart';
import '../../../infrastructure/widget/mahas_grid.dart';
import '../controllers/module.controller.dart';

class MobileLayout extends GetView<ModuleController> {
  const MobileLayout({super.key});

  @override
  Widget build(BuildContext context) {
    final ModuleController controller = Get.put(ModuleController());
    return Column(
      children: [
        Row(
          children: [
            const Spacer(),
            Card(
              child: SizedBox(
                width: context.width * 0.8,
                child: InputTextComponent(
                  placeHolder: "Cari Modul Belajar",
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
                onPressed: () {},
                type: ButtonType.icon,
                borderRadius: MahasBorderRadius.large,
              ),
            ),
            const Spacer(),
          ],
        ),
        Expanded(
          child: MahasGrid(
            items: controller.items,
          ),
        ),
      ],
    );
  }
}
