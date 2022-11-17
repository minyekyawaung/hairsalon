import 'package:get/get.dart';
import 'package:hairsalon/base/get/image_controller.dart';
import 'package:hairsalon/base/get/value_selection_controller.dart';
import 'package:hairsalon/base/get/value_storage_controller.dart';

import 'bottom_selection_controller.dart';
import 'filters_controller.dart';
import 'home_controller.dart';

class StoreBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => BottomItemSelectionController());
    Get.lazyPut(() => ValueSelectionController());
    Get.lazyPut(() => HomeController());
    Get.lazyPut(() => FiltersController());
    Get.lazyPut(() => ValueStorageController());
    Get.lazyPut(() => ImageController());
  }
}
