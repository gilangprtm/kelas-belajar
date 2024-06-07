import 'package:get/get.dart';

class BaseController extends GetxController {
  RxInt selectedIndex = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  void changeIndex(int index) {
    selectedIndex.value = index;
  }
}
