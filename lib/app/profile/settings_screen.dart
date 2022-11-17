import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hairsalon/base/constant.dart';
import 'package:hairsalon/base/get/home_controller.dart';
import 'package:hairsalon/base/widget_utils.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../base/get/route_key.dart';

class SettingScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    Constant.setupSize(context);

    return getScreenDetailDefaultView(context, 'Setting', () {
      Constant.backToPrev(context);
    },
        Column(
          children: [
            Expanded(
                child: Column(
              children: [
                30.h.verticalSpace,
                getProfileRowContainer(context, () {
                  var controller = Get.find<HomeController>();
                  controller.fromDetail = true;
                  Constant.sendToNext(context, resetPassRoute);
                }, 'Change Password'),
                getProfileRowContainer(context, () {
                  Constant.sendToNext(context, termNCondition);
                }, 'Terms & Condition'),
                getProfileRowContainer(context, () async {
                  await launchUrl(
                    Uri.parse("http://www.google.com"),
                    mode: LaunchMode.externalApplication,
                  );
                }, 'Privacy Policy'),
                getProfileRowContainer(context, () {
                  Constant.sendToNext(context, notificationScreenRoute);
                }, 'Notifications'),
                getProfileRowContainer(context, () async {
                  await launchUrl(
                    Uri.parse("http://www.google.com"),
                    mode: LaunchMode.externalApplication,
                  );
                }, 'About us'),
              ],
            )),
          ],
        ));
  }
}
