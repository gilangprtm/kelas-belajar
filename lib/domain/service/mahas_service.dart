import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

final auth = FirebaseAuth.instance;

class MahasService {
  static Future<void> init() async {
    await Firebase.initializeApp();
  }
}
