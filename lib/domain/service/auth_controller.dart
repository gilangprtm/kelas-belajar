import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:kelas_belajar/domain/model/usermodel.dart';
import 'package:kelas_belajar/infrastructure/mahas/mahas_config.dart';
import 'package:kelas_belajar/infrastructure/mahas/services/http_api.dart';

import '../../infrastructure/navigation/routes.dart';
import 'mahas_service.dart';

class AuthController extends GetxController {
  static AuthController instance = Get.isRegistered<AuthController>()
      ? Get.find<AuthController>()
      : Get.put(AuthController());
  late Rx<User?> firebaseUser;

  @override
  void onReady() {
    firebaseUser = Rx<User?>(auth.currentUser);
    firebaseUser.bindStream(auth.authStateChanges());
    ever(firebaseUser, _setInitialScreen);
    super.onReady();
  }

  void _setInitialScreen(User? user) {
    if (user == null) {
      _toLogin();
    } else {
      _toHome();
    }
  }

  void _toLogin() {
    Get.offAllNamed(Routes.LOGIN);
  }

  void _toHome() {
    try {
      getUser();
    } catch (e) {
      // print(e);
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
