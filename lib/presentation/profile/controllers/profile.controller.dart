import 'package:get/get.dart';
import 'package:kelas_belajar/domain/service/auth_service.dart';

class ProfileController extends GetxController {
  AuthService authService = Get.put(AuthService());

  void signOut() async {
    await authService.signOut();
  }
}
