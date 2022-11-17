import 'package:get/get.dart';

class ValueSelectionController extends GetxController {
  RxString selectedTitle = "".obs;

  setSelectedTitle(String string) {
    selectedTitle.value = string;
  }
}
