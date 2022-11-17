import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hairsalon/base/color_data.dart';
import 'package:hairsalon/base/constant.dart';
import 'package:hairsalon/base/fetch_pixels.dart';
import 'package:hairsalon/base/widget_utils.dart';

import '../../../base/get/route_key.dart';

class ActiveListWidget extends StatelessWidget {
  final List<String> myBooking = ["erty"];

  @override
  Widget build(BuildContext context) {
    return (myBooking.isEmpty)
        ? buildNoDataWidget(context)
        : ListView.builder(
            itemBuilder: (context, index) {
              return buildBookingHistoryItem(context, fromActive: true);
            },
            primary: true,
            padding: EdgeInsets.zero,
            itemCount: myBooking.length,
            shrinkWrap: true,
          );
  }

  Wrap buildNoDataWidget(BuildContext context) {
    return Wrap(
      alignment: WrapAlignment.center,
      crossAxisAlignment: WrapCrossAlignment.center,
      runAlignment: WrapAlignment.center,
      direction: Axis.vertical,
      children: [
        getAssetImage(context, "no_booking_img.png", 100.h, 132.h,
            boxFit: BoxFit.fitHeight),
        getCustomFont("No Bookings Yet!", 20, getFontColor(context), 1,
                fontWeight: FontWeight.w700, textAlign: TextAlign.center)
            .marginOnly(top: 30.h)
      ],
    );
  }

  Widget buildBookingHistoryItem(BuildContext context,
      {bool fromActive = false, bool isComplete = true}) {
    double horSpace = FetchPixels.getDefaultHorSpaceFigma(context);
    return InkWell(
      onTap: () {
        if(fromActive)
          {
            Constant.sendToNext(context, bookingDetailScreenRoute);
          }
      },
      child: Container(
        width: double.infinity,
        height: 162.h,
        margin: EdgeInsets.symmetric(horizontal: horSpace, vertical: 10.h),
        padding: EdgeInsets.only(left: 10.h, right: 10.h, top: 10.h),
        decoration: getButtonDecoration(getCardColor(context),
            withCorners: true,
            corner: 20.h,
            shadow: [
              const BoxShadow(
                  color: Color.fromRGBO(0, 0, 0, 0.07999999821186066),
                  offset: Offset(-4, 5),
                  blurRadius: 16)
            ]),
        child: Column(
          children: [
            Row(
              children: [
                getCircularImage(context, 108.h, 110.h, 20.h, "haircut.png",
                    boxFit: BoxFit.cover),
                12.w.horizontalSpace,
                Expanded(
                  flex: 1,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.end,
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
                          getSvgImageWithSize(context, "trash.svg", 23.h, 23.h,
                              fit: BoxFit.fill)
                        ],
                      ),
                      10.h.verticalSpace,
                      getCustomFont(
                        "22 June, 2022, 9:00 am",
                        14,
                        getFontColor(context),
                        1,
                        fontWeight: FontWeight.w400,
                      ),
                      10.h.verticalSpace,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          buildStarView(context, "4.9"),
                          getCustomFont(
                            "\$20.00",
                            16,
                            getAccentColor(context),
                            1,
                            fontWeight: FontWeight.w700,
                          )
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
            Expanded(
              flex: 1,
              child: Row(
                children: [
                  Icon(
                    Icons.circle,
                    size: 8.h,
                    color: getAccentColor(context),
                  ),
                  8.w.horizontalSpace,
                  Expanded(
                    flex: 1,
                    child: getCustomFont(
                        "Royalty barbershop", 14, "#8A6E6E".toColor(), 1,
                        fontWeight: FontWeight.w400,
                        fontFamily: Constant.fontsFamilyLato),
                  ),
                  (!fromActive)
                      ? Container(
                          width: 102.h,
                          height: 32.h,
                          decoration: getButtonDecoration(
                            (isComplete) ? lightAccentColor : lightRedColor,
                            withCorners: true,
                            corner: 16.h,
                          ),
                          child: Center(
                            child: getCustomFont(
                                (isComplete) ? "Completed" : "Cancelled",
                                16,
                                (isComplete)
                                    ? getAccentColor(context)
                                    : redColor,
                                1,
                                fontWeight: FontWeight.w600,
                                fontFamily: Constant.fontsFamilyLato),
                          ),
                        )
                      : 0.horizontalSpace
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CompleteListWidget extends StatelessWidget {
  final List<String> myBooking = ["erty", "ryy"];

  @override
  Widget build(BuildContext context) {
    return (myBooking.isEmpty)
        ? buildNoDataWidget(context)
        : ListView.builder(
            itemBuilder: (context, index) {
              return buildBookingHistoryItem(context, isComplete: true);
            },
            primary: true,
            padding: EdgeInsets.zero,
            itemCount: myBooking.length,
            shrinkWrap: true,
          );
  }

  Wrap buildNoDataWidget(BuildContext context) {
    return Wrap(
      alignment: WrapAlignment.center,
      crossAxisAlignment: WrapCrossAlignment.center,
      runAlignment: WrapAlignment.center,
      direction: Axis.vertical,
      children: [
        getAssetImage(context, "no_booking_img.png", 100.h, 132.h,
            boxFit: BoxFit.fitHeight),
        getCustomFont("No Bookings Yet!", 20, getFontColor(context), 1,
                fontWeight: FontWeight.w700, textAlign: TextAlign.center)
            .marginOnly(top: 30.h)
      ],
    );
  }

  Container buildBookingHistoryItem(BuildContext context,
      {bool fromActive = false, bool isComplete = true}) {
    double horSpace = FetchPixels.getDefaultHorSpaceFigma(context);
    return Container(
      width: double.infinity,
      height: 162.h,
      margin: EdgeInsets.symmetric(horizontal: horSpace, vertical: 10.h),
      padding: EdgeInsets.only(left: 10.h, right: 10.h, top: 10.h),
      decoration: getButtonDecoration(getCardColor(context),
          withCorners: true,
          corner: 20.h,
          shadow: [
            const BoxShadow(
                color: Color.fromRGBO(0, 0, 0, 0.07999999821186066),
                offset: Offset(-4, 5),
                blurRadius: 16)
          ]),
      child: Column(
        children: [
          Row(
            children: [
              getCircularImage(context, 108.h, 110.h, 20.h, "haircut.png",
                  boxFit: BoxFit.cover),
              12.w.horizontalSpace,
              Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
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
                        getSvgImageWithSize(context, "trash.svg", 23.h, 23.h,
                            fit: BoxFit.fill)
                      ],
                    ),
                    10.h.verticalSpace,
                    getCustomFont(
                      "22 June, 2022, 9:00 am",
                      14,
                      getFontColor(context),
                      1,
                      fontWeight: FontWeight.w400,
                    ),
                    10.h.verticalSpace,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        buildStarView(context, "4.9"),
                        getCustomFont(
                          "\$20.00",
                          16,
                          getAccentColor(context),
                          1,
                          fontWeight: FontWeight.w700,
                        )
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
          Expanded(
            flex: 1,
            child: Row(
              children: [
                Icon(
                  Icons.circle,
                  size: 8.h,
                  color: getAccentColor(context),
                ),
                8.w.horizontalSpace,
                Expanded(
                  flex: 1,
                  child: getCustomFont(
                      "Royalty barbershop", 14, "#8A6E6E".toColor(), 1,
                      fontWeight: FontWeight.w400,
                      fontFamily: Constant.fontsFamilyLato),
                ),
                (!fromActive)
                    ? Container(
                        width: 102.h,
                        height: 32.h,
                        decoration: getButtonDecoration(
                          (isComplete) ? lightAccentColor : lightRedColor,
                          withCorners: true,
                          corner: 16.h,
                        ),
                        child: Center(
                          child: getCustomFont(
                              (isComplete) ? "Completed" : "Cancelled",
                              16,
                              (isComplete) ? getAccentColor(context) : redColor,
                              1,
                              fontWeight: FontWeight.w600,
                              fontFamily: Constant.fontsFamilyLato),
                        ),
                      )
                    : 0.horizontalSpace
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class HistoryListWidget extends StatelessWidget {
  final List<String> myBooking = ["erty", "ryy", "ryy"];

  @override
  Widget build(BuildContext context) {
    return (myBooking.isEmpty)
        ? buildNoDataWidget(context)
        : ListView.builder(
            itemBuilder: (context, index) {
              return buildBookingHistoryItem(context, isComplete: index != 1);
            },
            primary: true,
            padding: EdgeInsets.zero,
            itemCount: myBooking.length,
            shrinkWrap: true,
          );
  }

  Wrap buildNoDataWidget(BuildContext context) {
    return Wrap(
      alignment: WrapAlignment.center,
      crossAxisAlignment: WrapCrossAlignment.center,
      runAlignment: WrapAlignment.center,
      direction: Axis.vertical,
      children: [
        getAssetImage(context, "no_booking_img.png", 100.h, 132.h,
            boxFit: BoxFit.fitHeight),
        getCustomFont("No Bookings Yet!", 20, getFontColor(context), 1,
                fontWeight: FontWeight.w700, textAlign: TextAlign.center)
            .marginOnly(top: 30.h)
      ],
    );
  }

  Container buildBookingHistoryItem(BuildContext context,
      {bool fromActive = false, bool isComplete = true}) {
    double horSpace = FetchPixels.getDefaultHorSpaceFigma(context);
    return Container(
      width: double.infinity,
      height: 162.h,
      margin: EdgeInsets.symmetric(horizontal: horSpace, vertical: 10.h),
      padding: EdgeInsets.only(left: 10.h, right: 10.h, top: 10.h),
      decoration: getButtonDecoration(getCardColor(context),
          withCorners: true,
          corner: 20.h,
          shadow: [
            const BoxShadow(
                color: Color.fromRGBO(0, 0, 0, 0.07999999821186066),
                offset: Offset(-4, 5),
                blurRadius: 16)
          ]),
      child: Column(
        children: [
          Row(
            children: [
              getCircularImage(context, 108.h, 110.h, 20.h, "haircut.png",
                  boxFit: BoxFit.cover),
              12.w.horizontalSpace,
              Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
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
                        getSvgImageWithSize(context, "trash.svg", 23.h, 23.h,
                            fit: BoxFit.fill)
                      ],
                    ),
                    10.h.verticalSpace,
                    getCustomFont(
                      "22 June, 2022, 9:00 am",
                      14,
                      getFontColor(context),
                      1,
                      fontWeight: FontWeight.w400,
                    ),
                    10.h.verticalSpace,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        buildStarView(context, "4.9"),
                        getCustomFont(
                          "\$20.00",
                          16,
                          getAccentColor(context),
                          1,
                          fontWeight: FontWeight.w700,
                        )
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
          Expanded(
            flex: 1,
            child: Row(
              children: [
                Icon(
                  Icons.circle,
                  size: 8.h,
                  color: getAccentColor(context),
                ),
                8.w.horizontalSpace,
                Expanded(
                  flex: 1,
                  child: getCustomFont(
                      "Royalty barbershop", 14, "#8A6E6E".toColor(), 1,
                      fontWeight: FontWeight.w400,
                      fontFamily: Constant.fontsFamilyLato),
                ),
                (!fromActive)
                    ? Container(
                        width: 102.h,
                        height: 32.h,
                        decoration: getButtonDecoration(
                          (isComplete) ? lightAccentColor : lightRedColor,
                          withCorners: true,
                          corner: 16.h,
                        ),
                        child: Center(
                          child: getCustomFont(
                              (isComplete) ? "Completed" : "Cancelled",
                              16,
                              (isComplete) ? getAccentColor(context) : redColor,
                              1,
                              fontWeight: FontWeight.w600,
                              fontFamily: Constant.fontsFamilyLato),
                        ),
                      )
                    : 0.horizontalSpace
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class TabBooked extends StatelessWidget {
  final List<String> tabList = ["Active", "Completed", "History"];

  final List<Widget> tabDetail = [
    ActiveListWidget(),
    CompleteListWidget(),
    HistoryListWidget()
  ];

  TabBooked({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    RxInt selectedTab = 0.obs;

    return getTabDetailDefaultView(
        context,
        "My Booking",
        () {},
        Column(
          children: [
            20.h.verticalSpace,
            buildTabView(tabList, context, selectedTab),
            ObxValue(
                (p0) => Expanded(
                      flex: 1,
                      child: tabDetail[selectedTab.value],
                    ),
                selectedTab)
          ],
        ),withLeading: false);
  }
}
