import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kelas_belajar/infrastructure/widget/constant.dart';

import '../../../../domain/model/kelasmodel.dart';
import '../../../../infrastructure/mahas/components/others/list_component.dart';
import '../../../../infrastructure/theme/typografi.dart';
import '../../../../infrastructure/widget/mahas_card.dart';
import '../controllers/kelas_list.controller.dart';

class MobileLayout extends GetView<KelasListController> {
  const MobileLayout({super.key});

  @override
  Widget build(BuildContext context) {
    final KelasListController controller = Get.put(KelasListController());
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: controller.createKelas,
        shape: const CircleBorder(),
        backgroundColor: MahasColors.primaryColor,
        child: const Icon(Icons.add),
      ),
      body: ListComponent<KelasModel>(
        viewType: ViewType.grid,
        controller: controller.listCon,
        itemBuilder: (e) {
          return GestureDetector(
            onTap: () {},
            child: MahasCustomizableCard(
              padding: 10,
              borderRadius: MahasBorderRadius.large,
              elevation: 0.0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        "${e.tahun ?? ''}",
                        style: MahasTypography.bodyText1.copyWith(
                          fontSize: 12,
                        ),
                      ),
                      const Spacer(),
                      Text(
                        e.semester != null ? 'Semester ${e.semester}' : '',
                        style: MahasTypography.bodyText1.copyWith(
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    e.nama ?? '',
                    style: MahasTypography.subtitle1.copyWith(
                      overflow: TextOverflow.ellipsis,
                    ),
                    maxLines: 2,
                  ),
                  Text(
                    e.namaGuru ?? '',
                    style: MahasTypography.bodyText2.copyWith(
                      overflow: TextOverflow.ellipsis,
                    ),
                    maxLines: 2,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
