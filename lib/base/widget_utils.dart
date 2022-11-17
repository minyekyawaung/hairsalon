import 'dart:io';

import 'package:figma_squircle/figma_squircle.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:hairsalon/app/model/model_profile.dart';

import '../app/model/model_category.dart';
import '../app/model/model_services.dart';
import 'color_data.dart';
import 'constant.dart';
import 'fetch_pixels.dart';
import 'get/value_storage_controller.dart';

void showCustomToast(String texts, BuildContext context) {
  Fluttertoast.showToast(
      msg: texts,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.black,
      textColor: Colors.white,
      fontSize: 12.0.sp);
}

Widget buildProfileRowItem(
    BuildContext context, String title, Function function) {
  return InkWell(
    onTap: () {
      function();
    },
    child: Container(
      width: double.infinity,
      height: 64.h,
      decoration: getButtonDecoration(
        getGreyCardColor(context),
        withCorners: true,
        corner: 12.h,
      ),
      margin: EdgeInsets.symmetric(vertical: 6.h),
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Row(
        children: [
          Expanded(
            child: getCustomFont(title, 16, getFontColor(context), 1,
                fontWeight: FontWeight.w600, textAlign: TextAlign.start),
            flex: 1,
          ),
          getSvgImageWithSize(context, "arrow_right_profile.svg", 16.h, 16.h,
              color: getFontColor(context))
        ],
      ),
    ),
  );
}

Widget getCustomFont(String text, double fontSize, Color fontColor, int maxLine,
    {String fontFamily = Constant.fontsFamily,
    TextOverflow overflow = TextOverflow.ellipsis,
    TextDecoration decoration = TextDecoration.none,
    FontWeight fontWeight = FontWeight.normal,
    TextAlign textAlign = TextAlign.start,
    txtHeight,
    bool horFactor = false}) {
  return Text(
    text,
    overflow: overflow,
    style: TextStyle(
        decoration: decoration,
        fontSize: fontSize.sp,
        fontStyle: FontStyle.normal,
        color: fontColor,
        fontFamily: fontFamily,
        height: txtHeight,
        fontWeight: fontWeight),
    maxLines: maxLine,
    softWrap: true,
    textAlign: textAlign,
  );
}

Widget buildDatePickerButton(
    BuildContext context, String title, String image, Function function) {
  return InkWell(
    onTap: () {
      print('object');
      function();
    },
    child: Container(
      width: double.infinity,
      height: getButtonHeightFigma(),
      margin: EdgeInsets.symmetric(
          horizontal: FetchPixels.getDefaultHorSpaceFigma(context)),
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      decoration: getButtonDecoration(Colors.transparent,
          withCorners: true,
          corner: 20.h,
          withBorder: true,
          borderColor: indicatorColor),
      child: Row(children: [
        Expanded(
          flex: 1,
          child: getCustomFont(title, 16, getFontColor(context), 1,
              fontWeight: FontWeight.w500),
        ),
        getSvgImageWithSize(context, image, 18.h, 18.h,
            color: getFontColor(context), fit: BoxFit.fill)
      ]),
    ),
  );
}

Widget getCustomFontHor(BuildContext context, String text, double fontSize,
    Color fontColor, int maxLine,
    {String fontFamily = Constant.fontsFamily,
    TextOverflow overflow = TextOverflow.ellipsis,
    TextDecoration decoration = TextDecoration.none,
    FontWeight fontWeight = FontWeight.normal,
    TextAlign textAlign = TextAlign.start,
    txtHeight,
    bool horFactor = false}) {
  double width = context.width;
  double height = context.height;

  double textScaleFactor = (width > height)
      ? width / Constant.defScreenWidth
      : height / Constant.defScreenHeight;
  return Text(
    text,
    overflow: overflow,
    style: TextStyle(
        decoration: decoration,
        fontSize: fontSize.sp,
        fontStyle: FontStyle.normal,
        color: fontColor,
        fontFamily: fontFamily,
        height: txtHeight,
        fontWeight: fontWeight),
    maxLines: maxLine,
    softWrap: true,
    textAlign: textAlign,
    textScaleFactor: textScaleFactor,
  );
}

TextStyle buildTextStyle(BuildContext context, Color fontColor,
    FontWeight fontWeight, double fontSize,
    {double txtHeight = 1}) {
  return TextStyle(
      color: fontColor,
      fontWeight: fontWeight,
      fontFamily: Constant.fontsFamily,
      fontSize: fontSize.sp,
      height: txtHeight);
}

DecorationImage getDecorationAssetImage(BuildContext buildContext, String image,
    {BoxFit fit = BoxFit.contain}) {
  return DecorationImage(
    image: AssetImage(Constant.assetImagePath + image),
    fit: fit,
  );
}

Widget getCloseButton(BuildContext context, Function function) {
  return InkWell(
    onTap: () {
      function();
    },
    child: getSvgImageWithSize(context, "Close.svg", 24.h, 24.h),
  );
}

Widget getMultilineCustomFont(String text, double fontSize, Color fontColor,
    {String fontFamily = Constant.fontsFamily,
    TextOverflow overflow = TextOverflow.ellipsis,
    TextDecoration decoration = TextDecoration.none,
    FontWeight fontWeight = FontWeight.normal,
    TextAlign textAlign = TextAlign.start,
    txtHeight = 1.5}) {
  return Text(
    text,
    style: TextStyle(
        decoration: decoration,
        fontSize: fontSize.sp,
        fontStyle: FontStyle.normal,
        color: fontColor,
        fontFamily: Constant.fontsFamily,
        height: txtHeight,
        fontWeight: fontWeight),
    textAlign: textAlign,
  );
}

double getButtonHeightFigma() {
  return 56.h;
}

Widget getButtonContainer(
    BuildContext context, IconData iconData, Function function,
    {double size = 40, double iconSize = 24}) {
  return InkWell(
    onTap: () {
      function();
    },
    child: Container(
      width: size.h,
      decoration:
          BoxDecoration(color: "#FFF3F3".toColor(), shape: BoxShape.circle),
      height: size.h,
      child: Center(
        child: Icon(iconData, size: iconSize.h, color: getAccentColor(context)),
      ),
    ),
  );
}

Widget getEmptyWidget(BuildContext context, String image, String title,
    String description, String btnTxt, Function function,
    {bool withButton = true}) {
  double imgSize = 120.h;
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      getSvgImageWithSize(context, image, imgSize, imgSize),
      getVerSpace(30.h),
      getCustomFont(title, 22, getFontColor(context), 1,
          fontWeight: FontWeight.w700, textAlign: TextAlign.center),
      getVerSpace(10.h),
      getMultilineCustomFont(description, 16, getFontColor(context),
          fontWeight: FontWeight.w500, textAlign: TextAlign.center),
      (withButton)
          ? InkWell(
              onTap: () {
                function();
              },
              child: Container(
                  margin: EdgeInsets.only(top: 40.h),
                  width: 192.h,
                  height: 60.h,
                  decoration: getButtonDecoration(Colors.transparent,
                      withCorners: true,
                      withBorder: true,
                      borderColor: getAccentColor(context),
                      corner: 14.h),
                  child: Center(
                      child: getMultilineCustomFont(
                          btnTxt, 16, getAccentColor(context),
                          fontWeight: FontWeight.w600,
                          textAlign: TextAlign.center))))
          : getHorSpace(0)
    ],
  );
}

double getEditHeightFigma() {
  return 56.h;
}

double getEditFontSizeFigma() {
  return 16;
}

double getEditRadiusSize() {
  return 35.h;
}

double getEditRadiusSizeFigma() {
  return 12.h;
}

double getEditIconSize() {
  return 24;
}

double getButtonCorners() {
  return 35.h;
}

double getButtonCornersFigma() {
  return 20.h;
}

Widget getToolbarIcons(BuildContext context, String name, Function click,
    {bool withTheme = true, Color? color}) {
  return InkWell(
    child: getSvgImageWithSize(context, name, 24.h, 24.h,
        color: (color == null) ? getFontColor(context) : color),
    onTap: () {
      click();
    },
  );
}

double getButtonFontSizeFigma() {
  return 18;
}

ShapeDecoration getButtonDecoration(Color bgColor,
    {withBorder = false,
    Color borderColor = Colors.transparent,
    bool withCorners = true,
    double corner = 0,
    double cornerSmoothing = 1.1,
    List<BoxShadow> shadow = const []}) {
  return ShapeDecoration(
      color: bgColor,
      shadows: shadow,
      shape: SmoothRectangleBorder(
          side: BorderSide(
              width: 1, color: (withBorder) ? borderColor : Colors.transparent),
          borderRadius: SmoothBorderRadius(
              cornerRadius: (withCorners) ? corner : 0,
              cornerSmoothing: (withCorners) ? cornerSmoothing : 0)));
}

ShapeDecoration getButtonDecorationWithGradient(Color bgColor,
    {withBorder = false,
    Color borderColor = Colors.transparent,
    bool withCorners = true,
    double corner = 0,
    double cornerSmoothing = 1.1,
    List<BoxShadow> shadow = const []}) {
  return ShapeDecoration(
      shadows: shadow,
      gradient: getGradients(),
      shape: SmoothRectangleBorder(
          side: BorderSide(
              width: 1, color: (withBorder) ? borderColor : Colors.transparent),
          borderRadius: SmoothBorderRadius(
              cornerRadius: (withCorners) ? corner : 0,
              cornerSmoothing: (withCorners) ? cornerSmoothing : 0)));
}

getGradients() {
  return LinearGradient(colors: [
    "#FF8080".toColor(),
    "#F44144".toColor(),
  ], begin: Alignment.topCenter, end: Alignment.bottomCenter);
}

Widget getCenterTitleHeader(BuildContext context, String title,
    EdgeInsets edgeInsets, Function backClick,
    {bool visibleMore = false,
    String moreImg = "More.svg",
    Function? moreFunc}) {
  return getPaddingWidget(
      edgeInsets,
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          getBackIcon(context, () {
            backClick();
          }),
          Expanded(
            child: getCustomFont(title, 22, getFontColor(context), 1,
                textAlign: TextAlign.center, fontWeight: FontWeight.w600),
            flex: 1,
          ),
          Visibility(
            visible: visibleMore,
            maintainAnimation: true,
            maintainState: true,
            maintainSize: true,
            child: getBackIcon(context, () {
              moreFunc!();
            }, icon: moreImg),
          )
        ],
      ));
}

Widget buildProfilePhotoWidget(BuildContext context,
    {Function? function, String icons = "ic_edit.svg"}) {
  return Center(
    child: Container(
      width: 102.h,
      height: 100.h,
      child: Stack(
        children: [
          getCircleImage(context, "profile.png", double.infinity),
          Align(
            alignment: Alignment.bottomRight,
            child: InkWell(
              onTap: () {
                if (function != null) {
                  function();
                }
              },
              child: Container(
                width: 30.h,
                height: 30.h,
                decoration: BoxDecoration(shape: BoxShape.circle, boxShadow: [
                  BoxShadow(
                      color: Color.fromRGBO(61, 61, 61, 0.11999999731779099),
                      offset: Offset(-4, 8),
                      blurRadius: 25)
                ]),
                child: getSvgImageWithSize(
                    context, icons, double.infinity, double.infinity),
              ),
            ),
          )
        ],
      ),
    ),
  );
}

Widget getToolbarWidget(BuildContext context, String title, Function fun,
    {bool isShowBack = true}) {
  SmoothRadius smoothRadius =
      SmoothRadius(cornerRadius: 90.h, cornerSmoothing: 0);
  return Container(
    width: double.infinity,
    height: 132.h,
    padding: EdgeInsets.only(
        left: FetchPixels.getDefaultHorSpaceFigma(context),
        right: FetchPixels.getDefaultHorSpaceFigma(context),
        bottom: 30.h),
    decoration: ShapeDecoration(
        color: getAccentColor(context),
        shape: SmoothRectangleBorder(
            borderRadius: SmoothBorderRadius.only(bottomRight: smoothRadius))),
    child: Stack(
      children: [
        (isShowBack)
            ? Align(
                alignment: Alignment.bottomLeft,
                child: getBackIcon(context, () {
                  fun();
                }, colors: Colors.black),
              )
            : getHorSpace(0),
        Align(
          alignment: Alignment.bottomCenter,
          child: getCustomFont(title, 22, getFontColor(context), 1,
              fontWeight: FontWeight.w700),
        ),
      ],
    ),
  );
}

Widget getDetailWidget(BuildContext context, Function backClick, String title,
    Widget childWidget) {
  double topView = 291.h;
  double radius = topView / 2;
  SmoothRadius smoothRadius =
      SmoothRadius(cornerRadius: radius, cornerSmoothing: 0.6);

  return WillPopScope(
      child: Scaffold(
        backgroundColor: getCurrentTheme(context).scaffoldBackgroundColor,
        body: Container(
          width: double.infinity,
          height: double.infinity,
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: topView,
                decoration: ShapeDecoration(
                    color: getAccentColor(context),
                    shape: SmoothRectangleBorder(
                        borderRadius: SmoothBorderRadius.only(
                            bottomRight: smoothRadius))),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 109.h,
                      height: 109.h,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color:
                              getCurrentTheme(context).scaffoldBackgroundColor),
                      child: Center(
                        child: getSvgImageWithSize(
                            context, "Logo.svg", 53.h, 60.h,
                            fit: BoxFit.fill),
                      ),
                    ),
                    getVerSpace(20.h),
                    getCustomFont(title, 28, getFontColor(context), 1,
                        fontWeight: FontWeight.w700)
                  ],
                ),
              ),
              Expanded(
                child: childWidget,
                flex: 1,
              )
            ],
          ),
        ),
      ),
      onWillPop: () async {
        backClick();
        return false;
      });
}

Widget getCircleImage(BuildContext context, String imgName, double size,
    {bool fileImage = false}) {
  return SizedBox(
    width: size,
    height: size,
    child: ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(size / 2)),
      child: (fileImage)
          ? Image.file(File(imgName))
          : getAssetImage(context, imgName, double.infinity, double.infinity),
    ),
  );
}

Widget getSvgImage(BuildContext context, String image, double size,
    {Color? color, BoxFit boxFit = BoxFit.fill}) {
  return SvgPicture.asset(
    Constant.assetImagePath + image,
    color: color,
    width: size.w,
    height: size.h,
    fit: boxFit,
  );
}

Widget getTopViewHeader(BuildContext context, String titleMain, String titleSub,
    {bool visibleSub = true}) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      getVerSpace(80.h),
      getHeaderTitle(context, titleMain),
      (!visibleSub) ? getVerSpace(0) : getVerSpace(30.h),
      (!visibleSub) ? getVerSpace(0) : getSubHeaderTitle(context, titleSub),
      getVerSpace(60.h),
    ],
  );
}

Widget getHeaderTitle(BuildContext context, String str) {
  return getCustomFont(str, 55, getFontColor(context), 1,
      fontWeight: FontWeight.w900, textAlign: TextAlign.start);
}

Widget getHeaderTitleCustom(BuildContext context, String str) {
  return getCustomFont(str, 28, getFontColor(context), 1,
      fontWeight: FontWeight.w700,
      textAlign: TextAlign.start,
      horFactor: false);
}

Widget getSubHeaderTitle(BuildContext context, String title) {
  return getCustomFont(title, 40, getFontColor(context), 2,
      fontWeight: FontWeight.w400);
}

Widget getSvgImageWithSize(
    BuildContext context, String image, double width, double height,
    {Color? color, BoxFit fit = BoxFit.fill, bool listen = true}) {
  return SvgPicture.asset(
    Constant.assetImagePath + image,
    color: color,
    width: width,
    height: height,
    fit: fit,
  );
}

Widget getProfileTopView(
  BuildContext context,
  Function backClick,
  String title, {
  bool visibleMore = false,
  Function? moreFunc,
  bool visibleEdit = false,
  Function? funcEdit,
}) {
  double horSpace = FetchPixels.getDefaultHorSpaceFigma(context);
  return SizedBox(
    height: (223 + 9).h,
    child: Stack(
      children: [
        SizedBox(
          width: double.infinity,
          height: 201.h,
          child: getSvgImage(
            context,
            "profile_rect.svg",
            double.infinity,
          ),
        ),
        getCenterTitleHeader(
            context,
            title,
            EdgeInsets.only(
                left: horSpace,
                right: horSpace,
                top: Constant.getToolbarTopHeight(context) + 10.h), () {
          backClick();
        }, visibleMore: visibleMore, moreFunc: moreFunc),
        Padding(
          padding: EdgeInsets.only(left: horSpace),
          child: Align(
            alignment: Alignment.bottomLeft,
            child: SizedBox(
              width: 120.h,
              height: 120.h,
              child: Stack(
                children: [
                  getCircleImage(
                      context, "profile_Setting.png", double.infinity),
                  Visibility(
                    visible: visibleEdit,
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: InkWell(
                        onTap: () {
                          funcEdit!();
                        },
                        child: getSvgImageWithSize(
                            context, "edit_icon.svg", 36.h, 36.h),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        )
      ],
    ),
  );
}

Widget getBackIcon(BuildContext context, Function function,
    {String icon = "arrow_back.svg", Color? colors}) {
  return InkWell(
      onTap: () {
        function();
      },
      child: Icon(
        Icons.arrow_back_ios_new_rounded,
        size: 24.h,
        color: colors,
      ));
}

Widget getAssetImage(
    BuildContext context, String image, double width, double height,
    {Color? color, BoxFit boxFit = BoxFit.contain, bool listen = true}) {
  // return Image.asset(
  //   Constant.assetImagePath + image,
  //   color: color,
  //   width: width,
  //   height: height,
  //   fit: boxFit,
  // );

  return Image.network(
    'https://pos.crystalshine.net/uploads/img/1668616803_1668615832_salon1.png',
    // width: 280.0,
  );
  // return Image.network(
  //   image,
  //   color: color,
  //   width: width,
  //   height: height,
  //   fit: boxFit,
  // );
}

Widget getDialogDividerBottom(BuildContext context) {
  return Container(
    width: 134.w,
    decoration: getButtonDecoration(getFontColor(context),
        withCorners: true, withBorder: false, corner: 5.h),
    height: 5.h,
  );
}

Widget getDialogDividerTop(BuildContext context) {
  return Container(
    width: 48.w,
    decoration: getButtonDecoration(getCardColor(context),
        withCorners: true, withBorder: false, corner: 4.h),
    height: 4.h,
  );
}

Widget getTextFieldView(BuildContext context, Widget widget, bool minLines,
    EdgeInsetsGeometry margin) {
  double height = getEditHeightFigma();
  return Container(
    height: (minLines) ? (height * 2.2) : height,
    margin: margin,
    padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 0),
    alignment: (minLines) ? Alignment.topLeft : Alignment.centerLeft,
    decoration: ShapeDecoration(
      color: Colors.transparent,
      shape: SmoothRectangleBorder(
        side: BorderSide(
            color: getCurrentTheme(context).unselectedWidgetColor, width: 1),
        borderRadius: SmoothBorderRadius(
          cornerRadius: getEditRadiusSize(),
          cornerSmoothing: 0.8,
        ),
      ),
    ),
    child: widget,
  );
}

Widget getTextFieldViewCustom(BuildContext context, Widget widget,
    bool minLines, EdgeInsetsGeometry margin) {
  double height = getEditHeightFigma();
  return Container(
    height: (minLines) ? (height * 2.2) : height,
    margin: margin,
    padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 0),
    alignment: (minLines) ? Alignment.topLeft : Alignment.centerLeft,
    decoration: ShapeDecoration(
      color: Colors.transparent,
      shape: SmoothRectangleBorder(
        side: BorderSide(
            color: getCurrentTheme(context).unselectedWidgetColor, width: 1),
        borderRadius: SmoothBorderRadius(
          cornerRadius: getEditRadiusSizeFigma(),
          cornerSmoothing: 0.8,
        ),
      ),
    ),
    child: widget,
  );
}

Widget getScreenDetailDefaultView(
    BuildContext context, String title, Function backClick, Widget childView,
    {bool centerTitle = true,
    bool subtitle = false,
    String subtitleText = '',
    String actionImg = '',
    bool withLeading = true}) {
  return WillPopScope(
      child: Scaffold(
        backgroundColor: getAccentColor(context),
        appBar: getBackAppBar(context, () {
          backClick();
        },
            subtitle: subtitle,
            withLeading: withLeading,
            subtitleText: subtitleText,
            title: title,
            actionImg: actionImg,
            iconColor: Colors.white,
            centerTitle: centerTitle),
        body: getDefaultContainerView(context, childView),
      ),
      onWillPop: () async {
        backClick();
        return false;
      });
}

Widget getTabDetailDefaultView(
    BuildContext context, String title, Function backClick, Widget childView,
    {bool centerTitle = true, bool withLeading = true}) {
  return Column(
    children: [
      getBackAppBar(context, () {
        backClick();
      },
          title: title,
          iconColor: Colors.white,
          centerTitle: centerTitle,
          withLeading: withLeading),
      Expanded(
        flex: 1,
        child: getDefaultContainerView(
            context, childView.paddingOnly(bottom: 104.h)),
      )
    ],
  );
}

Widget itemSlotBooking(int index, BuildContext context, bool isSelected,
    String title, double width) {
  return Container(
    width: width,
    height: 33.w,
    decoration: getButtonDecoration(
        (isSelected) ? lightAccentColor : Colors.transparent,
        withBorder: true,
        borderColor: (isSelected) ? getAccentColor(context) : indicatorColor,
        withCorners: true,
        corner: 16.w),
    child: Center(
        child: getCustomFont(title, 14,
            (isSelected) ? getAccentColor(context) : getFontHint(context), 1,
            fontWeight: (isSelected) ? FontWeight.w700 : FontWeight.w400)),
  );
}

Widget buildProfileItem(BuildContext context, int index, Function function,
    ModelProfile modelProfile, bool isLast) {
  double horSpace = FetchPixels.getDefaultHorSpaceFigma(context);

  return InkWell(
    onTap: () {
      function();
    },
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        getCircleImage(context, modelProfile.image, 64.h),
        getCustomFont(modelProfile.name, 16, getFontColor(context), 1,
            fontWeight: FontWeight.w400)
      ],
    ).marginOnly(
        left: (index == 0) ? horSpace : horSpace / 2,
        right: (isLast) ? horSpace : (horSpace / 2)),
  );
}

Widget buildItemCategoryDetail(
    BuildContext context, ModelCategory category, Function function) {
  return InkWell(
    onTap: () {
      function();
    },
    child: Container(
      padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
      width: double.infinity,
      height: 90.h,
      decoration: getButtonDecoration(getCardColor(context),
          withCorners: true,
          corner: 20.h,
          shadow: [
            const BoxShadow(
                color: Color.fromRGBO(0, 0, 0, 0.07999999821186066),
                offset: Offset(-4, 5),
                blurRadius: 16)
          ]),
      margin: EdgeInsets.symmetric(
          horizontal: FetchPixels.getDefaultHorSpaceFigma(context),
          vertical: 10.h),
      child: Row(
        children: [
          getCircularImage(
              context, 70.h, double.infinity, 20.h, category.image),
          12.w.horizontalSpace,
          Expanded(
            flex: 1,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  getCustomFont(category.title, 20, getFontColor(context), 1,
                      fontWeight: FontWeight.w700, txtHeight: 1.5),
                  6.h.verticalSpace,
                  getCustomFont(
                      "Over 10 Salon", 14, getFontGreyColor(context), 1,
                      fontWeight: FontWeight.w700, txtHeight: 1.5)
                ]),
          )
        ],
      ),
    ),
  );
}

Widget buildItemNearestSalonDetail(BuildContext context, Function function,
    {String img = ''}) {
  return InkWell(
    onTap: () {
      function();
    },
    child: Container(
      padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
      width: double.infinity,
      height: 161.h,
      decoration: getButtonDecoration(getCardColor(context),
          withCorners: true,
          corner: 20.h,
          shadow: [
            const BoxShadow(
                color: Color.fromRGBO(0, 0, 0, 0.07999999821186066),
                offset: Offset(-4, 5),
                blurRadius: 16)
          ]),
      margin: EdgeInsets.symmetric(
          horizontal: FetchPixels.getDefaultHorSpaceFigma(context),
          vertical: 10.h),
      child: Row(
        children: [
          SizedBox(
            width: 165.h,
            height: double.infinity,
            child: Stack(
              children: [
                getCircularImage(
                    context, double.infinity, double.infinity, 20.h, img,
                    boxFit: BoxFit.cover),
                Align(
                  alignment: Alignment.topLeft,
                  child: buildFavouriteBtn(EdgeInsets.all(10.h)),
                )
              ],
            ),
          ),
          12.w.horizontalSpace,
          Expanded(
            flex: 1,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                getCustomFont(
                    "Octopas barbershop", 16, getFontColor(context), 1,
                    fontWeight: FontWeight.w700),
                10.h.verticalSpace,
                buildLocationRow(context, "4140 Parker Rd.  New Mexico 31134",
                    getFontGreyColor(context)),
                10.h.verticalSpace,
                Row(
                  children: [
                    buildStarView(context, "4.9"),
                    10.w.horizontalSpace,
                    buildDistanceView(context, "50 m"),
                  ],
                ),
                10.h.verticalSpace,
                Align(
                  alignment: Alignment.bottomRight,
                  child: buildButtonBookNow(context, () {}),
                )
              ],
            ),
          )
        ],
      ),
    ),
  );
}

Row buildLocationRow(BuildContext context, String location, Color locationColor,
    {FontWeight weight = FontWeight.w400,
    int maxLine = 1,
    double fontSize = 14}) {
  return Row(
    children: [
      getSvgImageWithSize(context, "location.svg", 20.h, 20.h,
          fit: BoxFit.fill, color: getFontGreyColor(context)),
      6.w.horizontalSpace,
      Expanded(
        flex: 1,
        child: getCustomFont(location, fontSize, locationColor, maxLine,
            fontWeight: weight),
      ),
    ],
  );
}

Widget getDefaultContainerView(BuildContext context, Widget childView,
    {EdgeInsets padding = EdgeInsets.zero}) {
  return Container(
    width: double.infinity,
    height: double.infinity,
    padding: padding,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.vertical(top: Radius.circular(22.h)),
        color: getCurrentTheme(context).scaffoldBackgroundColor),
    child: childView,
  );
}

showGetDialog(
  BuildContext context,
  String img,
  String title,
  String description,
  String btnText,
  Function function, {
  double dialogHeight = 381,
  double imgWidth = 150,
  double imgHeight = 96,
  BoxFit fit = BoxFit.fill,
  bool withCancelBtn = false,
  bool withVerticalBtn = false,
  String btnTextCancel = "Cancel",
  Function? functionCancel,
  String? btnTextVertical,
  Function? functionVerticalBtn,
}) {
  Get.dialog(AlertDialog(
    contentPadding: EdgeInsets.zero,
    backgroundColor: getCardColor(context),
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(22.h))),
    content: Container(
      width: 374.h,
      height: dialogHeight.h,
      child: Column(
        children: [
          getAssetImage(context, img, imgWidth.h, imgHeight.h, boxFit: fit),
          Expanded(
            flex: 1,
            child: 0.verticalSpace,
          ),
          getCustomFont(title, 22, getFontColor(context), 1,
              textAlign: TextAlign.center, fontWeight: FontWeight.w700),
          20.h.verticalSpace,
          getMultilineCustomFont(description, 16, getFontColor(context),
              textAlign: TextAlign.center, fontWeight: FontWeight.w500),
          Expanded(
            flex: 1,
            child: 0.verticalSpace,
          ),
          Row(
            children: [
              Expanded(
                  child: getButtonFigma(context, getAccentColor(context), true,
                      btnText, Colors.white, () {
                function();
              }, EdgeInsets.zero)),
              (withCancelBtn) ? 20.w.horizontalSpace : 0.horizontalSpace,
              (withCancelBtn)
                  ? Expanded(
                      child: getButtonFigma(context, Colors.transparent, true,
                          btnTextCancel, getAccentColor(context), () {
                      if (functionCancel != null) {
                        functionCancel();
                      }
                    }, EdgeInsets.zero,
                          isBorder: true, borderColor: getAccentColor(context)))
                  : 0.horizontalSpace,
            ],
          ),
          20.h.verticalSpace,
          (withVerticalBtn) ? 20.w.horizontalSpace : 0.horizontalSpace,
          (withVerticalBtn)
              ? Expanded(
                  child: getButtonFigma(context, Colors.white, true,
                      '${btnTextVertical}', getAccentColor(context), () {
                    functionVerticalBtn!();
                  }, EdgeInsets.zero,
                      isBorder: true, borderColor: getAccentColor(context)),
                )
              : 0.horizontalSpace
        ],
      ).paddingSymmetric(
          vertical: 36.h,
          horizontal: FetchPixels.getDefaultHorSpaceFigma(context)),
    ),
  ));
}

Widget buildTitles(BuildContext context, String title,
    {bool withPadding = true}) {
  return getCustomFont(title, 18, getFontColor(context), 1,
          fontWeight: FontWeight.w700)
      .marginSymmetric(
          horizontal:
              (withPadding) ? FetchPixels.getDefaultHorSpaceFigma(context) : 0);
}

Widget buildTabView(
    List<String> tabList, BuildContext context, RxInt selectedIndex) {
  return Container(
    width: double.infinity,
    height: 56.h,
    margin: EdgeInsets.symmetric(
        horizontal: FetchPixels.getDefaultHorSpaceFigma(context),
        vertical: 16.h),
    decoration: getButtonDecoration(Colors.white,
        withCorners: true,
        corner: 15.h,
        shadow: [
          const BoxShadow(
              color: Color.fromRGBO(130, 164, 131, 0.2199999988079071),
              offset: Offset(0, 7),
              blurRadius: 33)
        ]),
    padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
    child: Row(
        children: List.generate(tabList.length, (index) {
      return ObxValue((p0) {
        bool isSelected = selectedIndex.value == index;
        return Expanded(
          flex: 1,
          child: InkWell(
            onTap: () {
              selectedIndex.value = index;
            },
            child: Container(
              width: double.infinity,
              height: double.infinity,
              decoration: getButtonDecoration(
                  (isSelected) ? lightAccentColor : Colors.transparent,
                  withCorners: true,
                  corner: 15.h),
              child: Center(
                child: getCustomFont(
                  tabList[index],
                  16,
                  (isSelected) ? getAccentColor(context) : getFontHint(context),
                  1,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
        );
      }, selectedIndex);
    })),
  );
}

Widget buildSelectedServiceItem(double horSpace, BuildContext context,
    ModelServices? services, ValueStorageController storeController,
    {bool withValueChangerView = true}) {
  return Container(
    width: double.infinity,
    height: 146.w,
    padding: EdgeInsets.all(10.w),
    margin: EdgeInsets.symmetric(horizontal: horSpace, vertical: 10.h),
    decoration: getButtonDecoration(getCardColor(context),
        withCorners: true,
        corner: 20.h,
        shadow: [
          const BoxShadow(
              color: Color.fromRGBO(165, 82, 115, 0.07000000029802322),
              offset: Offset(0, 7),
              blurRadius: 15)
        ]),
    child: Row(
      children: [
        getCircularImage(context, 178.w, double.infinity, 20.h, services!.img,
            boxFit: BoxFit.cover),
        12.w.horizontalSpace,
        Expanded(
          flex: 1,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              getCustomFont(services.name, 20, getFontColor(context), 1,
                  fontWeight: FontWeight.w700),
              Expanded(
                flex: 1,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: getMultilineCustomFont(
                      services.desc, 18, getFontGreyColor(context),
                      fontWeight: FontWeight.w500, txtHeight: 1.5),
                ),
              ),
              (withValueChangerView)
                  ? ObxValue(
                      (p0) => Row(
                            children: [
                              Expanded(
                                flex: 1,
                                child: getCustomFont("\$${services.price}", 20,
                                    getFontColor(context), 1,
                                    fontWeight: FontWeight.w700),
                              ),
                              InkWell(
                                onTap: () {
                                  storeController
                                      .selectedServiceQuantity.value++;
                                },
                                child: getSvgImageWithSize(
                                    context, "add_img.svg", 26.h, 26.h,
                                    fit: BoxFit.fill),
                              ),
                              getCustomFont(p0.toString(), 16,
                                      getFontColor(context), 1,
                                      fontWeight: FontWeight.w400)
                                  .marginSymmetric(horizontal: 9.w),
                              InkWell(
                                onTap: () {
                                  if (storeController
                                          .selectedServiceQuantity.value >
                                      1) {
                                    storeController
                                        .selectedServiceQuantity.value--;
                                  }
                                },
                                child: getSvgImageWithSize(
                                    context, "remove_img.svg", 26.h, 26.h,
                                    fit: BoxFit.fill),
                              ),
                            ],
                          ),
                      storeController.selectedServiceQuantity)
                  : 0.verticalSpace,
            ],
          ),
        ),
      ],
    ),
  );
}

Widget getDefaultUnderlineTextFiled(
    BuildContext context,
    String s,
    TextEditingController textEditingController,
    Color fontColor,
    ValueChanged<String> changed,
    {bool withPrefix = false,
    String imgName = "",
    bool minLines = false,
    bool isFilled = false,
    bool withFilter = false,
    bool readOnly = false,
    Function? filterClick,
    Function? editTap,
    EdgeInsetsGeometry margin = EdgeInsets.zero,
    bool withPadding = true}) {
  double height = getEditHeightFigma();
  return SizedBox(
    height: height,
    width: double.infinity,
    child: TextField(
      onTap: () {
        if (editTap != null) {
          editTap();
        }
      },
      maxLines: (minLines) ? null : 1,
      controller: textEditingController,
      autofocus: false,
      textAlign: TextAlign.start,
      // expands: minLines,
      style: TextStyle(
          fontFamily: Constant.fontsFamily,
          color: getFontColor(context),
          fontWeight: FontWeight.w400,
          fontSize: getEditFontSizeFigma().sp),
      onChanged: changed,
      readOnly: readOnly,
      decoration: InputDecoration(
          prefixIcon: (withPrefix)
              ? getSvgImageWithSize(context, imgName, getEditIconSize().h,
                      getEditIconSize().h)
                  .marginOnly(left: 20.w, right: 16.w)
              : 0.horizontalSpace,
          prefixIconConstraints: BoxConstraints(
            minWidth: 20.w,
            minHeight: 0,
            maxWidth: getEditIconSize().h + (20.w + 16.w),
            maxHeight: getEditIconSize().h,
          ),
          suffixIconConstraints: BoxConstraints(
            minWidth: 20.w,
            minHeight: 0,
            maxWidth: getEditIconSize().h + (20.w + 16.w),
            maxHeight: getEditIconSize().h,
          ),
          contentPadding: EdgeInsets.zero,
          filled: isFilled,
          fillColor: getCardColor(context),
          suffixIcon: (withFilter)
              ? InkWell(
                  onTap: () {
                    if (filterClick != null) {
                      filterClick();
                    }
                  },
                  child: getSvgImageWithSize(context, "filter.svg",
                          getEditIconSize().h, getEditIconSize().h)
                      .marginOnly(right: 20.w, left: 16.w),
                )
              : 0.horizontalSpace,
          enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                  color: (isFilled) ? Colors.transparent : getFontHint(context),
                  width: 2.h),
              borderRadius: BorderRadius.all(Radius.circular(20.h))),
          disabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                  color: (isFilled) ? Colors.transparent : getFontHint(context),
                  width: 2.h),
              borderRadius: BorderRadius.all(Radius.circular(20.h))),
          errorBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                  color: (isFilled) ? Colors.transparent : getFontHint(context),
                  width: 2.h),
              borderRadius: BorderRadius.all(Radius.circular(20.h))),
          border: UnderlineInputBorder(
              borderSide: BorderSide(
                  color: (isFilled) ? Colors.transparent : getFontHint(context),
                  width: 2.h),
              borderRadius: BorderRadius.all(Radius.circular(20.h))),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(
                color:
                    (isFilled) ? Colors.transparent : getAccentColor(context),
                width: 2.h),
          ),
          labelText: s,
          labelStyle: TextStyle(
              fontFamily: Constant.fontsFamily,
              color: getFontHint(context),
              fontWeight: FontWeight.w400,
              fontSize: 16.sp)),
    ).marginSymmetric(
        horizontal:
            (withPadding) ? FetchPixels.getDefaultHorSpaceFigma(context) : 0),
  );
}

Widget getDefaultTextFiled(
    BuildContext context,
    String s,
    TextEditingController textEditingController,
    Color fontColor,
    ValueChanged<String> changed,
    {bool withPrefix = false,
    String imgName = "",
    bool minLines = false,
    bool isFilled = false,
    bool withFilter = false,
    bool readOnly = false,
    Function? filterClick,
    Function? editTap,
    EdgeInsetsGeometry margin = EdgeInsets.zero,
    bool withPadding = true}) {
  double height = getEditHeightFigma();

  return SizedBox(
    height: height,
    width: double.infinity,
    child: TextField(
      onTap: () {
        if (editTap != null) {
          editTap();
        }
      },
      maxLines: (minLines) ? null : 1,
      controller: textEditingController,
      autofocus: false,
      textAlign: TextAlign.start,
      style: TextStyle(
          fontFamily: Constant.fontsFamily,
          color: fontColor,
          fontWeight: FontWeight.w400,
          fontSize: getEditFontSizeFigma().sp),
      onChanged: changed,
      readOnly: readOnly,
      decoration: InputDecoration(
          prefixIcon: (withPrefix)
              ? getSvgImageWithSize(context, imgName, getEditIconSize().h,
                      getEditIconSize().h)
                  .marginOnly(left: 20.w, right: 16.w)
              : 0.horizontalSpace,
          prefixIconConstraints: BoxConstraints(
            minWidth: 20.w,
            minHeight: 0,
            maxWidth: getEditIconSize().h + (20.w + 16.w),
            maxHeight: getEditIconSize().h,
          ),
          suffixIconConstraints: BoxConstraints(
            minWidth: 20.w,
            minHeight: 0,
            maxWidth: getEditIconSize().h + (20.w + 16.w),
            maxHeight: getEditIconSize().h,
          ),
          contentPadding: EdgeInsets.zero,
          filled: isFilled,
          fillColor: getCardColor(context),
          suffixIcon: (withFilter)
              ? InkWell(
                  onTap: () {
                    if (filterClick != null) {
                      filterClick();
                    }
                  },
                  child: getSvgImageWithSize(context, "filter.svg",
                          getEditIconSize().h, getEditIconSize().h)
                      .marginOnly(right: 20.w, left: 16.w),
                )
              : 0.horizontalSpace,
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: (isFilled) ? Colors.transparent : getFontHint(context),
                  width: 1.h),
              borderRadius: BorderRadius.all(Radius.circular(20.h))),
          disabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: (isFilled) ? Colors.transparent : getFontHint(context),
                  width: 1.h),
              borderRadius: BorderRadius.all(Radius.circular(20.h))),
          errorBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: (isFilled) ? Colors.transparent : getFontHint(context),
                  width: 1.h),
              borderRadius: BorderRadius.all(Radius.circular(20.h))),
          border: OutlineInputBorder(
              borderSide: BorderSide(
                  color: (isFilled) ? Colors.transparent : getFontHint(context),
                  width: 1.h),
              borderRadius: BorderRadius.all(Radius.circular(20.h))),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color:
                      (isFilled) ? Colors.transparent : getAccentColor(context),
                  width: 1.h),
              borderRadius: BorderRadius.all(Radius.circular(20.h))),
          hintText: s,
          hintStyle: TextStyle(
              fontFamily: Constant.fontsFamily,
              color: getFontHint(context),
              fontWeight: FontWeight.w400,
              fontSize: getEditFontSizeFigma().sp)),
    ).marginSymmetric(
        horizontal:
            (withPadding) ? FetchPixels.getDefaultHorSpaceFigma(context) : 0),
  );
}

Widget getDefaultTextFiledWithCustomPrefix(BuildContext context, String s,
    TextEditingController textEditingController, Color fontColor, Widget widget,
    {bool withPrefix = false,
    String imgName = "",
    bool minLines = false,
    EdgeInsetsGeometry margin = EdgeInsets.zero}) {
  double height = getEditHeightFigma();

  return SizedBox(
    height: height,
    width: double.infinity,
    child: TextField(
      onEditingComplete: () {},
      onChanged: (value) {},
      onSubmitted: (value) {
        return;
      },
      maxLines: (minLines) ? null : 1,
      controller: textEditingController,
      autofocus: false,
      textAlign: TextAlign.start,
      style: TextStyle(
          fontFamily: Constant.fontsFamily,
          color: fontColor,
          fontWeight: FontWeight.w400,
          fontSize: getEditFontSizeFigma().sp),
      decoration: InputDecoration(
          prefixIcon: widget,
          prefixIconConstraints:
              BoxConstraints(minWidth: 100.h, maxWidth: 100.h + 20.w),
          contentPadding: EdgeInsets.symmetric(horizontal: 20.w),
          border: OutlineInputBorder(
              borderSide: BorderSide(
                  color: getCurrentTheme(context).focusColor, width: 1.h),
              borderRadius: BorderRadius.all(Radius.circular(20.h))),
          focusedBorder: OutlineInputBorder(
              borderSide:
                  BorderSide(color: getAccentColor(context), width: 1.h),
              borderRadius: BorderRadius.all(Radius.circular(20.h))),
          hintText: s,
          hintStyle: TextStyle(
              fontFamily: Constant.fontsFamily,
              color: getFontHint(context),
              fontWeight: FontWeight.w400,
              fontSize: getEditFontSizeFigma().sp)),
    ).marginSymmetric(horizontal: FetchPixels.getDefaultHorSpaceFigma(context)),
  );
}

getProgressDialog() {
  return Container(
      color: Colors.transparent,
      child: Center(
          child: Theme(
              data: ThemeData(
                  cupertinoOverrideTheme:
                      const CupertinoThemeData(brightness: Brightness.dark)),
              child: const CupertinoActivityIndicator())));
}

Widget getDivider(
    {double dividerHeight = 1,
    Color setColor = Colors.grey,
    double endIndent = 20,
    double indent = 20}) {
  return Divider(
    height: dividerHeight.h,
    color: setColor,
    endIndent: endIndent.w,
    indent: indent.w,
  );
}

Widget getPassTextFiled(
    BuildContext context,
    String s,
    TextEditingController textEditingController,
    Color fontColor,
    bool showPass,
    Function function,
    {String imgName = "pass.svg",
    bool minLines = false,
    EdgeInsetsGeometry margin = EdgeInsets.zero}) {
  double height = getEditHeightFigma();

  return SizedBox(
    height: height,
    width: double.infinity,
    child: TextField(
      maxLines: (minLines) ? null : 1,
      controller: textEditingController,
      autofocus: false,
      obscureText: (showPass) ? false : true,
      textAlign: TextAlign.start,
      style: TextStyle(
          fontFamily: Constant.fontsFamily,
          color: fontColor,
          fontWeight: FontWeight.w400,
          fontSize: getEditFontSizeFigma().sp),
      decoration: InputDecoration(
          suffixIconConstraints: BoxConstraints(
              minWidth: getEditIconSize().h + 20.w,
              minHeight: 0,
              maxWidth: getEditIconSize().h + 20.w,
              maxHeight: getEditIconSize().h),
          suffixIcon: InkWell(
            onTap: () {
              function();
            },
            child: getSvgImageWithSize(
                context, "pass.svg", getEditIconSize().h, getEditIconSize().h,
                fit: BoxFit.scaleDown),
          ),
          contentPadding: EdgeInsets.only(left: 20.w),
          border: OutlineInputBorder(
              borderSide: BorderSide(color: getFontHint(context), width: 1.h),
              borderRadius: BorderRadius.all(Radius.circular(20.h))),
          focusedBorder: OutlineInputBorder(
              borderSide:
                  BorderSide(color: getAccentColor(context), width: 1.h),
              borderRadius: BorderRadius.all(Radius.circular(20.h))),
          hintText: s,
          hintStyle: TextStyle(
              fontFamily: Constant.fontsFamily,
              color: getFontHint(context),
              fontWeight: FontWeight.w400,
              fontSize: getEditFontSizeFigma().sp)),
    ).marginSymmetric(horizontal: FetchPixels.getDefaultHorSpaceFigma(context)),
  );
}

Widget getPaddingWidget(EdgeInsets edgeInsets, Widget widget) {
  return Padding(
    padding: edgeInsets,
    child: widget,
  );
}

AppBar getInVisibleAppBar({Color color = Colors.transparent}) {
  return AppBar(
    toolbarHeight: 0,
    elevation: 0,
    backgroundColor: color,
  );
}

double getToolbarTopViewHeight(BuildContext context) {
  return context.mediaQueryPadding.top;
}

WillPopScope buildTitleDefaultWidget(BuildContext context, String title,
    String subTitle, Function backClick, Widget widget) {
  return WillPopScope(
      child: Scaffold(
        appBar: getBackAppBar(context, () {
          backClick();
        }, color: Colors.transparent),
        backgroundColor: getCurrentTheme(context).scaffoldBackgroundColor,
        body: Container(
          width: double.infinity,
          height: double.infinity,
          child: ListView(
            children: [
              10.h.verticalSpace,
              getCustomFont(title, 24, getFontColor(context), 1,
                  fontWeight: FontWeight.w700, textAlign: TextAlign.center),
              subTitle.isNotEmpty ? (16.h.verticalSpace) : 0.verticalSpace,
              subTitle.isNotEmpty
                  ? (getMultilineCustomFont(subTitle, 16, getFontColor(context),
                      fontWeight: FontWeight.w400, textAlign: TextAlign.center))
                  : 0.verticalSpace,
              20.h.verticalSpace,
              widget
            ],
          ),
        ),
      ),
      onWillPop: () async {
        backClick();
        return false;
      });
}

AppBar getBackAppBar(BuildContext context, Function backClick,
    {Color color = Colors.transparent,
    String title = "",
    String subtitleText = "",
    Color fontColor = Colors.white,
    bool subtitle = false,
    String actionImg = '',
    Color iconColor = Colors.black,
    bool centerTitle = true,
    bool withLeading = true}) {
  return (subtitle)
      ? AppBar(
          elevation: 0,
          backgroundColor: color,
          titleSpacing: 16.w,
          centerTitle: centerTitle,
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              getCustomFont(title, 24, fontColor, 1,
                  fontWeight: FontWeight.w700),
              2.h.verticalSpace,
              getCustomFont(subtitleText, 16, fontColor, 1,
                  fontWeight: FontWeight.w500),
            ],
          ),
          actions: [
            Padding(
              padding: EdgeInsets.all(10.h),
              child: getCircleImage(context, actionImg, 50.h),
            )
          ],
          leading: (withLeading)
              ? getBackIcon(context, () {
                  backClick();
                }, colors: iconColor)
              : 0.horizontalSpace,
        )
      : AppBar(
          elevation: 0,
          backgroundColor: color,
          centerTitle: centerTitle,
          title: getCustomFont(title, 24, fontColor, 1,
              fontWeight: FontWeight.w700),
          leading: (withLeading)
              ? getBackIcon(context, () {
                  backClick();
                }, colors: iconColor)
              : 0.horizontalSpace,
        );
}

Widget getRowWidget(
    BuildContext context, String title, String icon, Function function) {
  double iconSize = 24.h;
  // double iconSize = FetchPixels.getPixelHeight(24);
  return InkWell(
    onTap: () {
      function();
    },
    child: Container(
      height: 60.h,
      // height: FetchPixels.getPixelHeight(60),
      width: double.infinity,
      margin: EdgeInsets.symmetric(
          horizontal: FetchPixels.getDefaultHorSpaceFigma(context),
          vertical: 10.h),
      padding: EdgeInsets.symmetric(horizontal: 21.w),
      decoration: getButtonDecoration(Colors.white,
          withCorners: true,
          corner: getButtonCornersFigma(),
          shadow: [
            const BoxShadow(
                color: Color.fromRGBO(155, 103, 103, 0.10999999940395355),
                offset: Offset(-5, 6),
                blurRadius: 28)
          ]),
      child: Row(
        children: [
          getSvgImageWithSize(
            context,
            icon,
            iconSize,
            iconSize,
          ),
          getHorSpace(17.w),
          Expanded(
            child: getCustomFont(title, 16, getFontColor(context), 1,
                fontWeight: FontWeight.w500),
            flex: 1,
          ),
          getSvgImageWithSize(
            context,
            "arrow_right.svg",
            iconSize,
            iconSize,
          ),
        ],
      ),
    ),
  );
}

Widget getButtonFigma(
    BuildContext context,
    Color bgColor,
    bool withCorners,
    String text,
    Color textColor,
    Function function,
    EdgeInsetsGeometry insetsGeometry,
    {isBorder = false,
    borderColor = Colors.transparent,
    FontWeight weight = FontWeight.w600,
    bool isIcon = false,
    String? icons,
    List<BoxShadow> shadow = const [],
    bool withGradient = false}) {
  double buttonHeight = getButtonHeightFigma();
  double fontSize = getButtonFontSizeFigma();
  return InkWell(
    onTap: () {
      function();
    },
    child: Container(
      margin: insetsGeometry,
      width: double.infinity,
      height: buttonHeight,
      decoration: (withGradient)
          ? getButtonDecorationWithGradient(bgColor,
              withCorners: withCorners,
              corner: (withCorners) ? getButtonCornersFigma() : 0,
              withBorder: isBorder,
              borderColor: borderColor,
              shadow: shadow)
          : getButtonDecoration(bgColor,
              withCorners: withCorners,
              corner: (withCorners) ? getButtonCornersFigma() : 0,
              withBorder: isBorder,
              borderColor: borderColor,
              shadow: shadow),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          (isIcon)
              ? getSvgImageWithSize(context, icons ?? "", getEditIconSize().h,
                  getEditIconSize().h)
              : getHorSpace(0),
          (isIcon) ? getHorSpace(10.w) : getHorSpace(0),
          getCustomFont(
            text,
            fontSize,
            textColor,
            1,
            textAlign: TextAlign.center,
            fontWeight: weight,
          )
        ],
      ),
    ),
  );
}

Widget getButtonWithEndIcon(
    BuildContext context,
    Color bgColor,
    bool withCorners,
    String text,
    Color textColor,
    Function function,
    EdgeInsetsGeometry insetsGeometry,
    {isBorder = false,
    borderColor = Colors.transparent,
    FontWeight weight = FontWeight.w600,
    bool isIcon = false,
    String? icons,
    List<BoxShadow> shadow = const []}) {
  double buttonHeight = getButtonHeightFigma();
  double fontSize = getButtonFontSizeFigma();
  return InkWell(
    onTap: () {
      function();
    },
    child: Container(
      margin: insetsGeometry,
      width: double.infinity,
      height: buttonHeight,
      decoration: getButtonDecoration(bgColor,
          withCorners: withCorners,
          corner: (withCorners) ? getButtonCorners() : 0,
          withBorder: isBorder,
          borderColor: borderColor,
          shadow: shadow),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          getHorSpace(10.w),
          Expanded(
            child: getCustomFont(
              text,
              fontSize,
              textColor,
              1,
              textAlign: TextAlign.start,
              fontWeight: weight,
            ),
            flex: 1,
          ),
          (isIcon)
              ? getSvgImage(context, icons ?? "", getEditIconSize())
              : getHorSpace(0),
          getHorSpace(10.w)
        ],
      ),
    ),
  );
}

Widget getSubButton(
    BuildContext context,
    Color bgColor,
    bool withCorners,
    String text,
    Color textColor,
    Function function,
    EdgeInsetsGeometry insetsGeometry,
    {isBorder = false,
    double width = double.infinity,
    borderColor = Colors.transparent,
    FontWeight weight = FontWeight.w600,
    bool isIcon = false,
    String? icons}) {
  double buttonHeight = 40.h;
  double buttonCorner = 20.h;
  return InkWell(
    onTap: () {
      function();
    },
    child: Container(
      margin: insetsGeometry,
      width: width,
      height: buttonHeight,
      decoration: getButtonDecoration(bgColor,
          withCorners: withCorners,
          corner: (withCorners) ? buttonCorner : 0,
          withBorder: isBorder,
          borderColor: borderColor),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          (isIcon)
              ? getSvgImage(context, icons ?? "", getEditIconSize())
              : getHorSpace(0),
          (isIcon) ? getHorSpace(10.w) : getHorSpace(0),
          getCustomFont(
            text,
            16,
            textColor,
            1,
            textAlign: TextAlign.center,
            fontWeight: weight,
          )
        ],
      ),
    ),
  );
}

Widget getCircularImage(BuildContext context, double width, double height,
    double radius, String img,
    {BoxFit boxFit = BoxFit.contain, bool listen = true}) {
  return SizedBox(
    height: height,
    width: width,
    child: ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(radius)),
      child: getAssetImage(context, img, width, height,
          boxFit: boxFit, listen: listen),
    ),
  );
}

Widget getVerSpace(double verSpace) {
  return SizedBox(
    height: verSpace,
  );
}

Widget buildFavouriteBtn(EdgeInsets edgeInsets) {
  return Container(
    margin: edgeInsets,
    height: 20.w,
    width: 20.w,
    decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white,
        boxShadow: [
          BoxShadow(
              color: Color.fromRGBO(0, 0, 0, 0.25),
              offset: Offset(0, 1),
              blurRadius: 1)
        ]),
    child: Center(
      child:
          Icon(Icons.favorite_border_rounded, size: 13.w, color: Colors.black),
    ),
  );
}

Widget buildStarView(BuildContext context, String rate) {
  return Row(
    children: [
      getSvgImageWithSize(context, "star.svg", 17.w, 17.w, fit: BoxFit.fill),
      6.w.horizontalSpace,
      getCustomFont(rate, 14, getAccentColor(context), 1,
          fontWeight: FontWeight.w400, txtHeight: 1.5)
    ],
  );
}

Widget buildDistanceView(BuildContext context, String rate) {
  return buildCustomDistanceView(
      context, rate, 17.w, 14, getAccentColor(context), FontWeight.w400);
}

Widget buildReviewItem(BuildContext context, String title, String review,
    String detail, String img) {
  return Container(
    width: double.infinity,
    margin: EdgeInsets.symmetric(vertical: 10.h),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        getCircleImage(context, img, 30.h),
        8.w.horizontalSpace,
        Expanded(
          flex: 1,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              getCustomFont(title, 14, getFontColor(context), 1,
                  fontWeight: FontWeight.w500),
              6.h.verticalSpace,
              getMultilineCustomFont(review, 14, getFontGreyColor(context),
                  fontWeight: FontWeight.w400),
              6.h.verticalSpace,
              getCustomFont(detail, 12, getFontHint(context), 1,
                  fontWeight: FontWeight.w500),
            ],
          ),
        )
      ],
    ),
  );
}

Widget buildCustomDistanceView(BuildContext context, String rate,
    double imgSize, double fontSize, Color fontColor, FontWeight weight) {
  return Row(
    children: [
      getSvgImageWithSize(context, "Distance.svg", imgSize, imgSize,
          fit: BoxFit.fill),
      6.w.horizontalSpace,
      getCustomFont(rate, 14, fontColor, 1, fontWeight: weight, txtHeight: 1.5)
    ],
  );
}

Widget buildButtonBookNow(BuildContext context, Function function) {
  return InkWell(
    onTap: () {
      function();
    },
    child: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        getCustomFont("Book Now", 16, getFontColor(context), 1,
            fontWeight: FontWeight.w600),
        8.w.horizontalSpace,
        Icon(
          Icons.arrow_forward_rounded,
          color: getFontColor(context),
          size: 18.w,
        )
      ],
    ),
  );
}

Widget getProfileRowContainer(
    BuildContext context, Function function, String text) {
  return InkWell(
    onTap: () {
      function();
    },
    child: Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      width: double.infinity,
      height: 56.h,
      decoration: getButtonDecoration(
        getCardColor(context),
        withCorners: true,
        corner: 6.h,
        shadow: [
          BoxShadow(
            color: Color(0x3882a483),
            blurRadius: 33,
            offset: Offset(0, 7),
          ),
        ],
      ),
      margin: EdgeInsets.symmetric(
          horizontal: FetchPixels.getDefaultHorSpaceFigma(context),
          vertical: 10.h),
      child: Row(
        children: [
          Expanded(
              child: getCustomFont(text, 16, getFontColor(context), 1,
                  fontWeight: FontWeight.w500)),
          getSvgImage(context, 'arrow.svg', 16)
        ],
      ),
    ),
  );
}

Widget getSearchMapFigmaWidget(
    BuildContext context,
    TextEditingController searchController,
    ValueChanged<String> onChanged,
    String hint,
    {bool readOnly = false}) {
  double height = 46.h;
  double fontSize = 14;

  return Container(
    width: double.infinity,
    height: height,
    child: Container(
      height: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 14.w),
      decoration: getButtonDecoration(getCardColor(context),
          withCorners: true,
          corner: getEditRadiusSizeFigma(),
          withBorder: true,
          borderColor: getCurrentTheme(context).unselectedWidgetColor),
      child: Align(
        alignment: Alignment.centerLeft,
        child: TextField(
          readOnly: readOnly,
          controller: searchController,
          onChanged: onChanged,
          decoration: InputDecoration(
              isDense: true,
              hintText: hint,
              border: InputBorder.none,
              hintStyle: TextStyle(
                  fontFamily: Constant.fontsFamily,
                  fontSize: fontSize.sp,
                  fontWeight: FontWeight.w500,
                  color: getFontHint(context))),
          style: TextStyle(
              fontFamily: Constant.fontsFamily,
              fontSize: fontSize.sp,
              fontWeight: FontWeight.w500,
              color: getFontColor(context)),
          textAlign: TextAlign.start,
          maxLines: 1,
        ),
      ),
    ),
  );
}

Widget getHorSpace(double verSpace) {
  return SizedBox(
    width: verSpace,
  );
}
