import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hairsalon/base/color_data.dart';
import 'package:hairsalon/base/get/route_key.dart';
import 'package:hairsalon/base/get/value_storage_controller.dart';
import 'package:hairsalon/base/widget_utils.dart';

import '../../base/constant.dart';
import '../../base/data_file.dart';
import '../../base/fetch_pixels.dart';
import '../model/model_payment.dart';

class PaymentList extends StatelessWidget {
  final List<ModelPayment> paymentList = DataFile.getAllPaymentList();

  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController();

    Constant.setupSize(context);
    double horSpace = FetchPixels.getDefaultHorSpaceFigma(context);
    var controller = Get.find<ValueStorageController>();

    return getScreenDetailDefaultView(context, "Payment", () {
      Constant.backToPrev(context);
    },
        Column(
          children: [
            Expanded(
              flex: 1,
              child: ListView(
                children: [
                  ListView.builder(
                      shrinkWrap: true,
                      itemCount: paymentList.length,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        ModelPayment modelPayment = paymentList[index];
                        return ObxValue(
                            (p0) => Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: horSpace),
                                  width: double.infinity,
                                  height: 60.h,
                                  margin: EdgeInsets.symmetric(
                                      horizontal: horSpace, vertical: 10.h),
                                  decoration: getButtonDecoration(
                                      getCardColor(context),
                                      withCorners: true,
                                      corner: 12.h,
                                      shadow: [
                                        const BoxShadow(
                                            color: Color.fromRGBO(
                                                0, 0, 0, 0.07999999821186066),
                                            offset: Offset(-4, 5),
                                            blurRadius: 16)
                                      ]),
                                  child: InkWell(
                                    onTap: () {
                                      controller.selectedPaymentOption.value =
                                          index;
                                    },
                                    child: Row(
                                      children: [
                                        getSvgImageWithSize(context,
                                            modelPayment.image, 34.h, 34.h,
                                            fit: BoxFit.fill),
                                        12.w.horizontalSpace,
                                        Expanded(
                                          flex: 1,
                                          child: getCustomFont(
                                              modelPayment.title,
                                              16,
                                              getFontColor(context),
                                              1,
                                              fontWeight: FontWeight.w700),
                                        ),
                                        (p0 == index)
                                            ? getSvgImageWithSize(context,
                                                "radio_checked.svg", 25.h, 25.h,
                                                fit: BoxFit.fill)
                                            : getSvgImageWithSize(
                                                context,
                                                "radio_unselected.svg",
                                                25.h,
                                                25.h,
                                                fit: BoxFit.fill)
                                      ],
                                    ),
                                  ),
                                ),
                            controller.selectedPaymentOption);
                      },
                      padding: EdgeInsets.symmetric(vertical: 10.h)),
                  20.h.verticalSpace,
                  getButtonFigma(context, Colors.transparent, true,
                      "+ Add New Card", getAccentColor(context), () {
                    Get.bottomSheet(
                      Wrap(
                        children: [
                          getCustomFont(
                            "Add Card",
                            18,
                            getFontColor(context),
                            1,
                            fontWeight: FontWeight.w700,
                          ).paddingSymmetric(horizontal: horSpace),
                          getDefaultTextFiled(
                                  context,
                                  "Name on Card",
                                  nameController,
                                  getFontColor(context),
                                  (value) {})
                              .marginOnly(top: 20.h),
                          getDefaultTextFiled(
                                  context,
                                  "Card Number",
                                  nameController,
                                  getFontColor(context),
                                  (value) {})
                              .marginOnly(top: 20.h),
                          Row(
                            children: [
                              Expanded(
                                flex: 1,
                                child: getDefaultTextFiled(
                                    context,
                                    "MM/YY",
                                    nameController,
                                    getFontColor(context),
                                    (value) {},
                                    withPadding: false),
                              ),
                              20.w.horizontalSpace,
                              Expanded(
                                flex: 1,
                                child: getDefaultTextFiled(
                                    context,
                                    "CVV",
                                    nameController,
                                    getFontColor(context),
                                    (value) {},
                                    withPadding: false),
                              )
                            ],
                          ).marginOnly(
                              top: 20.h, left: horSpace, right: horSpace),
                          getButtonFigma(
                              context,
                              getAccentColor(context),
                              true,
                              "Save Card",
                              Colors.white,
                              () {},
                              EdgeInsets.only(
                                  left: horSpace, right: horSpace, top: 30.h))
                        ],
                      ).paddingSymmetric(vertical: 40.h),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.vertical(
                              top: Radius.circular(20.h))),
                      backgroundColor: getCardColor(context),
                      isScrollControlled: true,
                    );
                  }, EdgeInsets.symmetric(horizontal: horSpace),
                      isBorder: true, borderColor: getAccentColor(context)),
                  20.h.verticalSpace,
                ],
              ),
            ),
            getButtonFigma(context, getAccentColor(context), true, "Continue",
                    Colors.white, () {
              Constant.sendToNext(context, paymentScreenRoute);
            }, EdgeInsets.zero)
                .marginSymmetric(vertical: 30.h, horizontal: horSpace)
          ],
        ),
        centerTitle: true);
  }
}
