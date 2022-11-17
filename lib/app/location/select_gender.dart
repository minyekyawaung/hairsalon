import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hairsalon/base/constant.dart';
import 'package:hairsalon/base/fetch_pixels.dart';
import 'package:hairsalon/base/get/route_key.dart';
import 'package:hairsalon/base/get/storage.dart';
import 'package:hairsalon/base/widget_utils.dart';

import '../../base/color_data.dart';

class SelectGender extends StatelessWidget {
  SelectGender({super.key});

  final List genderImg = ['happy.png', 'woman.png'];

  @override
  Widget build(BuildContext context) {
    RxInt isSelected = 0.obs;

    return getScreenDetailDefaultView(
      context,
      'Select Gender',
      () {
        Constant.backToPrev(context);
      },
      Column(
        children: [
          30.h.verticalSpace,
          getMultilineCustomFont(
            'Please choose your Gender. This \nwill be identify needs.',
            16,
            getFontColor(context),
            fontWeight: FontWeight.w500,
            textAlign: TextAlign.center,
          ),
          30.h.verticalSpace,
          Container(
              height: 149.h,
              margin: EdgeInsets.symmetric(horizontal: 10.w),
              child: ObxValue(
                  (p0) => Row(
                      children: List.generate(
                          genderImg.length,
                          (index) => Expanded(
                                flex: 1,
                                child: InkWell(
                                  onTap: () {
                                    isSelected.value = index;
                                  },
                                  child: Container(
                                    padding:
                                        EdgeInsets.symmetric(vertical: 23.h),
                                    margin:
                                        EdgeInsets.symmetric(horizontal: 10.w),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(20.r)),
                                        border: Border.all(
                                            color: (isSelected.value == index)
                                                ? getAccentColor(context)
                                                : indicatorColor,
                                            width: 2)),
                                    child: getAssetImage(
                                        context, genderImg[index], 102, 102),
                                  ),
                                ),
                              ))),
                  isSelected)),
          30.h.verticalSpace,
          getButtonFigma(
              context, getAccentColor(context), true, 'Done', Colors.white, () {
            setDialog(true);
            print('set');
            Constant.sendToNext(context, homeScreenRoute);
          },
              EdgeInsets.symmetric(
                  horizontal: FetchPixels.getDefaultHorSpaceFigma(context)))
        ],
      ),
    );
  }
}
