import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hairsalon/app/model/model_category.dart';
import 'package:hairsalon/base/data_file.dart';

import '../../base/color_data.dart';
import '../../base/constant.dart';
import '../../base/fetch_pixels.dart';
import '../../base/get/route_key.dart';
import '../../base/widget_utils.dart';

class SearchScreen extends StatelessWidget {
  final List<String> typeList = ["Hair", "Mackup", "Haircolor", "Spa"];

  final List<String> images = [
    'salon1.png',
    'salon2.png',
  ];
  final List<ModelCategory> catSearchList = DataFile.getAllSearchCategoryList();

  @override
  Widget build(BuildContext context) {
    TextEditingController searchController = TextEditingController();

    RxInt selectedPos = 0.obs;

    double horSpace = FetchPixels.getDefaultHorSpaceFigma(context);

    return getScreenDetailDefaultView(context, "Search", () {
      Constant.backToPrev(context);
    },
        Column(
          children: [
            30.h.verticalSpace,
            getDefaultTextFiled(context, "Search", searchController,
                getFontColor(context), (value) {},
                withPrefix: true,
                imgName: "search.svg",
                isFilled: false,
                withFilter: true, filterClick: () {
              Constant.sendToNext(context, filterScreenRoute);
            }),
            Expanded(
              flex: 1,
              child: ListView(
                shrinkWrap: true,
                children: [
                  20.h.verticalSpace,
                  SizedBox(
                      height: 30.w,
                      child: ListView.builder(
                          itemBuilder: (context, index) {
                            return ObxValue(
                                (p0) => InkWell(
                                      onTap: () {
                                        selectedPos.value = index;
                                      },
                                      child: Container(
                                        margin: EdgeInsets.only(
                                            left: (index == 0) ? horSpace : 6.w,
                                            right:
                                                (index == typeList.length - 1)
                                                    ? horSpace
                                                    : 6.w),
                                        decoration: getButtonDecoration(
                                            (selectedPos.value == index)
                                                ? lightAccentColor
                                                : Colors.transparent,
                                            borderColor: getFontHint(context),
                                            withCorners: true,
                                            withBorder:
                                                selectedPos.value != index,
                                            corner: 6.w),
                                        height: double.infinity,
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 12.w),
                                        child: Center(
                                          child: getCustomFont(
                                              typeList[index],
                                              16,
                                              (selectedPos.value == index)
                                                  ? getAccentColor(context)
                                                  : getFontGreyColor(context),
                                              1,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ),
                                    ),
                                selectedPos);
                          },
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: typeList.length,
                          padding: EdgeInsets.zero)),
                  20.h.verticalSpace,
                  ListView.builder(
                    itemBuilder: (context, index) {
                      return buildItemCategoryDetail(
                          context, catSearchList[index], () {
                        Constant.sendToNext(context, salonScreenRoute);
                      });
                    },
                    itemCount: catSearchList.length,
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                  ),
                  ListView.builder(
                    itemBuilder: (context, index) {
                      return buildItemNearestSalonDetail(context, () {
                        Constant.sendToNext(context, salonDetailScreenRoute);
                      }, img: images[index]);
                    },
                    itemCount: 2,
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                  )
                ],
              ),
            )
          ],
        ),
        centerTitle: true);
  }
}
