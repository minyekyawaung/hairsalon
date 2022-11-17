import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FiltersController extends GetxController {
  RxInt servicePos = 0.obs;
  RxInt barberPos = 0.obs;
  RxInt selectedSortPos = 0.obs;
  RxDouble rateValue = 5.0.obs;
  double minPrice = 10;
  double minDistance = 1;
  double maxDistance = 10;
  RxDouble distanceVal = 5.0.obs;
  double maxPrice = 100;
  var rangePrice = const RangeValues(20, 30).obs;

  setPriceRange(RangeValues string) {
    rangePrice.value = string;
  }

  setRatingValue(double string) {
    rateValue.value = string;
  }

  setSelectedService(int string) {
    servicePos.value = string;
  }

  setSelectedSortingList(int string) {
    selectedSortPos.value = string;
  }

  setBarberPosition(int string) {
    barberPos.value = string;
  }
}
