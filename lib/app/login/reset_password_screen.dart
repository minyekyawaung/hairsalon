import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hairsalon/base/get/home_controller.dart';
import 'package:hairsalon/base/get/route_key.dart';

import '../../base/color_data.dart';
import '../../base/constant.dart';
import '../../base/fetch_pixels.dart';
import '../../base/get/bottom_selection_controller.dart';
import '../../base/widget_utils.dart';

// ignore: must_be_immutable
class ResetPasswordScreen extends StatelessWidget {
  backClick(BuildContext context) {
    Constant.backToFinish(context);
  }

  ResetPasswordScreen();

  RxBool showPass = false.obs;
  RxBool showPass2 = false.obs;

  TextEditingController passController = TextEditingController();
  TextEditingController pass2Controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Constant.setupSize(context);

    double horSpace = FetchPixels.getDefaultHorSpaceFigma(context);
    return buildTitleDefaultWidget(context, "Reset Password",
        "Enter password which are different\nfrom the previous paswords.", () {
      backClick(context);
    },
        Column(
          children: [
            ObxValue((p0) {
              return getPassTextFiled(context, "Password", passController,
                  getFontColor(context), showPass.value, () {
                showPass.value = !showPass.value;
              });
            }, showPass),
            20.h.verticalSpace,
            ObxValue((p0) {
              return getPassTextFiled(context, "Confirm Password",
                  pass2Controller, getFontColor(context), showPass2.value, () {
                showPass2.value = !showPass2.value;
              });
            }, showPass2),
            getButtonFigma(
                context, getAccentColor(context), true, "Submit", Colors.white,
                () {
              showGetDialog(context, "done.png", "Changed!",
                  "Your password has been changed\nsucessfully !", "Ok", () {
                backClick(context);

                var controller = Get.find<HomeController>();
                var bottomNavController =
                    Get.find<BottomItemSelectionController>();
                bottomNavController.changePos(0);

                (!controller.fromDetail)
                    ? Constant.sendToNext(context, loginRoute)
                    : Constant.sendToNext(context, homeScreenRoute);
              });
            }, EdgeInsets.symmetric(horizontal: horSpace, vertical: 40.h)),
          ],
        ));
  }
}
