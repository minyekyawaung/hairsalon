import 'package:get/get.dart';
import 'package:hairsalon/app/model/model_appointment_detail.dart';
import 'package:hairsalon/app/model/model_services.dart';

class ValueStorageController extends GetxController {
  ModelServices? selectedService;
  RxInt selectedServiceQuantity = 1.obs;

  RxInt selectedPaymentOption = 0.obs;
  ModelAppointmentDetail? modelAppointmentDetail;

  @override
  void onInit() {
    super.onInit();
    modelAppointmentDetail = ModelAppointmentDetail(
        "Kirean Dely", "20 june 2022", "9:00 AM", "\$150", "-\$6.00", "\$140");
  }

  setSelectedService(ModelServices services) {
    selectedService = services;
  }
}
