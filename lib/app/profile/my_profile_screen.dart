import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hairsalon/base/constant.dart';
import 'package:hairsalon/base/get/image_controller.dart';
import 'package:hairsalon/base/widget_utils.dart';

import '../../base/color_data.dart';
import '../../base/fetch_pixels.dart';
import '../../base/get/route_key.dart';

class MyProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TextEditingController nameController =
        TextEditingController(text: "Kristin Watson");
    TextEditingController phoneController =
        TextEditingController(text: "94654 12543");
    TextEditingController emailController =
        TextEditingController(text: "Kristinwatson58@gmail.com");

    var imageController = Get.find<ImageController>();

    Constant.setupSize(context);

    double horSpace = FetchPixels.getDefaultHorSpaceFigma(context);
    EdgeInsets edgeInsets = EdgeInsets.symmetric(horizontal: horSpace);

    return getScreenDetailDefaultView(context, 'My Profile', () {
      Constant.backToPrev(context);
    },
        Column(
          children: [
            Expanded(
                child: Column(
              children: [
                50.h.verticalSpace,
                Obx(() => getCircleImage(
                  context,
                  (imageController.imagePath.value.isNotEmpty)
                      ? '${imageController.imagePath.value}'
                      : 'profile.jpg',
                  100.h,
                  fileImage: (imageController.imagePath.value.isNotEmpty),
                ),),
                20.h.verticalSpace,
                getCustomFont('Kristin Watson', 16, getFontColor(context), 1,
                    fontWeight: FontWeight.w500),
                3.h.verticalSpace,
                getCustomFont('USA', 14, getFontColor(context), 1,
                    fontWeight: FontWeight.w700),
                40.h.verticalSpace,
                getDefaultUnderlineTextFiled(context, 'Name', nameController,
                    getFontHint(context), (value) {}),
                16.h.verticalSpace,
                getDefaultUnderlineTextFiled(context, 'Phone Number',
                    phoneController, getFontHint(context), (value) {}),
                16.h.verticalSpace,
                getDefaultUnderlineTextFiled(context, 'Email Address',
                    emailController, getFontHint(context), (value) {})
              ],
            )),
            getButtonFigma(context, getAccentColor(context), true,
                    'Edit profile', Colors.white, () {
              Constant.sendToNext(context, editProfileRoute);
            }, edgeInsets)
                .marginSymmetric(vertical: 30.h)
          ],
        ));
  }
}
