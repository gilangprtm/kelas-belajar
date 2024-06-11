import 'package:get/get.dart';

import '../../../../presentation/kelas/kelas_list/controllers/kelas_list.controller.dart';

class KelasListControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<KelasListController>(
      () => KelasListController(),
    );
  }
}
