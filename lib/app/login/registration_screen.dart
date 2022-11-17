import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hairsalon/base/get/route_key.dart';

import '../../base/color_data.dart';
import '../../base/constant.dart';
import '../../base/fetch_pixels.dart';
import '../../base/widget_utils.dart';

class RegistrationScreen extends StatelessWidget {
  backClick(BuildContext context) {
    Constant.backToPrev(context);
  }

  @override
  Widget build(BuildContext context) {
    RxBool showPass = false.obs;
    RxBool showPass2 = false.obs;
    RxBool agreeTerm = false.obs;

    TextEditingController emailController = TextEditingController();
    TextEditingController nameController = TextEditingController();
    TextEditingController passController = TextEditingController();
    TextEditingController pass2Controller = TextEditingController();

    Constant.setupSize(context);

    double horSpace = FetchPixels.getDefaultHorSpaceFigma(context);
    return buildTitleDefaultWidget(context, "Create an account", "", () {
      backClick(context);
    },
        Column(
          children: [
            getDefaultTextFiled(context, "Name", nameController,
                getFontColor(context), (value) {}),
            20.h.verticalSpace,
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
            ObxValue((p0) {
              return getPassTextFiled(context, "Confirm Password",
                  pass2Controller, getFontColor(context), showPass2.value, () {
                showPass2.value = !showPass2.value;
              });
            }, showPass2),
            20.h.verticalSpace,
            Row(
              children: [
                ObxValue((p0) {
                  return Checkbox(
                    visualDensity: VisualDensity.compact,
                    side:
                        BorderSide(color: getAccentColor(context), width: 1.h),
                    activeColor: getAccentColor(context),
                    onChanged: (value) {
                      agreeTerm.value = value!;
                    },
                    value: agreeTerm.value,
                  );
                }, agreeTerm),
                getCustomFont("I Agree with", 16, getFontColor(context), 1,
                    fontWeight: FontWeight.w400, textAlign: TextAlign.start),
                Expanded(
                  flex: 1,
                  child: getCustomFont(
                      " Terms and condition", 16, getAccentColor(context), 1,
                      fontWeight: FontWeight.w700, textAlign: TextAlign.start),
                )
              ],
            ).paddingSymmetric(horizontal: horSpace),
            30.h.verticalSpace,
            getButtonFigma(
                context, getAccentColor(context), true, "Sign Up", Colors.white,
                () {
              Constant.sendToNext(context, phoneNumberRoute);
            }, EdgeInsets.symmetric(horizontal: horSpace)),
            30.h.verticalSpace,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  flex: 1,
                  child:
                      getDivider(setColor: getCurrentTheme(context).hintColor),
                ),
                getCustomFont(" OR Sign in with ", 16, getFontColor(context), 1,
                    fontWeight: FontWeight.w400, textAlign: TextAlign.center),
                Expanded(
                  flex: 1,
                  child:
                      getDivider(setColor: getCurrentTheme(context).hintColor),
                )
              ],
            ).marginSymmetric(horizontal: horSpace),
            50.h.verticalSpace,
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
                    Constant.sendToNext(context, loginRoute);
                  },
                  child: getCustomFont(
                    " Login",
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
