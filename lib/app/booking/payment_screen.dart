import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hairsalon/app/model/model_appointment_detail.dart';
import 'package:hairsalon/base/data_file.dart';
import 'package:hairsalon/base/get/route_key.dart';

import '../../base/color_data.dart';
import '../../base/constant.dart';
import '../../base/fetch_pixels.dart';
import '../../base/get/value_storage_controller.dart';
import '../../base/widget_utils.dart';
import '../model/model_payment.dart';
import '../model/model_services.dart';

class PaymentScreen extends StatelessWidget {
  final List<ModelPayment> paymentList = DataFile.getAllPaymentList();

  @override
  Widget build(BuildContext context) {
    var storeController = Get.find<ValueStorageController>();

    Constant.setupSize(context);
    double horSpace = FetchPixels.getDefaultHorSpaceFigma(context);
    ModelServices? services = storeController.selectedService;

    return getScreenDetailDefaultView(context, "Payment", () {
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
                  Row(
                    children: List.generate(
                        paymentList.length,
                        (index) => ObxValue(
                            (p0) => Expanded(
                                  flex: 1,
                                  child: InkWell(
                                    onTap: () {
                                      storeController
                                          .selectedPaymentOption.value = index;
                                    },
                                    child: Container(
                                      margin: EdgeInsets.symmetric(
                                          horizontal: 10.w),
                                      decoration: getButtonDecoration(
                                          getCardColor(context),
                                          withCorners: true,
                                          corner: 12.h,
                                          withBorder: (storeController
                                                  .selectedPaymentOption
                                                  .value ==
                                              index),
                                          borderColor: getAccentColor(context),
                                          shadow: [
                                            const BoxShadow(
                                                color: Color.fromRGBO(0, 0, 0,
                                                    0.07999999821186066),
                                                offset: Offset(-4, 5),
                                                blurRadius: 16)
                                          ]),
                                      width: double.infinity,
                                      height: 57.h,
                                      child: Center(
                                        child: getSvgImageWithSize(
                                            context,
                                            paymentList[index].image,
                                            34.h,
                                            34.h,
                                            fit: BoxFit.fill),
                                      ),
                                    ),
                                  ),
                                ),
                            storeController.selectedPaymentOption)),
                  ).paddingSymmetric(horizontal: 10.w),
                  20.h.verticalSpace,
                  buildSelectedServiceItem(
                      horSpace, context, services, storeController),
                  buildAppointmentDetailView(
                      context, storeController.modelAppointmentDetail!)
                ],
              ),
            ),
            getButtonFigma(
                context, getAccentColor(context), true, "Confirm", Colors.white,
                () {
              showGetDialog(context, "confirm_booking.png", "Booking Confirm!",
                  "Your booking has been successfully\nconfirmed!", "Ok", () {
                Get.back();
                Constant.sendToNext(context, homeScreenRoute);
              }, dialogHeight: 465, imgWidth: 96, imgHeight: 129);
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
