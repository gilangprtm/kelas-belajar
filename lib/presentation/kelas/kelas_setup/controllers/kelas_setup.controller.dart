import 'dart:convert';

import 'package:get/get.dart';

import '../../../../domain/model/kelasmodel.dart';
import '../../../../infrastructure/mahas/components/inputs/input_text_component.dart';
import '../../../../infrastructure/mahas/components/pages/setup_page_component.dart';
import '../../../../infrastructure/mahas/mahas_config.dart';

class KelasSetupController extends GetxController {
  late SetupPageController formCon;
  final namaCon = InputTextController();
  final tahunCon = InputTextController(type: InputTextType.number);
  final semesterCon = InputTextController(type: InputTextType.number);

  @override
  void onInit() {
    formCon = SetupPageController(
      urlApiGet: (id) => '/api/kelas/$id',
      urlApiPost: () => '/api/kelas',
      urlApiPut: (id) => '/api/kelas/$id',
      urlApiDelete: (id) => '/api/kelas/$id',
      bodyApi: (id) => {
        "nama": namaCon.value,
        "tahun": tahunCon.value,
        "semester": semesterCon.value,
        "id_guru": MahasConfig.userModel!.id,
      },
      itemKey: (e) => e['id'],
      itemIdAfterSubmit: (e) => json.decode(e)['id'],
      onBeforeSubmit: () {
        if (!namaCon.isValid) return false;
        if (!tahunCon.isValid) return false;

        return true;
      },
      apiToView: (json) {
        KelasModel model = KelasModel.fromJson(json);

        namaCon.value = model.nama;
      },
    );
    super.onInit();
  }
}
