import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hairsalon/base/color_data.dart';
import 'package:hairsalon/base/get/route_key.dart';
import 'package:hairsalon/base/get/value_storage_controller.dart';
import 'package:hairsalon/base/widget_utils.dart';

import '../../base/constant.dart';
import '../../base/data_file.dart';
import '../../base/fetch_pixels.dart';
import '../model/model_services.dart';

class ServicesList extends StatelessWidget {
  final List<ModelServices> categoryList = DataFile.getAllServicesList();

  @override
  Widget build(BuildContext context) {
    RxInt selectedList = 0.obs;

    Constant.setupSize(context);
    double horSpace = FetchPixels.getDefaultHorSpaceFigma(context);

    return getScreenDetailDefaultView(context, "Select Services", () {
      Constant.backToPrev(context);
    },
        Column(
          children: [
            Expanded(
              flex: 1,
              child: ListView.builder(
                padding: EdgeInsets.symmetric(vertical: 10.h),
                shrinkWrap: true,
                itemCount: categoryList.length,
                itemBuilder: (context, index) {
                  ModelServices category = categoryList[index];
                  return ObxValue((p0) {
                    bool isSelected = index == selectedList.value;
                    return InkWell(
                      onTap: () {
                        selectedList.value = index;
                      },
                      child: Container(
                        width: double.infinity,
                        height: 101.h,
                        padding: EdgeInsets.all(10.h),
                        margin: EdgeInsets.symmetric(
                            horizontal: horSpace, vertical: 10.h),
                        decoration: getButtonDecoration(getCardColor(context),
                            withCorners: true,
                            corner: 20.h,
                            withBorder: isSelected,
                            borderColor: getAccentColor(context),
                            shadow: [
                              const BoxShadow(
                                  color: Color.fromRGBO(
                                      0, 0, 0, 0.07999999821186066),
                                  offset: Offset(-4, 5),
                                  blurRadius: 16)
                            ]),
                        child: Row(
                          children: [
                            Container(
                              width: 88.h,
                              height: double.infinity,
                              child: Stack(
                                children: [
                                  getCircularImage(context, double.infinity,
                                      double.infinity, 20.h, category.img,
                                      boxFit: BoxFit.cover),
                                  Align(
                                    alignment: Alignment.bottomRight,
                                    child: Container(
                                      height: 24.h,
                                      width: 24.h,
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: lightAccentColor),
                                      child: Center(
                                        child: (isSelected)
                                            ? getSvgImageWithSize(context,
                                                "check_circle.svg", 18.h, 18.h,
                                                fit: BoxFit.fill)
                                            : 0.horizontalSpace,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            12.w.horizontalSpace,
                            Expanded(
                              flex: 1,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  getCustomFont(category.name, 18,
                                      getFontColor(context), 1,
                                      fontWeight: FontWeight.w700),
                                  getCustomFont(category.desc, 14,
                                      getFontGreyColor(context), 1,
                                      fontWeight: FontWeight.w400),
                                  getCustomFont(category.duration, 14,
                                      getFontGreyColor(context), 1,
                                      fontWeight: FontWeight.w400)
                                ],
                              ),
                            ),
                            getCustomFont("\$${category.price}", 20,
                                getFontColor(context), 1,
                                fontWeight: FontWeight.w700),
                          ],
                        ),
                      ),
                    );
                  }, selectedList);
                },
              ),
            ),
            getButtonFigma(
                context, getAccentColor(context), true, "Next", Colors.white,
                () {
              Get.find<ValueStorageController>()
                  .setSelectedService(categoryList[selectedList.value]);
              Constant.sendToNext(context, confirmServiceListRoute);
            }, EdgeInsets.symmetric(horizontal: horSpace, vertical: 30.h))
          ],
        ),
        centerTitle: true);
  }
}
