import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hairsalon/app/model/model_notifications.dart';
import 'package:hairsalon/base/color_data.dart';
import 'package:hairsalon/base/constant.dart';
import 'package:hairsalon/base/widget_utils.dart';

import '../../base/data_file.dart';
import '../../base/fetch_pixels.dart';

class NotificationScreen extends StatelessWidget {
  final List<String> notifications = ['', '', '', '', '', '', '', ''];

  final List<ModelNotifications> notificationList =
      DataFile.getAllNotificationList();

  @override
  Widget build(BuildContext context) {
    Constant.setupSize(context);

    return getScreenDetailDefaultView(context, 'Notifications', () {
      Constant.backToPrev(context);
    },
        (notifications.isEmpty)
            ? buildNoNotificationWidget(context)
            : ListView.builder(
                itemCount: notificationList.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  ModelNotifications notifications = notificationList[index];

                  return Container(
                    margin: EdgeInsets.symmetric(
                        horizontal:
                            FetchPixels.getDefaultHorSpaceFigma(context),
                        vertical: 10.h),
                    decoration: getButtonDecoration(
                      getCardColor(context),
                      withCorners: true,
                      corner: 12.h,
                      shadow: [
                        BoxShadow(
                          color: Color(0x14000000),
                          blurRadius: 16,
                          offset: Offset(-4, 5),
                        ),
                      ],
                    ),
                    width: double.infinity,
                    height: 118.h,
                    padding:
                        EdgeInsets.symmetric(vertical: 20.h, horizontal: 10.w),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        getCircularImage(
                            context, 50.w, 50.h, 12.r, notifications.img,
                            boxFit: BoxFit.fill),
                        12.w.horizontalSpace,
                        Expanded(
                          flex: 1,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Expanded(
                                    flex: 1,
                                    child: getCustomFont(notifications.title,
                                        16, getFontColor(context), 1,
                                        fontWeight: FontWeight.w700),
                                  ),
                                  getCustomFont(
                                    '1 h ago',
                                    14,
                                    getFontGreyColor(context),
                                    1,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: Constant.fontsFamilyLato,
                                  )
                                ],
                              ),
                              6.h.verticalSpace,
                              Expanded(
                                child: getMultilineCustomFont(
                                    notifications.subtitle,
                                    16,
                                    getFontColor(context),
                                    fontWeight: FontWeight.w400),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ));
  }
}

Wrap buildNoNotificationWidget(BuildContext context) {
  return Wrap(
    alignment: WrapAlignment.center,
    crossAxisAlignment: WrapCrossAlignment.center,
    runAlignment: WrapAlignment.center,
    direction: Axis.vertical,
    children: [
      getAssetImage(context, "no_notification_img.png", 173.w, 128.h,
          boxFit: BoxFit.fitHeight),
      getCustomFont('No Notifications Yet!', 20, getFontColor(context), 1,
              fontWeight: FontWeight.w700)
          .marginOnly(top: 30.h, bottom: 10.h),
      getCustomFont('We’ll notify you when something arrives.', 16,
          getFontColor(context), 1,
          fontWeight: FontWeight.w400)
    ],
  );
}
