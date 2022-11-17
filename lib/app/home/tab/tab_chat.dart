import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hairsalon/base/fetch_pixels.dart';
import 'package:hairsalon/base/get/route_key.dart';

import '../../../base/color_data.dart';
import '../../../base/data_file.dart';

import '../../../base/constant.dart';
import '../../../base/widget_utils.dart';
import '../../model/model_profile.dart';

class TabChat extends StatelessWidget {
  final List<ModelProfile> allProfileList = DataFile.getAllProfileList();

  @override
  Widget build(BuildContext context) {
    RxInt currentMsg = 3.obs;

    TextEditingController searchController = TextEditingController();

    return getScreenDetailDefaultView(
        context,
        'Message',
        () {},
        Column(
          children: [
            30.h.verticalSpace,
            getDefaultTextFiled(
              context,
              "Search",
              searchController,
              getFontColor(context),
              (value) {},
              withPrefix: true,
              imgName: "search.svg",
              isFilled: false,
              withFilter: false,
            ),
            20.h.verticalSpace,
            Container(
              width: double.infinity,
              height: 90.h,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 5,
                padding: EdgeInsets.zero,
                itemBuilder: (context, index) {
                  return buildProfileItem(context, index, () {
                    Constant.sendToNext(context, chatScreenRoute);
                  }, allProfileList[index], index == allProfileList.length - 1);
                },
              ),
            ),
            15.h.verticalSpace,
            Expanded(
              child: ListView.builder(
                itemCount: 6,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Constant.sendToNext(context, chatScreenRoute);
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(
                          horizontal:
                              FetchPixels.getDefaultHorSpaceFigma(context),
                          vertical: 15.h),
                      child: Row(
                        children: [
                          getCircleImage(context, 'profile.jpg', 50.h),
                          12.w.horizontalSpace,
                          Expanded(
                            flex: 1,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                getCustomFont(
                                    'Maria Sana', 16, getFontColor(context), 1,
                                    fontWeight: FontWeight.w500),
                                5.h.verticalSpace,
                                getCustomFont('how are you ?', 16,
                                    getFontGreyColor(context), 1,
                                    fontWeight: FontWeight.w500),
                              ],
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              getCustomFont(
                                  '4:00 PM', 14, getFontGreyColor(context), 1,
                                  fontWeight: FontWeight.w400),
                              5.h.verticalSpace,
                              (currentMsg.value != 0)
                                  ? CircleAvatar(
                                      backgroundColor: getAccentColor(context),
                                      maxRadius: 12.r,
                                      minRadius: 10.r,
                                      child: getCustomFont(
                                          '${currentMsg.value}',
                                          14,
                                          Colors.white,
                                          1,
                                          fontWeight: FontWeight.w500),
                                    )
                                  : Container(),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            105.h.verticalSpace,
          ],
        ),withLeading: false);
  }
}
