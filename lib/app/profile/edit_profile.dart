import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hairsalon/base/constant.dart';
import 'package:hairsalon/base/get/image_controller.dart';

import '../../../base/color_data.dart';
import '../../base/fetch_pixels.dart';
import '../../base/widget_utils.dart';

class EditProfile extends StatelessWidget {
  final imageController = Get.put(ImageController());

  onBackClick(BuildContext context) {
    // Get.delete<ImageController>();
    Constant.backToPrev(context);
  }

  @override
  Widget build(BuildContext context) {
    double horSpace = FetchPixels.getDefaultHorSpaceFigma(context);

    TextEditingController nameController = TextEditingController();
    TextEditingController phoneController = TextEditingController();
    TextEditingController emailController = TextEditingController();

    emailController.text = 'estherhoward@gmail.com';
    nameController.text = 'Esther Howard';
    phoneController.text = '(302) 555-0107';

    return getScreenDetailDefaultView(
      context,
      'Edit Profile',
      () {
        onBackClick(context);
      },
      Column(
        children: [
          Expanded(
            child: ListView(
              shrinkWrap: true,
              children: [
                50.h.verticalSpace,
                getProfileCell(context),
                40.h.verticalSpace,
                getDefaultTextFiled(
                  context,
                  "Full Name",
                  nameController,
                  getFontGreyColor(context),
                  (value) {},
                ),
                20.h.verticalSpace,
                getDefaultTextFiled(
                  context,
                  "Phone",
                  phoneController,
                  getFontGreyColor(context),
                  (value) {},
                ),
                20.h.verticalSpace,
                getDefaultTextFiled(
                  context,
                  "Email",
                  emailController,
                  getFontGreyColor(context),
                  (value) {},
                ),
                20.h.verticalSpace,
              ],
            ),
            flex: 1,
          ),
          getButtonFigma(
            context,
            getAccentColor(context),
            true,
            'Save profile',
            Colors.white,
            () {
              onBackClick(context);
            },
            EdgeInsets.zero,
          ).marginSymmetric(horizontal: horSpace),
          30.h.verticalSpace,
        ],
      ),
    );
  }

  getProfileCell(BuildContext context) {
    return Center(
      child: Container(
        width: 100.h,
        height: 100.h,
        child: Stack(
          children: [
            Positioned.fill(
              child: Align(
                  alignment: Alignment.topLeft,
                  child: Obx(
                    () => getCircleImage(
                      context,
                      (imageController.imagePath.value.isNotEmpty)
                          ? '${imageController.imagePath.value}'
                          : 'profile.jpg',
                      100.h,
                      fileImage: (imageController.imagePath.value.isNotEmpty),
                    ),
                  )),
            ),
            Positioned.fill(
              child: Align(
                alignment: Alignment.bottomRight,
                child: InkWell(
                  onTap: () {
                    imageController.getImage();
                  },
                  child: Container(
                    width: 32.h,
                    height: 32.h,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Color(0x2d7a6054),
                          blurRadius: 23,
                          offset: Offset(1, 8),
                        ),
                      ],
                      color: Colors.white,
                    ),
                    child: Center(
                      child: getSvgImage(
                        context,
                        'camera.svg',
                        18,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
