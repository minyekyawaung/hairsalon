import 'dart:math';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:hairsalon/base/constant.dart';
import 'package:hairsalon/base/data_file.dart';
import 'package:hairsalon/base/fetch_pixels.dart';
import 'package:hairsalon/base/get/route_key.dart';
import 'package:hairsalon/base/widget_utils.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:readmore/readmore.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:ui' as ui;
import '../../base/color_data.dart';
import '../../base/get/bottom_selection_controller.dart';
import '../model/model_profile.dart';

class SalonDetailScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SalonDetailScreen();
  }
}

class ImageTile extends StatelessWidget {
  const ImageTile({
    Key? key,
    required this.index,
    required this.width,
    required this.height,
  }) : super(key: key);

  final int index;
  final int width;
  final int height;

  @override
  Widget build(BuildContext context) {
    return Image.network(
      'https://picsum.photos/$width/$height?random=$index',
      width: width.toDouble(),
      height: height.toDouble(),
      fit: BoxFit.cover,
    );
  }
}

RxBool isVisible = false.obs;
RxInt selected = 0.obs;

class PhotosGallery extends StatelessWidget {
  final List<String> imgList = [
    "gallery1.png",
    "gallery2.png",
    "gallery3.png",
    "gallery4.png",
    "gallery5.png",
    "gallery6.png",
  ];
  final rnd = Random();

  final int crossAxisCount = 4;

  @override
  Widget build(BuildContext context) {
    Constant.setupSize(context);
    double crossCount = 2;
    double width = context.width;
    double itemWidth =
        (width - (FetchPixels.getDefaultHorSpaceFigma(context) * 3)) /
            crossCount;

    return Stack(children: [
      MasonryGridView.count(
          crossAxisCount: 2,
          physics: NeverScrollableScrollPhysics(),
          mainAxisSpacing: 10.w,
          padding: EdgeInsets.all(10.w),
          crossAxisSpacing: 10.w,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                isVisible.value = true;
                selected.value = index;

                showImage();
              },
              child: FutureBuilder<ui.Image>(
                builder: (context, snapshot) {
                  if (snapshot.hasData &&
                      snapshot.data != null &&
                      snapshot.connectionState == ConnectionState.done) {
                    double height = snapshot.data!.height.toDouble();
                    double ration = height / itemWidth;
                    double setHeight = height / ration;
                    print("height===$height===$ration--$setHeight");
                    return getCircularImage(context, double.infinity,
                        (height / 2), 12.h, imgList[index],
                        boxFit: BoxFit.cover);
                  } else {
                    return 0.verticalSpace;
                  }
                },
                future: Constant.getImage(imgList[index]),
              ),
            );
          },
          itemCount: imgList.length),
    ]);
  }
}

class showImage extends StatelessWidget {
  final List<String> imgList = [
    "gallery1.png",
    "gallery2.png",
    "gallery3.png",
    "gallery4.png",
    "gallery5.png",
    "gallery6.png",
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black38,
      height: double.infinity,
      width: double.infinity,
      child: Center(
        child: CarouselSlider(
            options: CarouselOptions(
              height: double.infinity,
              viewportFraction: 1,
              onPageChanged: (position, reason) {
                // imgList = position;
              },
              enableInfiniteScroll: false,
            ),
            items: List.generate(imgList.length, (index) {
              return getAssetImage(
                  context, imgList[index], double.infinity, double.infinity,
                  boxFit: BoxFit.cover);
            })),
      ),
    );
  }
}

class Reviews extends StatelessWidget {
  final RxDouble rating = 0.0.obs;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: FetchPixels.getDefaultHorSpaceFigma(context)),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              getCustomFont("Rating & Reviews", 18, getFontColor(context), 1,
                  fontWeight: FontWeight.w800),
              getCustomFont("View All", 16, getFontColor(context), 1,
                  fontWeight: FontWeight.w700)
            ],
          ),
          16.h.verticalSpace,
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  26.h.verticalSpace,
                  getCustomFont("4.5", 36, getFontColor(context), 1,
                      fontWeight: FontWeight.w700),
                  4.h.verticalSpace,
                  getCustomFont("out of 5", 18, getFontColor(context), 1,
                      fontWeight: FontWeight.w700),
                ],
              ),
              Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    buildRateRow(context, 5),
                    4.h.verticalSpace,
                    buildRateRow(context, 4),
                    4.h.verticalSpace,
                    buildRateRow(context, 3),
                    4.h.verticalSpace,
                    buildRateRow(context, 2),
                    4.h.verticalSpace,
                    buildRateRow(context, 1),
                  ],
                ),
              )
            ],
          ),
          17.h.verticalSpace,
          Row(
            children: [
              getCustomFont(
                "Write A Review",
                16,
                getFontColor(context),
                1,
                fontWeight: FontWeight.w700,
              ),
              6.w.horizontalSpace,
              ObxValue(
                  (p0) => GFRating(
                        onChanged: (ratings) {
                          rating.value = ratings;
                        },
                        value: rating.value,
                        itemCount: 5,
                        size: 21.h,
                        spacing: 3.w,
                        allowHalfRating: false,
                        defaultIcon: getSvgImageWithSize(
                            context, "rating.svg", 21.h, 21.h),
                        filledIcon: getSvgImageWithSize(
                            context, "star.svg", 21.h, 21.h),
                      ),
                  rating)
            ],
          ),
          10.h.verticalSpace,
          ListView.builder(
            shrinkWrap: true,
            padding: EdgeInsets.zero,
            itemCount: 5,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return buildReviewItem(
                  context,
                  "Maria Sana",
                  "“I Was A very First To Pleased With This app using and get great experience",
                  "15 April 2022",
                  "profile1.png");
            },
          )
        ],
      ),
    );
  }

  Row buildRateRow(BuildContext context, double rate) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        GFRating(
          onChanged: (rating) {},
          value: rate,
          itemCount: rate.toInt(),
          size: 10.h,
          spacing: 2.w,
          filledIcon: getSvgImageWithSize(context, "star.svg", 10.h, 10.h),
        ),
        4.w.horizontalSpace,
        LinearPercentIndicator(
          width: 180.w,
          lineHeight: 6.h,
          percent: rate / 5,
          padding: EdgeInsets.zero,
          progressColor: getFontHint(context),
          backgroundColor: "#CFCFCF".toColor(),
          barRadius: Radius.circular(10.h),
        ),
      ],
    );
  }
}

class AboutUs extends StatelessWidget {
  Widget buildTitle(BuildContext context, String s) {
    return getCustomFont(
      s,
      16,
      getFontHint(context),
      1,
      fontWeight: FontWeight.w700,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
          horizontal: FetchPixels.getDefaultHorSpaceFigma(context)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildTitle(context, "About"),
          6.h.verticalSpace,
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
          ),
          16.h.verticalSpace,
          buildTitle(context, "ADDRESS"),
          6.h.verticalSpace,
          buildIconRow(context, "451 Beach crescent vancouver,\nBC V6Z 3H1",
              "location.svg",
              withImg: true),
          14.h.verticalSpace,
          buildTitle(context, "PHONE"),
          6.h.verticalSpace,
          buildIconRow(context, "(1242)4582-2523", "call.svg"),
          16.h.verticalSpace,
          buildTitle(context, "OPENING HOURS"),
          10.h.verticalSpace,
          buildDetailRow(context, "Monday - Friday", "9:00 AM - 7:00 PM"),
          8.h.verticalSpace,
          buildDetailRow(context, "Saturday - Sunday", "9:00 AM - 1:00 PM")
        ],
      ),
    );
  }

  Row buildDetailRow(BuildContext context, String title, String duration) {
    return Row(
      children: [
        Icon(
          Icons.circle,
          size: 10.h,
          color: getAccentColor(context),
        ),
        6.w.horizontalSpace,
        Expanded(
          flex: 1,
          child: getCustomFont(title, 16, getFontColor(context), 1,
              fontWeight: FontWeight.w400),
        ),
        Expanded(
          flex: 1,
          child: getCustomFont(duration, 16, getFontColor(context), 1,
              fontWeight: FontWeight.w400),
        ),
      ],
    );
  }

  Row buildIconRow(BuildContext context, String title, String image,
      {bool withImg = false}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        getSvgImageWithSize(context, image, 22.h, 22.h, fit: BoxFit.fill)
            .marginOnly(top: 5.h),
        10.w.horizontalSpace,
        Expanded(
            flex: 1,
            child: getMultilineCustomFont(title, 16, getFontColor(context),
                fontWeight: FontWeight.w400, txtHeight: 1.5)),
        (withImg)
            ? getAssetImage(context, "map_btn.png", 44.h, 52.h,
                boxFit: BoxFit.fill)
            : 0.horizontalSpace
      ],
    );
  }
}

class _SalonDetailScreen extends State<SalonDetailScreen> {
  List<ModelProfile> allProfileList = DataFile.getAllProfileList();

  List<Widget> tabWidgetList = [AboutUs(), Reviews(), PhotosGallery()];

  List<String> tabList = ["About", "Reviews", "Photos"];
  RxInt selectedIndex = 0.obs;

  @override
  Widget build(BuildContext context) {
    Constant.setupSize(context);
    double horSpace = FetchPixels.getDefaultHorSpaceFigma(context);

    return WillPopScope(
        child: Scaffold(
          body: ObxValue(
              (p0) => (isVisible.value)
                  ? showImage()
                  : Column(
                      children: [
                        Expanded(
                          child: SingleChildScrollView(
                            child: Stack(
                              children: [
                                Container(
                                  width: double.infinity,
                                  padding: EdgeInsets.only(
                                      left: horSpace,
                                      right: horSpace,
                                      top: 60.h),
                                  height: 245.h,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage(
                                              "${Constant.assetImagePath}salon_detail_img.png"),
                                          fit: BoxFit.cover)),
                                  child: Align(
                                    alignment: Alignment.topLeft,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        getBackIcon(context, () {
                                          Constant.backToPrev(context);
                                        }, colors: Colors.white),
                                        getToolbarIcons(
                                            context, "heart.svg", () {},
                                            color: Colors.white)
                                      ],
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: 209.h),
                                  padding: EdgeInsets.symmetric(vertical: 20.h),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.vertical(
                                          top: Radius.circular(30.h)),
                                      color: getCurrentTheme(context)
                                          .scaffoldBackgroundColor),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Expanded(
                                            flex: 1,
                                            child: getCustomFont(
                                                "Royalty barbershop",
                                                22,
                                                getFontColor(context),
                                                1,
                                                fontWeight: FontWeight.w700),
                                          ),
                                          buildCustomDistanceView(
                                              context,
                                              "20m",
                                              20.h,
                                              16,
                                              getFontColor(context),
                                              FontWeight.w500)
                                        ],
                                      ).marginSymmetric(horizontal: horSpace),
                                      16.h.verticalSpace,
                                      Row(
                                        children: [
                                          getCustomFont("open", 16,
                                              getFontColor(context), 1,
                                              fontWeight: FontWeight.w500),
                                          10.w.horizontalSpace,
                                          getCustomFont("4.9", 17,
                                              getFontColor(context), 1,
                                              fontWeight: FontWeight.w400),
                                          3.w.horizontalSpace,
                                          GFRating(
                                            onChanged: (rating) {},
                                            value: 5,
                                            itemCount: 5,
                                            size: 16.h,
                                            padding: EdgeInsets.zero,
                                            spacing: 3.w,
                                            filledIcon: getSvgImageWithSize(
                                                context,
                                                "star.svg",
                                                16.h,
                                                16.h),
                                          )
                                        ],
                                      ).marginSymmetric(horizontal: horSpace),
                                      16.h.verticalSpace,
                                      Row(
                                        children: [
                                          buildListItem(
                                              context, "global.svg", "Website",
                                              () async {
                                            await launchUrl(
                                              Uri.parse(
                                                  "http://www.google.com"),
                                              mode: LaunchMode
                                                  .externalApplication,
                                            );
                                          }),
                                          buildListItem(context, "location.svg",
                                              "Direction", () {
                                            final controller = Get.find<
                                                BottomItemSelectionController>();
                                            controller.bottomBarSelectedItem
                                                .value = 1;
                                            Constant.sendToNext(
                                                context, homeScreenRoute);
                                          }),
                                          buildListItem(
                                              context, "chat.svg", "Message",
                                              () {
                                            Constant.sendToNext(
                                                context, chatScreenRoute);
                                          }),
                                          buildListItem(
                                              context, "export.svg", "Share",
                                              () {
                                            Share.share(
                                                "http://www.royaltybarbershop.com");
                                          }),
                                        ],
                                      ).marginSymmetric(horizontal: horSpace),
                                      16.h.verticalSpace,
                                      getCustomFont("Salon  specialists", 18,
                                              getFontColor(context), 1,
                                              fontWeight: FontWeight.w700,
                                              txtHeight: 1.5)
                                          .marginSymmetric(
                                              horizontal: horSpace),
                                      16.h.verticalSpace,
                                      Container(
                                        width: double.infinity,
                                        height: 92.h,
                                        child: ListView.builder(
                                          scrollDirection: Axis.horizontal,
                                          itemCount: allProfileList.length,
                                          padding: EdgeInsets.zero,
                                          itemBuilder: (context, index) {
                                            return buildProfileItem(
                                                context, index, () {
                                              Constant.sendToNext(context,
                                                  specialistDetailScreenRoute);
                                            },
                                                allProfileList[index],
                                                index ==
                                                    allProfileList.length - 1);
                                          },
                                        ),
                                      ),
                                      buildTabView(
                                          tabList, context, selectedIndex),
                                      ObxValue(
                                          (p0) => tabWidgetList[
                                              selectedIndex.value],
                                          selectedIndex),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          flex: 1,
                        ),
                        getButtonFigma(context, getAccentColor(context), true,
                            "Book Appointment", Colors.white, () {
                          Constant.sendToNext(context, serviceListRoute);
                        },
                            EdgeInsets.only(
                                left: horSpace,
                                right: horSpace,
                                bottom: 30.h,
                                top: 7.h))
                      ],
                    ),
              isVisible),
        ),
        onWillPop: () async {
          if (isVisible.value) {
            isVisible.value = false;
          } else {
            Constant.backToFinish(context);
          }
          return false;
        });
  }

  Expanded buildListItem(
      BuildContext context, String img, String name, Function function) {
    return Expanded(
      flex: 1,
      child: InkWell(
        onTap: () {
          function();
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            getSvgImageWithSize(context, img, 24.h, 24.h,
                color: getAccentColor(context)),
            6.h.verticalSpace,
            getCustomFont(
              name,
              14,
              getFontColor(context),
              1,
              fontWeight: FontWeight.w700,
            )
          ],
        ),
      ),
    );
  }
}
