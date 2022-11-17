import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hairsalon/base/color_data.dart';
import 'package:hairsalon/base/widget_utils.dart';

import '../../base/constant.dart';
import '../../base/data_file.dart';
import '../../base/fetch_pixels.dart';
import '../../base/get/route_key.dart';
import '../../base/get/value_storage_controller.dart';
import '../model/model_profile.dart';
import 'package:intl/intl.dart';

import '../model/model_services.dart';

class ConfirmList extends StatelessWidget {
  final List<ModelProfile> allProfileList = DataFile.getAllProfileList();

  @override
  Widget build(BuildContext context) {
    var storeController = Get.find<ValueStorageController>();

    RxInt selectedSlotIndex = 0.obs;

    Rx date = DateTime.now().obs;

    Constant.setupSize(context);
    double horSpace = FetchPixels.getDefaultHorSpaceFigma(context);
    ModelServices? services = storeController.selectedService;

    return getScreenDetailDefaultView(context, "Confirm", () {
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
                  buildSelectedServiceItem(
                      horSpace, context, services, storeController),
                  19.h.verticalSpace,
                  buildTitles(context, "Select your date"),
                  16.h.verticalSpace,
                  ObxValue(
                      (p0) => buildDatePickerButton(
                              context,
                              "${DateFormat('yyyy-MM-dd').format(date.value)}",
                              "calender.svg", () async {
                            DateTime? pickedDate = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(1950),
                              lastDate: DateTime(2050),
                            );

                            if (pickedDate != null) {
                              date.value = pickedDate;
                              print('fdate---${date.value}---${pickedDate}');
                            }
                          }),
                      date),
                  20.h.verticalSpace,
                  buildTitles(context, "Select specialists"),
                  16.h.verticalSpace,
                  Container(
                    width: double.infinity,
                    height: 92.h,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 3,
                      padding: EdgeInsets.zero,
                      itemBuilder: (context, index) {
                        return buildProfileItem(context, index, () {
                          Constant.sendToNext(
                              context, specialistDetailScreenRoute);
                        }, allProfileList[index],
                            index == allProfileList.length - 1);
                      },
                    ),
                  ),
                  20.h.verticalSpace,
                  buildTitles(context, "Available "
                      ""),
                  16.h.verticalSpace,
                  Wrap(
                    runSpacing: 10.w,
                    spacing: 10.w,
                    children: List.generate(DataFile.slotTime.length, (index) {
                      return ObxValue(
                          (p0) => InkWell(
                                onTap: () {
                                  selectedSlotIndex.value = index;
                                },
                                child: itemSlotBooking(
                                    index,
                                    context,
                                    selectedSlotIndex.value == index,
                                    DataFile.slotTime[index],
                                    112.w),
                              ),
                          selectedSlotIndex);
                    }),
                  ).marginSymmetric(horizontal: horSpace)
                ],
              ),
            ),
            getButtonFigma(context, getAccentColor(context), true,
                "Book Appointment", Colors.white, () {
              Constant.sendToNext(context, paymentListRoute);
            }, EdgeInsets.symmetric(horizontal: horSpace, vertical: 30.h))
          ],
        ),
        centerTitle: true);
  }
}
