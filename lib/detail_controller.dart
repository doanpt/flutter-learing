import 'package:get/get.dart';

class DetailController extends GetxController {
  var fav = 0.obs;

  void favCounter() {
    if (fav.value == 1) {
      Get.snackbar("Love it", "You already loved it");
    } else {
      Get.snackbar("Love it", "You just loved it");
    }
  }
}
