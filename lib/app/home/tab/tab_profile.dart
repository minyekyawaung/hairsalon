import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hairsalon/base/color_data.dart';
import 'package:hairsalon/base/get/image_controller.dart';
import 'package:hairsalon/base/get/route_key.dart';
import 'package:hairsalon/base/get/storage.dart';
import '../../../base/data_file.dart';
import '../../../base/constant.dart';
import '../../../base/fetch_pixels.dart';
import '../../../base/get/bottom_selection_controller.dart';
import '../../../base/widget_utils.dart';
import '../../model/model_profile.dart';

// ignore: must_be_immutable
class TabProfile extends StatelessWidget {
  final List<ModelProfile> allProfileList = DataFile.getAllProfileList();

  final List profileList = ['My Profile', 'My Booking', 'Setting'];

  var imageController = Get.find<ImageController>();

  @override
  Widget build(BuildContext context) {
    Constant.setupSize(context);
    return getScreenDetailDefaultView(
        context,
        'Profile',
        () {},
        Column(
          children: [
            Expanded(
              child: Column(
                children: [
                  50.h.verticalSpace,
                  Obx(
                    () => getCircleImage(
                      context,
                      (imageController.imagePath.value.isNotEmpty)
                          ? '${imageController.imagePath.value}'
                          : 'profile.jpg',
                      100.h,
                      fileImage: (imageController.imagePath.value.isNotEmpty),
                    ),
                  ),
                  20.h.verticalSpace,
                  getCustomFont('Kristin Watson', 16, getFontColor(context), 1,
                      fontWeight: FontWeight.w500),
                  3.h.verticalSpace,
                  getCustomFont('USA', 14, getFontColor(context), 1,
                      fontWeight: FontWeight.w700),
                  30.h.verticalSpace,
                  getProfileRowContainer(context, () {
                    Constant.sendToNext(context, myProfileScreenRoute);
                  }, 'My Profile'),
                  getProfileRowContainer(context, () {
                    final controller =
                        Get.find<BottomItemSelectionController>();
                    controller.bottomBarSelectedItem.value = 2;
                    Constant.sendToNext(context, homeScreenRoute);
                  }, 'My Booking'),
                  getProfileRowContainer(context, () {
                    Constant.sendToNext(context, settingScreenRoute);
                  }, 'Settings'),
                ],
              ),
            ),
            getButtonFigma(context, getAccentColor(context), true, 'Log Out',
                    Colors.white, () {
              setLoggedIn(false);
              Constant.sendToNext(context, loginRoute);
            },
                    EdgeInsets.symmetric(
                        horizontal:
                            FetchPixels.getDefaultHorSpaceFigma(context)))
                .marginSymmetric(vertical: 30.h),
            130.h.verticalSpace,
          ],
        ),
        withLeading: false);
  }
}
