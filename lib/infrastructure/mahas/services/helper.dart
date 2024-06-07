import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:uuid/uuid.dart';

import '../mahas_colors.dart';
import '../components/mahas_themes.dart';

enum HttpMethod {
  get,
  post,
  delete,
}

class Helper {
  static Future<bool?> dialogQuestion({
    String? message,
    IconData? icon,
    String? textConfirm,
    String? textCancel,
    Function()? confirmAction,
    Color? color,
  }) async {
    return await Get.dialog<bool?>(
      AlertDialog(
        shape: RoundedRectangleBorder(
            borderRadius:
                BorderRadius.all(Radius.circular(MahasThemes.borderRadius))),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon ?? FontAwesomeIcons.question,
              color: color ?? MahasColors.primary,
              size: 40,
            ),
            const Padding(padding: EdgeInsets.all(10)),
            Text(
              message ?? "",
              textAlign: TextAlign.center,
            ),
          ],
        ),
        contentPadding:
            const EdgeInsets.only(bottom: 0, top: 20, right: 20, left: 20),
        actionsPadding:
            const EdgeInsets.only(top: 10, bottom: 5, left: 20, right: 20),
        actions: [
          TextButton(
            child: Text(
              textCancel ?? "Close",
              style: const TextStyle(
                color: MahasColors.dark,
              ),
            ),
            onPressed: () {
              Get.back(result: false);
            },
          ),
          TextButton(
            child: Text(
              textConfirm ?? "OK",
              style: TextStyle(
                color: color ?? MahasColors.primary,
              ),
            ),
            onPressed: () {
              Get.back(result: true);
              confirmAction != null ? confirmAction() : null;
            },
          ),
        ],
      ),
    );
  }

  static Future<bool?> dialogUpdate({
    required bool harusUpdate,
    required String versiTerbaru,
  }) async {
    return await Get.dialog<bool?>(
      AlertDialog(
        shape: RoundedRectangleBorder(
            borderRadius:
                BorderRadius.all(Radius.circular(MahasThemes.borderRadius))),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              FontAwesomeIcons.question,
              color: MahasColors.primary,
              size: 40,
            ),
            const Padding(padding: EdgeInsets.all(10)),
            Text(
              "Versi $versiTerbaru sudah tersedia",
              textAlign: TextAlign.center,
            ),
          ],
        ),
        contentPadding:
            const EdgeInsets.only(bottom: 0, top: 20, right: 20, left: 20),
        actionsPadding:
            const EdgeInsets.only(top: 10, bottom: 5, left: 20, right: 20),
        actions: [
          TextButton(
            child: Text(
              harusUpdate ? "Tutup" : "Nanti",
              style: const TextStyle(
                color: MahasColors.dark,
              ),
            ),
            onPressed: () {
              if (harusUpdate) {
                if (Platform.isAndroid) {
                  SystemNavigator.pop();
                } else if (Platform.isIOS) {
                  exit(0);
                }
              } else {
                Get.back(result: false);
              }
            },
          ),
          TextButton(
            child: Text(
              "Unduh Sekarang",
              style: TextStyle(
                color: MahasColors.primary,
              ),
            ),
            onPressed: () {
              Get.back(result: true);
            },
          ),
        ],
      ),
      barrierDismissible: false,
    );
  }

  static Future dialogWarning(
    String? message, {
    String? resMassage,
    String? noInternetMassage,
  }) async {
    final String contentMessage = resMassage != null
        ? resMassage.isEmpty
            ? noInternetMassage ?? "Tidak ada koneksi internet"
            : resMassage
        : message ?? "-";

    await Get.dialog(
      AlertDialog(
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              FontAwesomeIcons.triangleExclamation,
              color: MahasColors.warning,
              size: 40,
            ),
            const Padding(padding: EdgeInsets.all(7)),
            Text(
              textAlign: TextAlign.center,
              contentMessage,
              style: TextStyle(
                color: MahasColors.warning,
              ),
            ),
          ],
        ),
      ),
    );
  }

  static Future dialogSuccess(String? message) async {
    await Get.dialog(
      AlertDialog(
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              FontAwesomeIcons.checkToSlot,
              color: MahasColors.primary,
              size: 40,
            ),
            const Padding(padding: EdgeInsets.all(7)),
            Text(
              textAlign: TextAlign.center,
              message ?? "-",
              style: TextStyle(
                color: MahasColors.primary,
              ),
            ),
          ],
        ),
      ),
    );
  }

  static void backOnPress({
    dynamic result,
    bool questionBack = true,
    bool editable = false,
    dynamic parametes,
  }) async {
    if (questionBack && editable) {
      final r = await Helper.dialogQuestion(
        message: 'Anda yakin ingin kembali ?',
        textConfirm: 'Ya',
      );
      if (r != true) return;
    }
    Get.back(result: result);
  }

  static String idGenerator() {
    const uuid = Uuid();
    var r = uuid.v4();
    return r;
  }

  static dynamic modalMenu(List<Widget> children) async {
    return await showCustomModalBottomSheet(
      context: Get.context!,
      builder: (context) => Container(
        margin: const EdgeInsets.only(bottom: 20, left: 20, right: 20),
        decoration: BoxDecoration(
          borderRadius:
              BorderRadius.all(Radius.circular(MahasThemes.borderRadius)),
          color: MahasColors.light,
        ),
        child: Column(
          children: children,
        ),
      ),
      containerWidget: (_, animation, child) => SafeArea(
        child: Column(
          children: [Expanded(child: Container()), child],
        ),
      ),
      expand: false,
    );
  }

  static List<DateTime> calculateDaysInterval(
      DateTime startDate, DateTime endDate) {
    List<DateTime> days = [];
    for (int i = 0; i <= endDate.difference(startDate).inDays; i++) {
      days.add(startDate.add(Duration(days: i)));
    }
    return days;
  }

  static Future dialogCustomWidget(List<Widget> children) async {
    await Get.dialog(
      AlertDialog(
        shape: RoundedRectangleBorder(
            borderRadius:
                BorderRadius.all(Radius.circular(MahasThemes.borderRadius))),
        content: Column(mainAxisSize: MainAxisSize.min, children: children),
        contentPadding:
            const EdgeInsets.only(bottom: 0, top: 20, right: 10, left: 10),
        actionsPadding:
            const EdgeInsets.only(top: 0, bottom: 5, left: 20, right: 20),
        actions: [
          TextButton(
            child: const Text("Close"),
            onPressed: () {
              Get.back(result: false);
            },
          ),
        ],
      ),
    );
  }

  static Future dialogFullScreen(Widget child) async {
    await showDialog(
      context: Get.context!,
      builder: (context) {
        return Dialog(
          insetPadding: EdgeInsets.zero,
          child: SizedBox(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextButton(
                  child: const Text("Close"),
                  onPressed: () {
                    Get.back(result: false);
                  },
                ),
                child,
              ],
            ),
          ),
        );
      },
    );
  }

  static Future<List<int>> toByte(File file) async {
    List<int> byteData = await file.readAsBytes();
    return byteData;
  }
}
