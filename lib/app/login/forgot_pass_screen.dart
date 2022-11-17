import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hairsalon/base/get/route_key.dart';

import '../../base/color_data.dart';
import '../../base/constant.dart';
import '../../base/country_code_picker.dart';
import '../../base/fetch_pixels.dart';
import '../../base/widget_utils.dart';

class ForgotPasswordScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ForgotPasswordScreen();
  }
}

class _ForgotPasswordScreen extends State<ForgotPasswordScreen> {
  backClick(BuildContext context) {
    Constant.backToFinish(context);
  }

  TextEditingController numberController = TextEditingController();
  TextEditingController passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Constant.setupSize(context);

    double horSpace = FetchPixels.getDefaultHorSpaceFigma(context);
    return buildTitleDefaultWidget(context, "Forgot Password",
        "Enter your registered phone number\nto reset password.", () {
      backClick(context);
    },
        Column(
          children: [
            getDefaultTextFiledWithCustomPrefix(
                context,
                "Phone number",
                numberController,
                getFontColor(context),
                CountryCodePicker(
                  onChanged: print,
                  initialSelection: 'IN',
                  flagWidth: 40.h,
                  padding: EdgeInsets.zero,
                  textStyle: buildTextStyle(
                      context, getFontColor(context), FontWeight.w400, 16.sp),
                  favorite: const ['+91', 'IN'],
                  showCountryOnly: false,
                  showDropDownButton: true,
                  showOnlyCountryWhenClosed: false,
                  alignLeft: false,
                ).marginOnly(left: 20.w)),
            getButtonFigma(
                context, getAccentColor(context), true, "Submit", Colors.white,
                () {
              Constant.sendToNext(context, resetPassRoute);
            }, EdgeInsets.symmetric(horizontal: horSpace, vertical: 30.h)),
          ],
        ));
  }
}
