import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:hairsalon/base/constant.dart';
import 'package:hairsalon/base/fetch_pixels.dart';
import 'package:hairsalon/base/get/route_key.dart';
import 'package:hairsalon/base/get/value_selection_controller.dart';
import 'package:hairsalon/base/widget_utils.dart';

import '../../../base/color_data.dart';
import '../../../base/data_file.dart';
import '../../model/Taxonomy.dart';
import '../../model/model_banner.dart';
import '../../model/model_category.dart';

class TabHome extends StatelessWidget {
  final List<ModelCategory> categoryList = DataFile.getAllCategoryList();
  // final List<String> salonList = ["salon3.png", "salon4.png"];
  late Future<List<Data>> salonList = DataFile.callTaxonomy();
  final List<String> nearestSalonList = ["salon3.png", "salon4.png"];
  final List<ModelBanner> bannerList = DataFile.getAllBannerList();

  @override
  Widget build(BuildContext context) {
    RxInt sliderPos = 0.obs;

    TextEditingController searchController = TextEditingController();

    var selectionController = Get.find<ValueSelectionController>();

    Constant.setupSize(context);
    double imgSize = 50.h;
    double horSpace = FetchPixels.getDefaultHorSpaceFigma(context);

    return Column(
      children: [
        getToolbarTopViewHeight(context).verticalSpace,
        20.h.verticalSpace,
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              flex: 1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  getCustomFont(
                    "Hello !",
                    18,
                    Colors.white,
                    1,
                    fontWeight: FontWeight.w700,
                  ),
                  6.h.verticalSpace,
                  getCustomFont(
                    "YKA",
                    22,
                    Colors.white,
                    1,
                    fontWeight: FontWeight.w700,
                  )
                ],
              ),
            ),
            getCircularImage(context, imgSize, imgSize, 19.h, "profile.jpg")
          ],
        ).paddingSymmetric(horizontal: horSpace),
        30.h.verticalSpace,
        getDefaultTextFiled(context, "Search", searchController,
            getFontColor(context), (value) {},
            withPrefix: true,
            imgName: "search.svg",
            isFilled: true,
            withFilter: true,
            readOnly: true, editTap: () {
          Constant.sendToNext(context, searchScreenRoute);
        }, filterClick: () {
          Constant.sendToNext(context, filterScreenRoute);
        }),
        35.h.verticalSpace,
        Expanded(
          flex: 1,
          child: getDefaultContainerView(
              context,
              ListView(
                padding: EdgeInsets.only(top: 20.h),
                children: [
                  SizedBox(
                    height: 187.w,
                    child: CarouselSlider(
                        options: CarouselOptions(
                          height: double.infinity,
                          viewportFraction: 0.9,
                          enlargeCenterPage: true,
                          onPageChanged: (position, reason) {
                            sliderPos.value = position;
                          },
                          enableInfiniteScroll: false,
                        ),
                        items: List.generate(bannerList.length, (index) {
                          ModelBanner banner = bannerList[index];
                          return InkWell(
                            onTap: () {
                              Constant.sendToNext(
                                  context, offerDetailScreenRoute);
                            },
                            child: Container(
                              padding: EdgeInsets.only(left: 17.w, top: 21.w),
                              height: double.infinity,
                              decoration: getButtonDecoration(
                                  banner.color.toColor(),
                                  withCorners: true,
                                  corner: 20.w),
                              child: Row(
                                children: [
                                  Expanded(
                                    flex: 1,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          width: 97.w,
                                          height: 39.w,
                                          child: GFBorder(
                                            dashedLine: [2, 0],
                                            type: GFBorderType.oval,
                                            color: getAccentColor(context),
                                            padding: EdgeInsets.zero,
                                            child: Center(
                                              child: getCustomFont(
                                                  "10% Off",
                                                  22,
                                                  getAccentColor(context),
                                                  1,
                                                  fontWeight: FontWeight.w400,
                                                  textAlign: TextAlign.center,
                                                  horFactor: true,
                                                  fontFamily: Constant
                                                      .fontsFamilyOffer),
                                            ),
                                          ),
                                        ),
                                        9.w.verticalSpace,
                                        getCustomFont("On manicure", 18,
                                            getFontColor(context), 1,
                                            fontWeight: FontWeight.w700,
                                            txtHeight: 1.5),
                                        4.w.verticalSpace,
                                        getCustomFont("By Royalty barbershop",
                                            14, getFontGreyColor(context), 1,
                                            fontWeight: FontWeight.w400,
                                            txtHeight: 1.5),
                                        Expanded(
                                          flex: 1,
                                          child: 0.verticalSpace,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            getCustomFont("See details", 18,
                                                getFontColor(context), 1,
                                                fontWeight: FontWeight.w700,
                                                txtHeight: 1.5),
                                            8.w.horizontalSpace,
                                            Icon(
                                              Icons.arrow_forward_rounded,
                                              color: getFontColor(context),
                                              size: 18.w,
                                            )
                                          ],
                                        ),
                                        28.w.verticalSpace
                                      ],
                                    ),
                                  ),
                                  getAssetImage(context, banner.img, 174.w,
                                      double.infinity,
                                      boxFit: BoxFit.fill)
                                ],
                              ),
                              // color: greenColor,
                            ),
                          );
                        })),
                  ),
                  20.h.verticalSpace,
                  ObxValue(
                      (p0) => Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: indicators(
                              context, bannerList.length, sliderPos.value)),
                      sliderPos),
                  20.h.verticalSpace,
                  buildSeeAllView(context, "Categories", () {
                    Constant.sendToNext(context, categoryScreenRoute);
                  }),
                  20.w.verticalSpace,
                  SizedBox(
                    height: 101.w,
                    child: ListView.builder(
                      itemBuilder: (context, index) {
                        ModelCategory category = categoryList[index];
                        return Container(
                          margin: EdgeInsets.only(
                              left: (index == 0) ? horSpace : (horSpace / 2),
                              right: (index == categoryList.length - 1)
                                  ? horSpace
                                  : (horSpace / 2)),
                          width: 74.w,
                          height: double.infinity,
                          child: InkWell(
                            onTap: () {
                              Constant.sendToNext(context, salonScreenRoute);
                            },
                            child: Column(
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: getCircularImage(
                                      context,
                                      double.infinity,
                                      double.infinity,
                                      12.w,
                                      category.image,
                                      boxFit: BoxFit.fill),
                                ),
                                6.w.verticalSpace,
                                getCustomFont(category.title, 16,
                                    getFontColor(context), 1,
                                    fontWeight: FontWeight.w400,
                                    textAlign: TextAlign.center,
                                    txtHeight: 1.5),
                                2.w.verticalSpace,
                              ],
                            ),
                          ),
                        );
                      },
                      scrollDirection: Axis.horizontal,
                      itemCount: categoryList.length,
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                    ),
                  ),
                  20.w.verticalSpace,
                  buildSeeAllView(context, "Top Rated salon", () {
                    selectionController.setSelectedTitle("Top Rated salon");
                    Constant.sendToNext(context, salonScreenRoute);
                  }),
                  SizedBox(
                    height: 261.w,
                    child: FutureBuilder<List<Data>>(
                      future: salonList,
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          // return Text(snapshot.data!.data.length.toString());
                          // return Text(snapshot.data!.length.toString());
                          // List<Taxonomy> items =
                          //     snapshot.data as List<Taxonomy>;
                          return ListView.builder(
                            itemCount: snapshot.data!.length,
                            //itemCount: items.length,
                            itemBuilder: (context, index) {
                              return InkWell(
                                onTap: () {
                                  Constant.sendToNext(
                                      context, salonDetailScreenRoute);
                                },
                                child: Container(
                                  padding: EdgeInsets.all(10.w),
                                  margin: EdgeInsets.only(
                                      left: (index == 0) ? horSpace : 6.w,
                                      right:
                                          (index == snapshot.data!.length - 1)
                                              ? horSpace
                                              : 6.w,
                                      top: 20.w,
                                      bottom: 20.w),
                                  width: 278.w,
                                  decoration: getButtonDecoration(
                                      getCardColor(context),
                                      withCorners: true,
                                      corner: 20.w,
                                      shadow: [
                                        const BoxShadow(
                                            color: Color.fromRGBO(
                                                0, 0, 0, 0.07999999821186066),
                                            offset: Offset(-4, 5),
                                            blurRadius: 16)
                                      ]),
                                  height: double.infinity,
                                  child: Column(
                                    children: [
                                      Expanded(
                                        flex: 1,
                                        child: Stack(
                                          children: [
                                            getCircularImageApi(
                                                context,
                                                double.infinity,
                                                double.infinity,
                                                20.w,
                                                snapshot
                                                    .data![index].description
                                                    .toString(),
                                                // "https://pos.crystalshine.net/uploads/img/1669874698_1.png",
                                                boxFit: BoxFit.cover),
                                            Align(
                                              alignment: Alignment.topRight,
                                              child: buildFavouriteBtn(
                                                  EdgeInsets.all(10.w)),
                                            )
                                          ],
                                        ),
                                      ),
                                      10.w.verticalSpace,
                                      Row(
                                        children: [
                                          Expanded(
                                            flex: 1,
                                            child: getCustomFont(
                                                // "Royalty  barbershop",
                                                snapshot.data![index].name
                                                    .toString(),
                                                16,
                                                getFontColor(context),
                                                1,
                                                fontWeight: FontWeight.w700),
                                          ),
                                          buildStarView(context, "4.9"),
                                        ],
                                      ),
                                      10.w.verticalSpace,
                                      buildLocationRow(
                                          context,
                                          "8502 Preston Rd. Inglewood, Maine",
                                          getFontGreyColor(context)),
                                    ],
                                  ),
                                ),
                              );
                            },
                            scrollDirection: Axis.horizontal,
                            padding: EdgeInsets.zero,
                            shrinkWrap: true,
                          );

                          //return Text('data');
                        } else if (snapshot.hasError) {
                          return Text('${snapshot.error}');
                        }

                        // By default, show a loading spinner.
                        return const CircularProgressIndicator();
                      },
                    ),

                    // child:  ListView.builder
                    // (
                    //   itemCount: salonList.length,
                    //   itemBuilder: (context, index) {
                    //     return InkWell(
                    //       onTap: () {
                    //         Constant.sendToNext(
                    //             context, salonDetailScreenRoute);
                    //       },
                    //       child: Container(
                    //         padding: EdgeInsets.all(10.w),
                    //         margin: EdgeInsets.only(
                    //             left: (index == 0) ? horSpace : 6.w,
                    //             right: (index == salonList.length - 1)
                    //                 ? horSpace
                    //                 : 6.w,
                    //             top: 20.w,
                    //             bottom: 20.w),
                    //         width: 278.w,
                    //         decoration: getButtonDecoration(
                    //             getCardColor(context),
                    //             withCorners: true,
                    //             corner: 20.w,
                    //             shadow: [
                    //               const BoxShadow(
                    //                   color: Color.fromRGBO(
                    //                       0, 0, 0, 0.07999999821186066),
                    //                   offset: Offset(-4, 5),
                    //                   blurRadius: 16)
                    //             ]),
                    //         height: double.infinity,
                    //         child: Column(
                    //           children: [
                    //             Expanded(
                    //               flex: 1,
                    //               child: Stack(
                    //                 children: [
                    //                   getCircularImage(
                    //                       context,
                    //                       double.infinity,
                    //                       double.infinity,
                    //                       20.w,
                    //                       salonList[index],
                    //                       boxFit: BoxFit.cover),
                    //                   Align(
                    //                     alignment: Alignment.topRight,
                    //                     child: buildFavouriteBtn(
                    //                         EdgeInsets.all(10.w)),
                    //                   )
                    //                 ],
                    //               ),
                    //             ),
                    //             10.w.verticalSpace,
                    //             Row(
                    //               children: [
                    //                 Expanded(
                    //                   flex: 1,
                    //                   child: getCustomFont(
                    //                       "Royalty  barbershop",
                    //                       16,
                    //                       getFontColor(context),
                    //                       1,
                    //                       fontWeight: FontWeight.w700),
                    //                 ),
                    //                 buildStarView(context, "4.9"),
                    //               ],
                    //             ),
                    //             10.w.verticalSpace,
                    //             buildLocationRow(
                    //                 context,
                    //                 "8502 Preston Rd. Inglewood, Maine",
                    //                 getFontGreyColor(context)),
                    //           ],
                    //         ),
                    //       ),
                    //     );
                    //   },
                    //   scrollDirection: Axis.horizontal,
                    //   padding: EdgeInsets.zero,
                    //   shrinkWrap: true,
                    // ),
                  ),
                  buildSeeAllView(context, "Near by beauty salon", () {
                    selectionController
                        .setSelectedTitle("Near by beauty salon");
                    Constant.sendToNext(context, salonScreenRoute);
                  }),
                  SizedBox(
                    height: 292.w,
                    child: ListView.builder(
                      itemCount: nearestSalonList.length,
                      itemBuilder: (context, index) {
                        return Container(
                          padding: EdgeInsets.all(10.w),
                          margin: EdgeInsets.only(
                              left: (index == 0) ? horSpace : 6.w,
                              right: (index == nearestSalonList.length - 1)
                                  ? horSpace
                                  : 6.w,
                              top: 20.w,
                              bottom: 20.w),
                          width: 278.w,
                          decoration: getButtonDecoration(getCardColor(context),
                              withCorners: true,
                              corner: 20.w,
                              shadow: [
                                const BoxShadow(
                                    color: Color.fromRGBO(
                                        0, 0, 0, 0.07999999821186066),
                                    offset: Offset(-4, 5),
                                    blurRadius: 16)
                              ]),
                          height: double.infinity,
                          child: InkWell(
                            onTap: () {
                              Constant.sendToNext(
                                  context, salonDetailScreenRoute);
                            },
                            child: Column(
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: Stack(
                                    children: [
                                      getCircularImage(
                                          context,
                                          double.infinity,
                                          double.infinity,
                                          20.w,
                                          nearestSalonList[index],
                                          boxFit: BoxFit.cover),
                                      Align(
                                        alignment: Alignment.topRight,
                                        child: buildFavouriteBtn(
                                            EdgeInsets.all(10.w)),
                                      )
                                    ],
                                  ),
                                ),
                                10.w.verticalSpace,
                                Row(
                                  children: [
                                    Expanded(
                                      flex: 1,
                                      child: getCustomFont(
                                          "Royalty  barbershop",
                                          16,
                                          getFontColor(context),
                                          1,
                                          fontWeight: FontWeight.w700),
                                    ),
                                    getSvgImageWithSize(
                                        context, "star.svg", 17.w, 17.w,
                                        fit: BoxFit.fill),
                                    6.w.horizontalSpace,
                                    getCustomFont(
                                        "4.9", 14, getAccentColor(context), 1,
                                        fontWeight: FontWeight.w400,
                                        txtHeight: 1.5),
                                  ],
                                ),
                                10.w.verticalSpace,
                                buildLocationRow(
                                    context,
                                    "8502 Preston Rd. Inglewood, Maine",
                                    getFontGreyColor(context)),
                                10.w.verticalSpace,
                                Row(
                                  children: [
                                    getSvgImageWithSize(
                                        context, "Distance.svg", 17.w, 17.w,
                                        fit: BoxFit.fill,
                                        color: getAccentColor(context)),
                                    6.w.horizontalSpace,
                                    Expanded(
                                      flex: 1,
                                      child: getCustomFont("20 m", 14,
                                          getAccentColor(context), 1,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    buildButtonBookNow(context, () {})
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                      scrollDirection: Axis.horizontal,
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                    ),
                  ),
                  10.w.verticalSpace,
                ],
              ),
              padding: EdgeInsets.only(bottom: 104.h)),
        ),
      ],
    );
  }

  Widget buildSeeAllView(
      BuildContext context, String title, Function function) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        getCustomFont(title, 20, getFontColor(context), 1,
            fontWeight: FontWeight.w700),
        InkWell(
          onTap: () {
            function();
          },
          child: getCustomFont(
            "See All",
            18,
            getAccentColor(context),
            1,
            fontWeight: FontWeight.w700,
          ),
        )
      ],
    ).paddingSymmetric(
        horizontal: FetchPixels.getDefaultHorSpaceFigma(context));
  }
}

List<Widget> indicators(BuildContext context, imagesLength, currentIndex) {
  return List<Widget>.generate(imagesLength, (index) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5.w),
      width: 8.w,
      height: 8.w,
      decoration: BoxDecoration(
          color: currentIndex == index
              ? getAccentColor(context)
              : lightAccentColor,
          shape: BoxShape.circle),
    );
  });
}

AnimatedContainer slider(images, pagePosition, active) {
  double margin = active ? 10 : 20;
  return AnimatedContainer(
    duration: Duration(milliseconds: 500),
    curve: Curves.easeInOutCubic,
    margin: EdgeInsets.all(margin),
    width: 50,
    height: double.infinity,
    color: greenColor,
  );
}
