import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hairsalon/base/color_data.dart';
import 'package:hairsalon/base/widget_utils.dart';
import 'package:readmore/readmore.dart';

import '../../base/constant.dart';
import '../../base/data_file.dart';
import '../../base/fetch_pixels.dart';
import 'package:intl/intl.dart';

// ignore: must_be_immutable
class OfferDetailScreen extends StatelessWidget {
  Rx date = DateTime.now().obs;

  @override
  Widget build(BuildContext context) {
    RxInt selectedSlotIndex = 0.obs;
    Constant.setupSize(context);
    double horSpace = FetchPixels.getDefaultHorSpaceFigma(context);

    return getScreenDetailDefaultView(context, "Special Offers", () {
      Constant.backToPrev(context);
    },
        Column(
          children: [
            getAssetImage(context, "offer_detail.png", double.infinity, 279.h,
                boxFit: BoxFit.fitHeight),
            Expanded(
                flex: 1,
                child: Container(
                  width: double.infinity,
                  margin: EdgeInsets.only(
                      left: horSpace, right: horSpace, bottom: 30.h),
                  height: double.infinity,
                  decoration: getButtonDecoration(getCardColor(context),
                      withCorners: true,
                      corner: 20.h,
                      shadow: [
                        const BoxShadow(
                            color: Color.fromRGBO(0, 0, 0, 0.07999999821186066),
                            offset: Offset(-4, 5),
                            blurRadius: 16)
                      ]),
                  child: ListView(
                    padding: EdgeInsets.symmetric(vertical: 20.h),
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            flex: 1,
                            child: getCustomFont(
                              "Male haircuts",
                              22,
                              getFontColor(context),
                              1,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          getCustomFont(
                            "\$100",
                            22,
                            getAccentColor(context),
                            1,
                            fontWeight: FontWeight.w700,
                          ),
                          7.w.horizontalSpace,
                          getCustomFont("\200", 14, redColor, 1,
                              fontWeight: FontWeight.w700,
                              decoration: TextDecoration.lineThrough),
                        ],
                      ).marginSymmetric(horizontal: horSpace),
                      10.h.verticalSpace,
                      buildTitle(context, "By Royalty barbershop"),
                      10.h.verticalSpace,
                      buildLocationRow(
                        context,
                        "8502 Preston Rd. Inglewood, Maine",
                        getFontGreyColor(context),
                      ).marginSymmetric(horizontal: horSpace),
                      16.h.verticalSpace,
                      ReadMoreText(
                        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
                        style: buildTextStyle(
                          context,
                          getFontHint(context),
                          FontWeight.w400,
                          14,
                          txtHeight: 1.5,
                        ),
                        trimLines: 3,
                        trimMode: TrimMode.Line,
                        textAlign: TextAlign.start,
                        trimCollapsedText: 'Show more',
                        lessStyle: buildTextStyle(
                            context, getFontColor(context), FontWeight.w400, 14,
                            txtHeight: 1.5),
                        moreStyle: buildTextStyle(
                            context, getFontColor(context), FontWeight.w400, 14,
                            txtHeight: 1.5),
                        trimExpandedText: ' Less',
                      ).marginSymmetric(horizontal: horSpace),
                      16.h.verticalSpace,
                      buildTitle(context, "Select Your Date"),
                      10.h.verticalSpace,
                      ObxValue(
                          (p0) => buildDatePickerButton(
                                  context,
                                  '${DateFormat('yyyy-MM-dd').format(date.value)}',
                                  "arrow_down.svg", () async {
                                DateTime? pickedDate = await showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime(1950),
                                  lastDate: DateTime(2050),
                                );

                                if (pickedDate != null) {
                                  date.value = pickedDate;
                                  print('date---${date.value}---${pickedDate}');
                                }
                              }),
                          date),
                      16.h.verticalSpace,
                      buildTitle(context, "Available slot"),
                      9.w.verticalSpace,
                      Wrap(
                        runSpacing: 9.w,
                        spacing: 9.w,
                        children:
                            List.generate(DataFile.slotTime.length, (index) {
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
                                        76.w),
                                  ),
                              selectedSlotIndex);
                        }),
                      ).marginSymmetric(horizontal: horSpace)
                    ],
                  ),
                )),
            getButtonFigma(
                context,
                getAccentColor(context),
                true,
                "Book Now",
                Colors.white,
                () {},
                EdgeInsets.only(left: horSpace, right: horSpace, bottom: 30.h))
          ],
        ),
        centerTitle: true);
  }

  Widget buildTitle(BuildContext context, String title) {
    return getCustomFont(
      title,
      16,
      getFontColor(context),
      1,
      fontWeight: FontWeight.w700,
    ).marginSymmetric(horizontal: FetchPixels.getDefaultHorSpaceFigma(context));
  }
}
