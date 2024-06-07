import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'package:crypto/crypto.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

class AuthController extends GetxController {
  static AuthController instance = Get.isRegistered<AuthController>()
      ? Get.find<AuthController>()
      : Get.put(AuthController());
  late Rx<User?> firebaseUser;

  // @override
  // void onReady() {
  //   super.onReady();
  //   if (MahasConfig.hasInternet == true) {
  //     firebaseUser = Rx<User?>(auth.currentUser);
  //     firebaseUser.bindStream(auth.authStateChanges());
  //     ever(firebaseUser, _setInitialScreen);
  //   } else {
  //     ifNoInternet();
  //   }
  // }

  // //kondisi ketika tidak ada internet
  // void ifNoInternet() {
  //   MahasConfig.hasInternet = false;
  //   if (ProfileService.profile == null) {
  //     Helper.dialogWarning("Tidak ada koneksi internet");
  //   }
  //   MahasConfig.profile = ProfileModel.fromJson(ProfileService.profile);
  //   MahasConfig.selectedDivisi = MahasConfig.profile!.divisi
  //           ?.firstWhereOrNull((e) => e.prioritas == true)
  //           ?.idDivisi ??
  //       MahasConfig.profile?.divisi?.first.idDivisi;
  //   Get.offAllNamed(Routes.HOME);
  // }

  void _setInitialScreen(User? user) {
    if (user == null) {
      // _toLigin();
    } else {
      // _toHome();
    }
  }

  // void _toLigin() {
  //   Get.offAllNamed(Routes.LOGIN);
  //   MahasConfig.profile = null;
  //   if (EasyLoading.isShow) {
  //     EasyLoading.dismiss();
  //   }
  // }

  // void _toHome() async {
  //   if (MahasConfig.hasInternet == true) {
  //     var r = await HttpApi.get('/api/Profile');
  //     if (r.success) {
  //       MahasConfig.profile = ProfileModel.fromJson(r.body);
  //       ProfileService.profile = r.body;
  //       ProfileService.savedata();
  //       final divisi = MahasConfig.profile!.divisi!;
  //       if (divisi.isEmpty) {
  //         Get.offAllNamed(
  //           Routes.UNAUTHORIZED,
  //           parameters: {
  //             'status': 'nodivisi',
  //             'message':
  //                 'Anda Belum Memiliki Divisi!\nSilahkan Ajukan Penambahan Divisi ke Kepala Divisi',
  //           },
  //         );
  //       } else {
  //         MahasConfig.selectedDivisi = MahasConfig.profile!.divisi
  //                 ?.firstWhereOrNull((e) => e.prioritas == true)
  //                 ?.idDivisi ??
  //             MahasConfig.profile?.divisi?.first.idDivisi;

  //         if (!kIsWeb) {
  //           if (Platform.isAndroid || Platform.isIOS) {
  //             late final FirebaseMessaging messaging =
  //                 FirebaseMessaging.instance;
  //             String? token = await messaging.getToken();
  //             // print(token);
  //             const url = '/api/Notifikasi/Token';
  //             HttpApi.post(url, body: {'Token': token.toString()});
  //           }
  //         }
  //         if (Get.currentRoute != Routes.HOME) {
  //           Get.offAllNamed(Routes.HOME);
  //         }
  //       }
  //     } else if (r.statusCode == 401) {
  //       if (Get.currentRoute != Routes.UNAUTHORIZED) {
  //         Get.offAllNamed(Routes.UNAUTHORIZED);
  //       }
  //     } else if (r.statusCode == 400) {
  //       if (Get.currentRoute != Routes.UNAUTHORIZED) {
  //         ErrorprofileModel response = ErrorprofileModel.fromJson(r.body);
  //         Get.offAllNamed(
  //           Routes.UNAUTHORIZED,
  //           parameters: {
  //             'status': '${response.status}',
  //             'message': '${response.message}',
  //           },
  //         );
  //       }
  //     } else {
  //       ifNoInternet();
  //     }
  //   } else {
  //     ifNoInternet();
  //   }

  //   if (EasyLoading.isShow) {
  //     EasyLoading.dismiss();
  //   }
  // }

  // Future<UserCredential?> _signInWithCredentialGoogle() async {
  //   GoogleSignInAccount? googleSignInAccount =
  //       await GoogleSignIn(scopes: <String>["email"]).signIn();
  //   if (googleSignInAccount == null) return null;
  //   GoogleSignInAuthentication googleSignInAuthentication =
  //       await googleSignInAccount.authentication;
  //   AuthCredential credential = GoogleAuthProvider.credential(
  //     accessToken: googleSignInAuthentication.accessToken,
  //     idToken: googleSignInAuthentication.idToken,
  //   );
  //   return await auth.signInWithCredential(credential);
  // }

  // Future<void> singInWithPassword(String email, String pass) async {
  //   if (EasyLoading.isShow) return;
  //   await EasyLoading.show();
  //   try {
  //     await FirebaseAuth.instance.signInWithEmailAndPassword(
  //       email: email,
  //       password: pass,
  //     );
  //     MahasConfig.demoLogin = true;
  //   } on FirebaseAuthException {
  //     if (MahasConfig.hasInternet == false) {
  //       Get.snackbar(
  //         "Error",
  //         "Tidak ada koneksi internet",
  //         snackPosition: SnackPosition.BOTTOM,
  //       );
  //     } else {
  //       Get.snackbar(
  //         "Error",
  //         "Ada kendala silahkan coba beberapa saat lagi",
  //         snackPosition: SnackPosition.BOTTOM,
  //       );
  //     }
  //     await EasyLoading.dismiss();
  //   } catch (e) {
  //     if (MahasConfig.hasInternet == false) {
  //       Get.snackbar(
  //         "Error",
  //         "Tidak ada koneksi internet",
  //         snackPosition: SnackPosition.BOTTOM,
  //       );
  //     } else {
  //       Get.snackbar(
  //         "Error",
  //         "Ada kendala silahkan coba beberapa saat lagi",
  //         snackPosition: SnackPosition.BOTTOM,
  //       );
  //     }
  //     await EasyLoading.dismiss();
  //   }
  // }

  // Future<void> signInWithGoogle() async {
  //   if (EasyLoading.isShow) return;
  //   await EasyLoading.show();
  //   try {
  //     var r = await _signInWithCredentialGoogle();
  //     final box = GetStorage();
  //     box.write('apple_login', null);
  //     if (r == null) {
  //       await EasyLoading.dismiss();
  //     }
  //   } catch (e) {
  //     if (MahasConfig.hasInternet == false) {
  //       Get.snackbar(
  //         "Error",
  //         "Tidak ada koneksi internet",
  //         snackPosition: SnackPosition.BOTTOM,
  //       );
  //     } else {
  //       Get.snackbar(
  //         "Error",
  //         "Ada kendala silahkan coba beberapa saat lagi",
  //         snackPosition: SnackPosition.BOTTOM,
  //       );
  //     }
  //     await EasyLoading.dismiss();
  //   }
  // }

  // String _generateNonce([int length = 32]) {
  //   const charset =
  //       '0123456789ABCDEFGHIJKLMNOPQRSTUVXYZabcdefghijklmnopqrstuvwxyz-._';
  //   final random = Random.secure();
  //   return List.generate(length, (_) => charset[random.nextInt(charset.length)])
  //       .join();
  // }

  // String _sha256ofString(String input) {
  //   final bytes = utf8.encode(input);
  //   final digest = sha256.convert(bytes);
  //   return digest.toString();
  // }

  // Future<UserCredential?> _signInWithCredentialApple() async {
  //   final rawNonce = _generateNonce();
  //   final nonce = _sha256ofString(rawNonce);
  //   final appleCredential = await SignInWithApple.getAppleIDCredential(
  //     scopes: [
  //       AppleIDAuthorizationScopes.email,
  //       AppleIDAuthorizationScopes.fullName,
  //     ],
  //     nonce: nonce,
  //   );
  //   final oauthCredential = OAuthProvider("apple.com").credential(
  //     idToken: appleCredential.identityToken,
  //     rawNonce: rawNonce,
  //   );
  //   return await auth.signInWithCredential(oauthCredential);
  // }

  // Future<void> signInWithApple() async {
  //   if (EasyLoading.isShow) return;
  //   await EasyLoading.show();
  //   try {
  //     await _signInWithCredentialApple();
  //     final box = GetStorage();
  //     box.write('apple_login', true);
  //   } on SignInWithAppleAuthorizationException catch (e) {
  //     if (e.code != AuthorizationErrorCode.canceled) {
  //       if (MahasConfig.hasInternet == false) {
  //         Get.snackbar(
  //           "Error",
  //           "Tidak ada koneksi internet",
  //           snackPosition: SnackPosition.BOTTOM,
  //         );
  //       } else {
  //         Get.snackbar(
  //           "Error",
  //           "Ada kendala silahkan coba beberapa saat lagi",
  //           snackPosition: SnackPosition.BOTTOM,
  //         );
  //       }
  //     }
  //     await EasyLoading.dismiss();
  //   }
  // }

  // Future signOut() async {
  //   if (EasyLoading.isShow) return;
  //   EasyLoading.show();
  //   late final FirebaseMessaging messaging = FirebaseMessaging.instance;
  //   String? token = await messaging.getToken();
  //   if (token != null) {
  //     var r = await HttpApi.put(
  //       '/api/Notifikasi/Token',
  //       body: {"Token": token},
  //     );
  //     if (!r.success) {
  //       EasyLoading.dismiss();
  //       if (r.message!.contains(RegExp('unexpected end of stream'))) {
  //         Helper.dialogWarning(
  //             "Koneksi internet Anda terlalu lambat, coba beberapa saat lagi!");
  //       } else if (MahasConfig.hasInternet == false) {
  //         Helper.dialogWarning(
  //             "Tidak dapat melakukan Sign Out, silahkan cek koneksi internet");
  //       } else {
  //         Helper.dialogWarning(r.message ?? "");
  //       }
  //     } else {
  //       await auth.signOut();
  //       await GoogleSignIn().signOut();
  //       HttpApi.clearToken();
  //     }
  //   } else {
  //     await auth.signOut();
  //     await GoogleSignIn().signOut();
  //     HttpApi.clearToken();
  //   }
  //   MahasConfig.demoLogin = false;
  // }

  // Future<void> deleteAccount() async {
  //   final box = GetStorage();
  //   UserCredential? userCredential;
  //   try {
  //     if (box.read('apple_login') == true) {
  //       userCredential = await _signInWithCredentialApple();
  //     } else {
  //       userCredential = await _signInWithCredentialGoogle();
  //     }
  //     if (userCredential?.user != null) {
  //       var r = await HttpApi.delete('/api/auth');
  //       if (r.success) {
  //       } else {
  //         Get.defaultDialog(title: 'Error', middleText: r.message!);
  //       }
  //       await userCredential!.user!.delete();
  //     }
  //     auth.signOut();
  //     await GoogleSignIn().signOut();
  //   } on SignInWithAppleAuthorizationException catch (e) {
  //     if (e.code != AuthorizationErrorCode.canceled) {
  //       Get.snackbar(
  //         "Error",
  //         e.message,
  //         snackPosition: SnackPosition.BOTTOM,
  //       );
  //     }
  //   } catch (e) {
  //     if (MahasConfig.hasInternet == false) {
  //       Get.snackbar(
  //         "Error",
  //         "Tidak ada koneksi internet",
  //         snackPosition: SnackPosition.BOTTOM,
  //       );
  //     } else {
  //       Get.snackbar(
  //         "Error",
  //         e.toString(),
  //         snackPosition: SnackPosition.BOTTOM,
  //       );
  //     }
  //   }
  // }
}
