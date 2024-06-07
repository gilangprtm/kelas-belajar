import 'package:get/get.dart';
import 'package:kelas_belajar/domain/service/auth_service.dart';
import 'package:kelas_belajar/infrastructure/mahas/services/http_api.dart';

class ProfileController extends GetxController {
  AuthService authService = Get.put(AuthService());

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

  void login() async {
    await authService.signInWithGoogle();
  }

  void getUser() async {
    var user = await HttpApi.get('/api/profile');
    print(user.body);
  }

  void signOut() async {
    await authService.signOut();
  }
}
