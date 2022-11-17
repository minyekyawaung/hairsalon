import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hairsalon/base/get/route_key.dart';

import '../../base/color_data.dart';
import '../../base/constant.dart';
import '../../base/get/home_controller.dart';
import '../../base/widget_utils.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SplashScreen();
  }
}

class _SplashScreen extends State<SplashScreen> {
  final controller = Get.find<HomeController>();

  @override
  void initState() {
    super.initState();

    Future.delayed(
      const Duration(seconds: 0),
      () {
        (controller.isLogin)
            ? Constant.sendToNext(context, homeScreenRoute)
            : (controller.introAvailable)
                ? Constant.sendToNext(context, introRoute)
                : Constant.sendToNext(context, loginRoute);
      },
    );
  }

  backClick(BuildContext context) {
    Constant.backToFinish(context);
  }

  @override
  Widget build(BuildContext context) {
    Constant.setupSize(context);

    return WillPopScope(
        child: Scaffold(
          backgroundColor: getAccentColor(context),
          body: Container(
            width: double.infinity,
            height: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                getSvgImageWithSize(context, "splash_logo.svg", 102.h, 148.h,
                    fit: BoxFit.fill),
                26.h.verticalSpace,
                getCustomFont("Hair & Salon", 28, Colors.white, 1,
                    fontWeight: FontWeight.w700,
                    fontFamily: Constant.fontsFamilySplash,
                    textAlign: TextAlign.center)
              ],
            ),
          ),
        ),
        onWillPop: () async {
          backClick(context);
          return false;
        });
  }
}
