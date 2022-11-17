import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hairsalon/base/color_data.dart';
import 'package:hairsalon/base/constant.dart';
import 'package:hairsalon/base/get/route_key.dart';
import 'package:hairsalon/base/widget_utils.dart';

import '../../base/fetch_pixels.dart';

class SelectOtherLocation extends StatefulWidget {
  const SelectOtherLocation({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _SelectOtherLocation();
  }
}

class _SelectOtherLocation extends State<SelectOtherLocation> {
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Constant.setupSize(context);
    return Scaffold(
      backgroundColor: getCurrentTheme(context).scaffoldBackgroundColor,
      body: Container(
          decoration: BoxDecoration(
              image: getDecorationAssetImage(context, 'map.png',
                  fit: BoxFit.cover)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Expanded(
                flex: 1,
                child: Column(
                  children: [
                    58.h.verticalSpace,
                    getDefaultTextFiled(
                      context,
                      "Search your favourite Salon",
                      searchController,
                      getFontColor(context),
                      (value) {},
                      withPrefix: true,
                      imgName: "search.svg",
                      isFilled: true,
                      withFilter: false,
                    ),
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(
                    horizontal: FetchPixels.getDefaultHorSpaceFigma(context)),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(22.r),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    20.h.verticalSpace,
                    getCustomFont(
                        'Select Current Location', 16.sp, fontPrimary, 1),
                    6.h.verticalSpace,
                    Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Row(
                            children: [
                              getSvgImage(context, 'location.svg', 24,
                                  color: getFontColor(context)),
                              5.w.horizontalSpace,
                              getCustomFont(
                                  "Austin", 20, getFontColor(context), 1,
                                  fontWeight: FontWeight.w700),
                            ],
                          ),
                        ),
                        Container(
                          height: 30.h,
                          width: 77.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(20.r),
                            ),
                            border: Border.all(color: getAccentColor(context)),
                          ),
                          child: Center(
                              child: getCustomFont(
                                  'Change', 16, getAccentColor(context), 1,
                                  fontWeight: FontWeight.w700)),
                        ),
                      ],
                    ),
                    6.h.verticalSpace,
                    getMultilineCustomFont(
                        '2118 Thornridge Cir. Syracuse, \nConnecticut 35624',
                        16,
                        getFontColor(context),
                        fontWeight: FontWeight.w500),
                    20.h.verticalSpace,
                    getButtonFigma(context, getAccentColor(context), true,
                        'Confirm Location', Colors.white, () {
                      Constant.sendToNext(context, homeScreenRoute);
                    }, EdgeInsets.zero),
                    30.h.verticalSpace
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
