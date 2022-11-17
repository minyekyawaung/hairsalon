import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hairsalon/base/color_data.dart';
import 'package:hairsalon/base/widget_utils.dart';

import '../../base/constant.dart';
import '../../base/data_file.dart';
import '../../base/get/route_key.dart';
import '../../base/get/value_selection_controller.dart';
import '../model/model_category.dart';

class SalonList extends StatelessWidget {
  final List<ModelCategory> categoryList = DataFile.getAllCategoryList();

  final List<String> images = [
    'salon1.png',
    'salon2.png',
    'salon3.png',
    'salon4.png'
  ];

  @override
  Widget build(BuildContext context) {
    TextEditingController searchController = TextEditingController();

    var selectionController = Get.find<ValueSelectionController>();
    Constant.setupSize(context);

    return getScreenDetailDefaultView(
        context, selectionController.selectedTitle.value, () {
      Constant.backToPrev(context);
    },
        Column(
          children: [
            30.h.verticalSpace,
            getDefaultTextFiled(context, "Search", searchController,
                getFontColor(context), (value) {},
                withPrefix: true,
                imgName: "search.svg",
                isFilled: false,
                withFilter: false),
            Expanded(
              flex: 1,
              child: ListView.builder(
                padding: EdgeInsets.symmetric(vertical: 10.h),
                shrinkWrap: true,
                itemCount: images.length,
                itemBuilder: (context, index) {
                  return buildItemNearestSalonDetail(context ,() {
                    Constant.sendToNext(context, salonDetailScreenRoute);
                  },  img: images[index]);
                },
              ),
            )
          ],
        ),
        centerTitle: true);
  }
}
