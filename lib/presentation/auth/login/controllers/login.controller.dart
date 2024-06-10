import 'package:get/get.dart';

import '../../../../domain/service/auth_service.dart';

class LoginController extends GetxController {
  AuthService authService = Get.put(AuthService());

  void login() async {
    await authService.signInWithGoogle();
  }
}
