import 'package:get/get.dart';

import '../../../../domain/model/kelasmodel.dart';
import '../../../../infrastructure/mahas/components/others/list_component.dart';
import '../../../../infrastructure/navigation/routes.dart';

class KelasListController extends GetxController {
  var spesifik = false;
  late ListComponentController<KelasModel> listCon;

  void createKelas() {
    Get.toNamed(Routes.KELAS_SETUP);
  }

  @override
  void onInit() {
    if (Get.arguments != null) {
      spesifik = Get.arguments['spesifik'] ?? false;
    }
    listCon = ListComponentController<KelasModel>(
      urlApi: (index, filter) =>
          '/api/kelas?spesifik=$spesifik&pageIndex=$index&filter=$filter',
      fromDynamic: KelasModel.fromDynamic,
      allowSearch: false,
    );
    super.onInit();
  }
}
