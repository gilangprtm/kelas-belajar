import 'package:get/get.dart';

import '../../../../presentation/module/controllers/module.controller.dart';

class ModuleControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ModuleController>(
      () => ModuleController(),
    );
  }
}
