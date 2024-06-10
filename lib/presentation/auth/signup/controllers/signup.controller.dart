import 'package:get/get.dart';
import 'package:kelas_belajar/domain/service/mahas_service.dart';

import '../../../../domain/model/usermodel.dart';
import '../../../../infrastructure/mahas/components/inputs/input_dropdown_component.dart';
import '../../../../infrastructure/mahas/components/inputs/input_text_component.dart';
import '../../../../infrastructure/mahas/mahas_config.dart';
import '../../../../infrastructure/mahas/services/http_api.dart';
import '../../../../infrastructure/navigation/routes.dart';

class SignupController extends GetxController {
  final namaCon = InputTextController();
  final roleCon = InputDropdownController(
    items: [
      DropdownItem.simple("Guru"),
      DropdownItem.simple("Siswa"),
    ],
  );

  void signup() {
    if (validation()) {
      var data = {
        "nama": namaCon.value,
        "foto": "",
        "role": roleCon.value,
        "id_firebase": auth.currentUser?.uid,
        "email": auth.currentUser?.email,
      };
      try {
        var request = HttpApi.post('/api/user', body: data);
        request.then((value) {
          if (value.statusCode == 201) {
            getUser();
          }
        });
      } catch (e) {
        // print(e);
      }
    }
  }

  bool validation() {
    if (!namaCon.isValid || !roleCon.isValid) {
      return false;
    } else {
      return true;
    }
  }

  void getUser() async {
    var user = await HttpApi.get('/api/profile');
    if (user.statusCode == 200) {
      MahasConfig.userModel = UserModel.fromJson(user.body);
      Get.offAllNamed(Routes.BASE);
    } else if (user.statusCode == 404) {
      Get.offAllNamed(Routes.SIGNUP);
    }
  }
}
