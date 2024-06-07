import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kelas_belajar/infrastructure/theme/typografi.dart';

import '../../../infrastructure/widget/constant.dart';
import '../../../infrastructure/widget/mahas_card.dart';
import '../../../infrastructure/widget/mahas_image.dart';
import '../../../infrastructure/widget/mahas_snackbar.dart';

class HomeController extends GetxController {
  List<Widget> items = List.generate(10, (index) {
    return GestureDetector(
      onTap: () {
        MahasSnackbar.show(Get.context!, 'Item $index clicked');
      },
      child: const MahasCustomizableCard(
        borderRadius: MahasBorderRadius.large,
        elevation: 0.0,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MahasImage(
              height: 80,
              width: 80,
              imageUrl:
                  'https://images.unsplash.com/flagged/photo-1559502867-c406bd78ff24?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=685&q=80',
              borderRadius: MahasBorderRadius.circle,
            ),
            Padding(
              padding: EdgeInsets.all(10.0),
              child: Text(
                'Kartu dengan Gambar',
                style: MahasTypography.subtitle1,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: Text(
                'Deskripsi',
                style: MahasTypography.bodyText2,
              ),
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
