import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';

import '../../base/color_data.dart';
import '../../base/constant.dart';
import '../../base/fetch_pixels.dart';
import '../../base/get/filters_controller.dart';
import '../../base/widget_utils.dart';

class FilterScreen extends StatelessWidget {
  final List<String> serviceList = [
    "Mackup",
    "Spa",
    "Hairstyle",
    "Facial Makeup",
    "Hair color",
    "Triming"
  ];
  final List<String> genderList = ["Male", "Female"];

  final List<String> spinnerItems = ['One', 'Two', 'Three', 'Four', 'Five'];

  @override
  Widget build(BuildContext context) {
    double horSpace = FetchPixels.getDefaultHorSpaceFigma(context);
    var controllerGet = Get.find<FiltersController>();

    return getScreenDetailDefaultView(context, "Filters", () {
      Constant.backToPrev(context);
    },
        Column(
          children: [
            Expanded(
              flex: 1,
              child: ListView(
                children: [
                  buildTitle(context, "Services"),
                  Wrap(
                    direction: Axis.horizontal,
                    spacing: 11.w,
                    runSpacing: 12.h,
                    children: List.generate(
                        serviceList.length,
                        (index) => ObxValue((p0) {
                              bool isSelected =
                                  controllerGet.servicePos.value == index;
                              return InkWell(
                                onTap: () {
                                  controllerGet.servicePos.value = index;
                                },
                                child: Container(
                                  height: 33.h,
                                  decoration: getButtonDecoration(
                                      (isSelected)
                                          ? lightAccentColor
                                          : Colors.transparent,
                                      withBorder: true,
                                      borderColor: (isSelected)
                                          ? getAccentColor(context)
                                          : getFontHint(context),
                                      withCorners: true,
                                      corner: 16.h),
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 16.w),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      getCustomFont(
                                          serviceList[index],
                                          14,
                                          (isSelected)
                                              ? getAccentColor(context)
                                              : getFontColor(context),
                                          1,
                                          textAlign: TextAlign.center,
                                          fontWeight: (isSelected)
                                              ? FontWeight.w700
                                              : FontWeight.w400),
                                    ],
                                  ),
                                ),
                              );
                            }, controllerGet.servicePos)),
                  ),
                  buildTitle(context, "Barbers"),
                  Wrap(
                    direction: Axis.horizontal,
                    spacing: 11.w,
                    runSpacing: 12.h,
                    children: List.generate(
                        genderList.length,
                        (index) => ObxValue((p0) {
                              bool isSelected =
                                  controllerGet.barberPos.value == index;
                              return InkWell(
                                onTap: () {
                                  controllerGet.barberPos.value = index;
                                },
                                child: Container(
                                  height: 33.h,
                                  decoration: getButtonDecoration(
                                      (isSelected)
                                          ? lightAccentColor
                                          : Colors.transparent,
                                      withBorder: true,
                                      borderColor: (isSelected)
                                          ? getAccentColor(context)
                                          : getFontHint(context),
                                      withCorners: true,
                                      corner: 16.h),
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 16.w),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      getCustomFont(
                                          genderList[index],
                                          14,
                                          (isSelected)
                                              ? getAccentColor(context)
                                              : getFontColor(context),
                                          1,
                                          textAlign: TextAlign.center,
                                          fontWeight: (isSelected)
                                              ? FontWeight.w700
                                              : FontWeight.w400),
                                    ],
                                  ),
                                ),
                              );
                            }, controllerGet.barberPos)),
                  ),
                  buildTitle(context, "Ratings"),
                  ObxValue(
                      (p0) => Row(
                            children: [
                              GFRating(
                                onChanged: (rating) {
                                  controllerGet.rateValue.value = rating;
                                },
                                value: controllerGet.rateValue.value,
                                itemCount: 5,
                                size: 24.h,
                                spacing: 6.w,
                                allowHalfRating: false,
                                defaultIcon: getSvgImageWithSize(
                                    context, "rating.svg", 24.h, 24.h),
                                filledIcon: getSvgImageWithSize(
                                    context, "star.svg", 24.h, 24.h),
                              ),
                              20.w.horizontalSpace,
                              Expanded(
                                flex: 1,
                                child: getCustomFont(
                                    "${controllerGet.rateValue.value}+",
                                    16,
                                    getFontColor(context),
                                    1,
                                    fontWeight: FontWeight.w500),
                              )
                            ],
                          ),
                      controllerGet.rateValue),
                  ObxValue(
                      (p0) => buildTitle(context, "Price range",
                          subVal:
                              "\$${controllerGet.rangePrice.value.start.toInt()}-\$${controllerGet.rangePrice.value.end.toInt()}"),
                      controllerGet.rangePrice),
                  ObxValue(
                      (p0) => RangeSlider(
                            inactiveColor: lightAccentColor,
                            activeColor: getAccentColor(context),
                            onChanged: (value) {
                              controllerGet.rangePrice.value = value;
                            },
                            min: controllerGet.minPrice,
                            max: controllerGet.maxPrice,
                            values: controllerGet.rangePrice.value,
                          ),
                      controllerGet.rangePrice),
                  buildTitle(context, "Sorted by"),
                  ObxValue(
                      (p0) => Container(
                            width: double.infinity,
                            height: 56.h,
                            decoration: getButtonDecoration(Colors.transparent,
                                withCorners: true,
                                corner: getButtonCornersFigma(),
                                withBorder: true,
                                borderColor: getFontHint(context)),
                            child: Center(
                              child: DropdownButton<String>(
                                value: spinnerItems[
                                    controllerGet.selectedSortPos.value],
                                icon: getSvgImageWithSize(
                                    context, "arrow_down.svg", 18.h, 18.h),
                                iconSize: 24,
                                borderRadius:
                                    BorderRadius.all(const Radius.circular(15)),
                                isDense: true,
                                isExpanded: true,
                                style: buildTextStyle(context,
                                    getFontColor(context), FontWeight.w500, 16),
                                underline: 0.verticalSpace,
                                onChanged: (String? data) {
                                  controllerGet.selectedSortPos.value =
                                      spinnerItems.indexOf(data ?? "");
                                },
                                items: spinnerItems
                                    .map<DropdownMenuItem<String>>(
                                        (String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                              ).marginSymmetric(horizontal: 16.w),
                            ),
                          ),
                      controllerGet.selectedSortPos),
                  ObxValue(
                      (p0) => buildTitle(context, "Distance",
                          subVal:
                              "${controllerGet.distanceVal.value.toInt().toString()} km"),
                      controllerGet.distanceVal),
                  ObxValue(
                      (p0) => Slider(
                            inactiveColor: lightAccentColor,
                            activeColor: getAccentColor(context),
                            onChanged: (value) {
                              controllerGet.distanceVal.value = value;
                            },
                            min: controllerGet.minDistance,
                            max: controllerGet.maxDistance,
                            value: controllerGet.distanceVal.value,
                          ),
                      controllerGet.distanceVal)
                ],
              ),
            ),
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: getButtonFigma(context, getAccentColor(context), true,
                      "Apply", Colors.white, () {
                    Constant.backToPrev(context);
                  }, EdgeInsets.zero),
                ),
                20.w.horizontalSpace,
                Expanded(
                  flex: 1,
                  child: getButtonFigma(
                      context,
                      Colors.transparent,
                      true,
                      "Clear All",
                      getAccentColor(context),
                      () {},
                      isBorder: true,
                      borderColor: getAccentColor(context),
                      EdgeInsets.zero),
                )
              ],
            ).marginSymmetric(vertical: 30.h)
          ],
        ).paddingSymmetric(horizontal: horSpace),
        centerTitle: true);
  }

  Widget buildTitle(BuildContext context, String title, {String subVal = ""}) {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: getCustomFont(title, 18, getFontColor(context), 1,
              fontWeight: FontWeight.w700),
        ),
        (subVal.isNotEmpty)
            ? getCustomFont(subVal, 16, getFontColor(context), 1,
                fontWeight: FontWeight.w500)
            : 0.horizontalSpace
      ],
    ).marginOnly(top: 20.h, bottom: 10.h);
  }
}
