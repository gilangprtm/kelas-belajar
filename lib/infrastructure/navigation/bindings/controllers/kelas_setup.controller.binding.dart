import 'package:get/get.dart';

import '../../../../presentation/kelas/kelas_setup/controllers/kelas_setup.controller.dart';

class KelasSetupControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<KelasSetupController>(
      () => KelasSetupController(),
    );
  }
}
