import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hairsalon/base/constant.dart';
import 'package:hairsalon/base/fetch_pixels.dart';
import 'package:hairsalon/base/get/route_key.dart';
import 'package:hairsalon/base/widget_utils.dart';

import '../../base/color_data.dart';

class SelectLocation extends StatefulWidget {
  const SelectLocation({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _SelectLocation();
  }
}

class _SelectLocation extends State<SelectLocation> {
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return getScreenDetailDefaultView(
      context,
      'Select location',
      () {
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
              withFilter: false),
          20.h.verticalSpace,
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: FetchPixels.getDefaultHorSpaceFigma(context)),
            child: Row(
              children: [
                getSvgImage(context, 'jps.svg', 24),
                10.w.horizontalSpace,
                getCustomFont(
                    'Use current location', 16, getFontColor(context), 1,
                    fontWeight: FontWeight.w700)
              ],
            ),
          ),
          20.h.verticalSpace,
          Flexible(
            flex: 1,
            child: ListView.separated(
              padding: EdgeInsets.symmetric(vertical: 10.h),
              shrinkWrap: true,
              itemCount: 4,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Constant.sendToNext(context, homeScreenRoute);
                  },
                  child: Container(
                      height: 72.h,
                      margin: EdgeInsets.symmetric(
                          horizontal:
                              FetchPixels.getDefaultHorSpaceFigma(context)),
                      child: Row(
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              getSvgImage(context, 'location.svg', 20,
                                  color: getFontColor(context)),
                              8.h.verticalSpace,
                              getCustomFont('83 m', 14, getFontHint(context), 1,
                                  fontWeight: FontWeight.w400)
                            ],
                          ),
                          25.w.horizontalSpace,
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              getCustomFont(
                                  'Austin', 16, getFontColor(context), 1,
                                  fontWeight: FontWeight.w500),
                              10.h.verticalSpace,
                              getCustomFont('3605 Parker Rd.', 12,
                                  getFontHint(context), 1,
                                  fontWeight: FontWeight.w400),
                            ],
                          )
                        ],
                      )),
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return getDivider();
              },
            ),
          )
        ],
      ),
    );
  }
}
