import 'package:figma_squircle/figma_squircle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hairsalon/app/home/tab/tab_booked.dart';
import 'package:hairsalon/app/home/tab/tab_chat.dart';
import 'package:hairsalon/app/home/tab/tab_home.dart';
import 'package:hairsalon/app/home/tab/tab_location.dart';
import 'package:hairsalon/app/home/tab/tab_profile.dart';
import 'package:hairsalon/base/BottomBar.dart';
import 'package:hairsalon/base/color_data.dart';
import 'package:hairsalon/base/data_file.dart';
import 'package:hairsalon/base/get/bottom_selection_controller.dart';
import 'package:hairsalon/base/widget_utils.dart';

import '../../base/constant.dart';
import '../../base/get/home_controller.dart';
import '../../base/get/route_key.dart';
import '../../base/get/storage.dart';
import '../model/model_bottom_nav.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _HomeScreen();
  }
}

class _HomeScreen extends State<HomeScreen> {
  var controller = Get.find<HomeController>();

  @override
  void initState() {
    super.initState();

    if (!controller.isDlg) {
      Future.delayed(Duration.zero, () => showLocationDialog(context));
    }
  }

  List<Widget> bottomViewList = [
    TabHome(),
    TabLocation(),
    TabBooked(),
    TabChat(),
    TabProfile(),
  ];
  List<ModelBottomNav> allBottomNavList = DataFile.getAllBottomNavList();

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<BottomItemSelectionController>();
    Constant.setupSize(context);
    double bottomNavHeight = 104.h;
    return WillPopScope(
        child: Scaffold(
          backgroundColor: getAccentColor(context),
          extendBodyBehindAppBar: true,
          appBar: getInVisibleAppBar(color: Colors.transparent),
          body: Stack(
            children: [
              Obx(() => bottomViewList[controller.bottomBarSelectedItem.value]),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  width: double.infinity,
                  height: bottomNavHeight,
                  decoration: ShapeDecoration(
                      shadows: const [
                        BoxShadow(
                            color:
                                Color.fromRGBO(134, 93, 93, 0.1599999964237213),
                            offset: Offset(0, -2),
                            blurRadius: 20)
                      ],
                      color: getCardColor(context),
                      shape: SmoothRectangleBorder(
                          borderRadius: SmoothBorderRadius.vertical(
                              top: SmoothRadius(
                                  cornerRadius: 40.h, cornerSmoothing: 0.5)))),
                  child: Obx(() => BottomBar(
                        onTap: (p0) {
                          controller.changePos(p0);
                        },
                        currentIndex: controller.bottomBarSelectedItem.value,
                        selectedItemColor: getAccentColor(context),
                        selectedColorOpacity: 1,
                        unselectedItemColor: getFontBlackColor(context),
                        itemShape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(27.h))),
                        itemPadding: EdgeInsets.symmetric(
                            horizontal: 11.w, vertical: 8.h),
                        items: List.generate(allBottomNavList.length, (index) {
                          return BottomBarItem(
                              title: getCustomFont(
                                  allBottomNavList[index].title,
                                  14,
                                  Colors.white,
                                  1,
                                  fontWeight: FontWeight.w700),
                              icon: getSvgImageWithSize(context,
                                  allBottomNavList[index].icon, 24.h, 24.h,
                                  fit: BoxFit.scaleDown,
                                  color: getFontBlackColor(context)),
                              activeIcon: getSvgImageWithSize(
                                  context,
                                  allBottomNavList[index].activeIcon,
                                  24.h,
                                  24.h,
                                  fit: BoxFit.scaleDown));
                        }),
                      )),
                ),
              )
            ],
          ),
        ),
        onWillPop: () async {
          // backClick();
          return false;
        });
  }
}

showLocationDialog(BuildContext context) {
  showGetDialog(
      context,
      'location_image.png',
      'Find best hair salon !',
      'Enable your location to find hair \nsalon near your area.',
      'Select Current Location',
      () {
        Get.back();
        setDialog(true);
        Constant.sendToNext(context, selectLocationRoute);
      },
      dialogHeight: 489.w,
      btnTextVertical: 'Other Location',
      imgWidth: 259.w,
      withVerticalBtn: true,

      functionVerticalBtn: () {

        Get.back();
        setDialog(true);
        Constant.sendToNext(context, selectOtherLocationRoute);
      });
}
