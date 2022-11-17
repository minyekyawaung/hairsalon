import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hairsalon/base/get/route_key.dart';
import 'package:hairsalon/base/get/storage.dart';

import '../../base/color_data.dart';
import '../../base/constant.dart';
import '../../base/fetch_pixels.dart';
import '../../base/get/bottom_selection_controller.dart';
import '../../base/widget_utils.dart';

class LoginScreen extends StatelessWidget {
  backClick(BuildContext context) {
    Constant.closeApp();
  }

  @override
  Widget build(BuildContext context) {
    RxBool showPass = false.obs;

    TextEditingController emailController = TextEditingController();
    TextEditingController passController = TextEditingController();
    Constant.setupSize(context);

    double horSpace = FetchPixels.getDefaultHorSpaceFigma(context);
    return buildTitleDefaultWidget(context, "Login", "Glad to meet you again! ",
        () {
      backClick(context);
    },
        Column(
          children: [
            getDefaultTextFiled(context, "Email", emailController,
                getFontColor(context), (value) {}),
            20.h.verticalSpace,
            ObxValue((p0) {
              return getPassTextFiled(context, "Password", passController,
                  getFontColor(context), showPass.value, () {
                showPass.value = !showPass.value;
              });
            }, showPass),
            20.h.verticalSpace,
            Align(
              alignment: Alignment.bottomRight,
              child: InkWell(
                onTap: () {
                  Constant.sendToNext(context, forgotPassRoute);
                },
                child: getCustomFont(
                    "Forgot password ?", 16, getFontColor(context), 1,
                    fontWeight: FontWeight.w400, textAlign: TextAlign.end),
              ),
            ).paddingOnly(right: horSpace),
            getButtonFigma(
                context,
                getAccentColor(context),
                true,
                "Log In",
                Colors.white,
                () {
                  final controller = Get.find<BottomItemSelectionController>();
                  controller.bottomBarSelectedItem.value=0;
                  setLoggedIn(true);
                  Constant.sendToNext(context, homeScreenRoute);
                },
                EdgeInsets.symmetric(horizontal: horSpace, vertical: 40.h)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child:
                      getDivider(setColor: getCurrentTheme(context).hintColor),
                  flex: 1,
                ),
                getCustomFont(" OR Sign in with ", 16, getFontColor(context), 1,
                    fontWeight: FontWeight.w400, textAlign: TextAlign.center),
                Expanded(
                  child:
                      getDivider(setColor: getCurrentTheme(context).hintColor),
                  flex: 1,
                )
              ],
            ).marginSymmetric(horizontal: horSpace),
            30.h.verticalSpace,
            getButtonFigma(
                context,
                getCardColor(context),
                true,
                "Login with Google",
                getFontColor(context),
                () {},
                EdgeInsets.zero,
                isIcon: true,
                icons: "Google.svg",
                shadow: [
                  const BoxShadow(
                      color: Color.fromRGBO(130, 164, 131, 0.2199999988079071),
                      offset: Offset(0, 7),
                      blurRadius: 33)
                ]).marginSymmetric(horizontal: horSpace, vertical: 10.h),
            getButtonFigma(
                context,
                getCardColor(context),
                true,
                "Login with Facebook",
                getFontColor(context),
                () {},
                EdgeInsets.zero,
                isIcon: true,
                icons: "Facebook.svg",
                shadow: [
                  BoxShadow(
                      color: Color.fromRGBO(130, 164, 131, 0.2199999988079071),
                      offset: Offset(0, 7),
                      blurRadius: 33)
                ]).marginSymmetric(horizontal: horSpace, vertical: 10.h),
            80.h.verticalSpace,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                getCustomFont(
                  "Already have an account?",
                  16,
                  getFontBlackColor(context),
                  1,
                  fontWeight: FontWeight.w400,
                ),
                InkWell(
                  onTap: () {
                    Constant.sendToNext(context, registrationRoute);
                  },
                  child: getCustomFont(
                    " Sign up",
                    18,
                    getFontBlackColor(context),
                    1,
                    fontWeight: FontWeight.w700,
                  ),
                )
              ],
            )
          ],
        ));
  }
}
