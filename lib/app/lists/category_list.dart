import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hairsalon/base/color_data.dart';
import 'package:hairsalon/base/get/route_key.dart';
import 'package:hairsalon/base/widget_utils.dart';

import '../../base/constant.dart';
import '../../base/data_file.dart';
import '../../base/fetch_pixels.dart';
import '../model/model_category.dart';

class CategoryList extends StatelessWidget {
  final List<ModelCategory> categoryList = DataFile.getAllCategoryList();

  @override
  Widget build(BuildContext context) {
    Constant.setupSize(context);

    return getScreenDetailDefaultView(context, "Categories", () {
      Constant.backToPrev(context);
    },
        ListView.builder(
          padding: EdgeInsets.symmetric(vertical: 10.h),
          shrinkWrap: true,
          itemCount: categoryList.length,
          itemBuilder: (context, index) {
            ModelCategory category = categoryList[index];
            return buildItemCategoryDetail(context, category, () {
              Get.bottomSheet(
                Container(
                  padding: EdgeInsets.symmetric(vertical: 20.h),
                  child: ListView.builder(
                      itemBuilder: (context, index) {
                        return Container(
                          margin: EdgeInsets.symmetric(
                              horizontal:
                                  FetchPixels.getDefaultHorSpaceFigma(context),
                              vertical: 10.h),
                          decoration: getButtonDecoration(getCardColor(context),
                              withCorners: true,
                              corner: 20.h,
                              shadow: [
                                const BoxShadow(
                                    color: Color.fromRGBO(
                                        0, 0, 0, 0.07999999821186066),
                                    offset: Offset(-4, 5),
                                    blurRadius: 16)
                              ]),
                          width: double.infinity,
                          height: 130.h,
                          padding: EdgeInsets.symmetric(
                              vertical: 10.h, horizontal: 10.w),
                          child: InkWell(
                            onTap: () {
                              Constant.backToPrev(context);
                              Constant.sendToNext(
                                  context, salonDetailScreenRoute);
                            },
                            child: Row(
                              children: [
                                getCircularImageApi(context, 108.h,
                                    double.infinity, 20.h, "haircut.png",
                                    boxFit: BoxFit.cover),
                                12.w.horizontalSpace,
                                Expanded(
                                  flex: 1,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Expanded(
                                            flex: 1,
                                            child: getCustomFont(
                                              "Hair Cut for men",
                                              16,
                                              getFontColor(context),
                                              1,
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                          buildStarView(context, "4.9")
                                        ],
                                      ),
                                      10.h.verticalSpace,
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.circle,
                                            size: 8.h,
                                            color: getAccentColor(context),
                                          ),
                                          8.w.horizontalSpace,
                                          getCustomFont(
                                            "Royalty barbershop",
                                            14,
                                            getFontColor(context),
                                            1,
                                            fontWeight: FontWeight.w400,
                                          )
                                        ],
                                      ),
                                      10.h.verticalSpace,
                                      Row(
                                        children: [
                                          Expanded(
                                            flex: 1,
                                            child: getCustomFont(
                                              "\$20.00",
                                              16,
                                              getAccentColor(context),
                                              1,
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                          buildButtonBookNow(context, () {})
                                        ],
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                      },
                      padding: EdgeInsets.zero,
                      itemCount: 3,
                      shrinkWrap: true),
                ),
                backgroundColor:
                    getCurrentTheme(context).scaffoldBackgroundColor,
                shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(22.h))),
              );
            });
          },
        ),
        centerTitle: true);
  }
}
