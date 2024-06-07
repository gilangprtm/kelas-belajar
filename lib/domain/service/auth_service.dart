import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'mahas_service.dart';

class AuthService {
  Future<UserCredential?> _signInWithCredentialGoogle() async {
    GoogleSignInAccount? googleSignInAccount =
        await GoogleSignIn(scopes: <String>["email"]).signIn();
    if (googleSignInAccount == null) return null;
    GoogleSignInAuthentication googleSignInAuthentication =
        await googleSignInAccount.authentication;
    AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleSignInAuthentication.accessToken,
      idToken: googleSignInAuthentication.idToken,
    );
    return await auth.signInWithCredential(credential);
  }

  Future<void> signInWithGoogle() async {
    await EasyLoading.show();
    try {
      var r = await _signInWithCredentialGoogle();

      if (r == null) {
        await EasyLoading.dismiss();
      }
    } catch (e) {
      Get.snackbar(
        "Error",
        "Ada kendala silahkan coba beberapa saat lagi",
        snackPosition: SnackPosition.BOTTOM,
      );

      await EasyLoading.dismiss();
    } finally {
      await EasyLoading.dismiss();
    }
  }

  Future signOut() async {
    EasyLoading.show();

    try {
      await auth.signOut();
      await GoogleSignIn().signOut();
    } catch (e) {
      // print(e);
    } finally {
      EasyLoading.dismiss();
    }
  }
}
