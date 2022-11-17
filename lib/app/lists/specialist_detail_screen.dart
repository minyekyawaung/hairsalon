import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hairsalon/base/constant.dart';
import 'package:hairsalon/base/data_file.dart';
import 'package:hairsalon/base/fetch_pixels.dart';
import 'package:hairsalon/base/widget_utils.dart';
import 'package:readmore/readmore.dart';
import '../../base/color_data.dart';
import '../model/model_profile.dart';

class SpecialistDetailScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SalonDetailScreen();
  }
}

class _SalonDetailScreen extends State<SpecialistDetailScreen> {
  List<ModelProfile> allProfileList = DataFile.getAllProfileList();

  RxInt selectedIndex = 0.obs;

  @override
  Widget build(BuildContext context) {
    Constant.setupSize(context);
    double horSpace = FetchPixels.getDefaultHorSpaceFigma(context);

    return WillPopScope(
        child: Scaffold(
          body: SingleChildScrollView(
            child: Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: 308.h,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(
                              "${Constant.assetImagePath}profile_detail.png"),
                          fit: BoxFit.cover)),
                  child: Stack(
                    children: [
                      Container(
                          width: double.infinity,
                          height: double.infinity,
                          decoration: const BoxDecoration(
                            gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  Color.fromRGBO(0, 0, 0, 0.7699999809265137),
                                  Color.fromRGBO(0, 0, 0, 0.3100000023841858),
                                  Color.fromRGBO(0, 0, 0, 0.1000000023841858),
                                  Colors.transparent
                                ]),
                          )),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            getBackIcon(context, () {
                              Constant.backToPrev(context);
                            }, colors: Colors.white),
                            getToolbarIcons(context, "heart.svg", () {},
                                color: Colors.white)
                          ],
                        ),
                      ).marginOnly(left: horSpace, right: horSpace, top: 60.h)
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 260.h),
                  padding: EdgeInsets.symmetric(vertical: 20.h),
                  decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(30.h)),
                      color: getCurrentTheme(context).scaffoldBackgroundColor),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: getCustomFont(
                                "Kiren Dely", 22, getFontColor(context), 1,
                                fontWeight: FontWeight.w700),
                          ),
                          buildStarView(context, "4.9")
                        ],
                      ).marginSymmetric(horizontal: horSpace),
                      10.h.verticalSpace,
                      getCustomFont("hairstyle specialist", 16,
                              getFontGreyColor(context), 1)
                          .marginSymmetric(horizontal: horSpace),
                      16.h.verticalSpace,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          buildListItem(
                              context,
                              "10 year",
                              "Experiance",
                              MainAxisAlignment.start,
                              CrossAxisAlignment.start),
                          buildListItem(
                              context,
                              "200+",
                              "Reviews",
                              MainAxisAlignment.center,
                              CrossAxisAlignment.center),
                          buildListItem(
                              context,
                              "20K+",
                              "Clients",
                              MainAxisAlignment.center,
                              CrossAxisAlignment.center),
                        ],
                      ).marginSymmetric(horizontal: horSpace),
                      16.h.verticalSpace,
                      ReadMoreText(
                        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
                        style: buildTextStyle(
                          context,
                          getFontColor(context),
                          FontWeight.w400,
                          16,
                          txtHeight: 1.5,
                        ),
                        trimLines: 4,
                        trimMode: TrimMode.Line,
                        textAlign: TextAlign.start,
                        trimCollapsedText: 'Show more',
                        lessStyle: buildTextStyle(
                            context, getFontColor(context), FontWeight.w500, 16,
                            txtHeight: 1.5),
                        moreStyle: buildTextStyle(
                            context, getFontColor(context), FontWeight.w500, 16,
                            txtHeight: 1.5),
                        trimExpandedText: ' Less',
                      ).marginSymmetric(horizontal: horSpace),
                      16.h.verticalSpace,
                      getCustomFont("Salon  specialists", 18,
                              getFontColor(context), 1,
                              fontWeight: FontWeight.w700, txtHeight: 1.5)
                          .marginSymmetric(horizontal: horSpace),
                      16.h.verticalSpace,
                      Container(
                        width: double.infinity,
                        height: 92.h,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: allProfileList.length,
                          padding: EdgeInsets.zero,
                          itemBuilder: (context, index) {
                            return buildProfileItem(context, index);
                          },
                        ),
                      ),
                      16.h.verticalSpace,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          getCustomFont("Reviews", 20, getFontColor(context), 1,
                              fontWeight: FontWeight.w700),
                          getCustomFont(
                              "Write a review", 14, getFontColor(context), 1,
                              fontWeight: FontWeight.w700),
                        ],
                      ).marginSymmetric(horizontal: horSpace),
                      10.h.verticalSpace,
                      ListView.builder(
                        shrinkWrap: true,
                        padding: EdgeInsets.symmetric(horizontal: horSpace),
                        itemCount: 5,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return buildReviewItem(
                              context,
                              "Maria Sana",
                              "“I Was A vrey First To Pleased With This app using and get great experiance",
                              "2 Day Ago",
                              "profile1.png");
                        },
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        onWillPop: () async {
          Constant.backToFinish(context);
          return false;
        });
  }

  Widget buildProfileItem(BuildContext context, int index) {
    double horSpace = FetchPixels.getDefaultHorSpaceFigma(context);

    return InkWell(
      onTap: () {},
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          getCircleImage(context, allProfileList[index].image, 64.h),
          getCustomFont(
              allProfileList[index].name, 16, getFontColor(context), 1,
              fontWeight: FontWeight.w400)
        ],
      ).marginOnly(
          left: (index == 0) ? horSpace : horSpace / 2,
          right:
              (index == allProfileList.length - 1) ? horSpace : (horSpace / 2)),
    );
  }

  Widget buildListItem(BuildContext context, String title, String name,
      MainAxisAlignment alignment, CrossAxisAlignment crossAlignment) {
    return Column(
      mainAxisAlignment: alignment,
      crossAxisAlignment: crossAlignment,
      children: [
        getCustomFont(
          title,
          16,
          getFontColor(context),
          1,
          fontWeight: FontWeight.w500,
        ),
        5.h.verticalSpace,
        getCustomFont(
          name,
          16,
          getFontGreyColor(context),
          1,
          fontWeight: FontWeight.w400,
        )
      ],
    );
  }
}
