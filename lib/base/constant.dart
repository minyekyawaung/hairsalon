import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hairsalon/app/model/BusinessLocation.dart';
import 'package:hairsalon/base/size_config.dart';
import 'dart:ui' as ui;

import '../app/model/BusinessLocation.dart';

class Constant {
  static String assetImagePath = "assets/images/";
  static String assetImagePathNight = "assets/imagesNight/";
  static bool isDriverApp = false;
  static const String fontsFamily = "Montserrat";
  static const String fontsFamilySplash = "Avenir-Next-LT-Pro";
  static const String fontsFamilyOffer = "Plantagenet Cherokee";
  static const String fontsFamilyLato = "Lato-semibold";
  static const String fromLogin = "getFromLoginClick";
  static const String homePos = "getTabPos";
  static const String nameSend = "name";
  static const String imageSend = "image";
  static const String bgColor = "bgColor";
  static const String heroKey = "sendHeroKey";
  static const String sendVal = "sendVal";
  static const int stepStatusNone = 0;
  static const int stepStatusActive = 1;
  static const int stepStatusDone = 2;
  static const int stepStatusWrong = 3;
  static const double defScreenWidth = 414;
  static const double defScreenHeight = 896;

  static double getPercentSize(double total, double percent) {
    return (percent * total) / 100;
  }

  static void setupSize(BuildContext context,
      {double width = defScreenWidth, double height = defScreenHeight}) {
    ScreenUtil.init(context,
        designSize: Size(width, height), minTextAdapt: true);
  }

  static backToPrev(BuildContext context) {
    Get.back();
  }

  static Future<ui.Image> getImage(String name) {
    final Image image =
        Image(image: AssetImage(Constant.assetImagePath + name));

    Completer<ui.Image> completer = Completer<ui.Image>();
    image.image
        .resolve(const ImageConfiguration())
        .addListener(ImageStreamListener((ImageInfo image, bool _) {
      completer.complete(image.image);
    }));
    return completer.future;
  }

  static getCurrency(BuildContext context) {
    return "ETH";
  }

  static sendToNext(BuildContext context, String route, {Object? arguments}) {
    if (arguments != null) {
      Get.toNamed(route, arguments: arguments);
    } else {
      Get.toNamed(route);
    }
  }

  static sendToNextUpdate(BuildContext context, String route, Data bdata,
      {Data? arguments}) {
    if (bdata != null) {
      Get.toNamed(route, arguments: bdata);
    } else {
      Get.toNamed(route);
    }
  }

  static sendToNextWithBackResult(
      BuildContext context, String route, ValueChanged<dynamic> fun,
      {Object? arguments}) {
    if (arguments != null) {
      Get.toNamed(route, arguments: arguments)!.then((value) {
        fun(value);
      });
    } else {
      Get.toNamed(route)!.then((value) {
        fun(value);
      });
    }
  }

  static double getWidthPercentSize(double percent) {
    double screenWidth = SizeConfig.safeBlockHorizontal! * 100;
    return (percent * screenWidth) / 100;
  }

  static double getHeightPercentSize(double percent) {
    double screenHeight = SizeConfig.safeBlockVertical! * 100;
    return (percent * screenHeight) / 100;
  }

  static double getToolbarHeight(BuildContext context) {
    return MediaQuery.of(context).padding.top + kToolbarHeight;
  }

  static double getToolbarTopHeight(BuildContext context) {
    return MediaQuery.of(context).padding.top;
  }

  static sendToScreen(
      Widget widget, BuildContext context, ValueChanged<dynamic> setChange) {
    Get.to(() => widget)!.then(setChange);
  }

  static backToFinish(BuildContext context) {
    Get.back();
  }

  static formatTime(Duration d) =>
      d.toString().split('.').first.padLeft(8, "0");

  static closeApp() {
    Future.delayed(const Duration(milliseconds: 1000), () {
      SystemNavigator.pop();
    });
  }
}
