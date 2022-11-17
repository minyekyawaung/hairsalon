import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hairsalon/app/model/model_appointment_detail.dart';
import 'package:hairsalon/base/data_file.dart';
import 'package:hairsalon/base/get/route_key.dart';

import '../../base/color_data.dart';
import '../../base/constant.dart';
import '../../base/fetch_pixels.dart';
import '../../base/get/bottom_selection_controller.dart';
import '../../base/get/value_storage_controller.dart';
import '../../base/widget_utils.dart';
import '../model/model_services.dart';

class BookingDetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var storeController = Get.find<ValueStorageController>();

    Constant.setupSize(context);
    double horSpace = FetchPixels.getDefaultHorSpaceFigma(context);
    ModelServices? services = DataFile.getAllServicesList()[0];
    return getScreenDetailDefaultView(context, "", () {
      Constant.backToPrev(context);
    },
        Column(
          children: [
            Expanded(
              flex: 1,
              child: ListView(
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                children: [
                  30.h.verticalSpace,
                  buildSelectedServiceItem(
                      horSpace, context, services, storeController,
                      withValueChangerView: false),
                  Row(children: [
                    Icon(
                      Icons.circle,
                      size: 8.h,
                      color: getAccentColor(context),
                    ).marginOnly(left: horSpace),
                    8.w.horizontalSpace,
                    Expanded(
                      flex: 1,
                      child: getCustomFont(
                          "Royalty barbershop", 16, getFontColor(context), 1,
                          fontWeight: FontWeight.w500,
                          fontFamily: Constant.fontsFamilyLato),
                    )
                  ]),
                  12.h.verticalSpace,
                  buildLocationRow(context, "8502 Preston Rd. Inglewood, Maine",
                          getFontGreyColor(context),
                          fontSize: 14, weight: FontWeight.w400)
                      .paddingSymmetric(horizontal: horSpace),
                  buildAppointmentDetailView(
                      context, storeController.modelAppointmentDetail!)
                ],
              ),
            ),
            getButtonFigma(context, getAccentColor(context), true,
                "Delete Appointment", Colors.white, () {
              showGetDialog(
                  context,
                  "delete_img.png",
                  "Delete Appointment ?",
                  "Do you want to delete the\nappointment ?",
                  "Delete",
                  () {
                    Get.back();
                    final controller =
                        Get.find<BottomItemSelectionController>();
                    controller.bottomBarSelectedItem.value = 2;
                    Constant.sendToNext(context, homeScreenRoute);
                  },
                  dialogHeight: 400,
                  imgWidth: 57,
                  imgHeight: 75,
                  withCancelBtn: true,
                  functionCancel: () {
                    Get.back();
                  },
                  btnTextCancel: "Cancel");
            }, EdgeInsets.symmetric(horizontal: horSpace, vertical: 30.h))
          ],
        ),
        centerTitle: true);
  }

  Widget buildAppointmentDetailView(
      BuildContext context, ModelAppointmentDetail appointmentDetail) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        20.h.verticalSpace,
        buildTitles(context, "Appointment Detail", withPadding: false),
        16.h.verticalSpace,
        buildPaymentDetail(context, "Specialists", appointmentDetail.name),
        16.h.verticalSpace,
        buildPaymentDetail(context, "Appointment date", appointmentDetail.date),
        16.h.verticalSpace,
        buildPaymentDetail(context, "Appointment Time", appointmentDetail.time),
        getDivider().marginSymmetric(vertical: 10.h),
        buildTitles(context, "Payment Detail", withPadding: false),
        16.h.verticalSpace,
        buildPaymentDetail(context, "Service Charge Total",
            appointmentDetail.serviceChargeTotal),
        16.h.verticalSpace,
        buildPaymentDetail(
            context, "Discount (20%)", appointmentDetail.discount),
        getDivider().marginOnly(top: 10.h),
        9.h.verticalSpace,
        Row(
          children: [
            Expanded(
              flex: 1,
              child: getCustomFont(
                  "Total payment", 20, getFontColor(context), 1,
                  fontWeight: FontWeight.w700),
            ),
            getCustomFont(appointmentDetail.total, 20, getFontColor(context), 1,
                fontWeight: FontWeight.w700)
          ],
        ).marginSymmetric(
          vertical: 9.h,
        )
      ],
    ).paddingSymmetric(
        horizontal: FetchPixels.getDefaultHorSpaceFigma(context));
  }

  Widget buildPaymentDetail(
      BuildContext context, String title, String description) {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: getCustomFont(title, 16, getFontColor(context), 1,
              fontWeight: FontWeight.w400),
        ),
        getCustomFont(description, 16, getFontColor(context), 1,
            fontWeight: FontWeight.w500)
      ],
    );
  }
}
