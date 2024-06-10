import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:kelas_belajar/domain/service/auth_controller.dart';

final auth = FirebaseAuth.instance;

class MahasService {
  static Future<void> init() async {
    try {
      await Firebase.initializeApp();
    } catch (e) {
      // print(e);
    } finally {
      Get.put(AuthController());
    }
  }
}
