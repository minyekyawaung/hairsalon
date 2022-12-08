import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hairsalon/app/model/BusinessLocation.dart';
import 'package:hairsalon/base/constant.dart';
import 'package:hairsalon/base/select_status_model.dart';
import '../../../base/color_data.dart';
import '../../../base/data_file.dart';
import '../../../base/fetch_pixels.dart';
import '../../../base/get/route_key.dart';
import '../../../base/widget_utils.dart';
import '../../model/BusinessLocation.dart' as BusinessLocation;

class TabLocation extends StatelessWidget {
  final Future<List<BusinessLocation.Data>> categoryList =
      DataFile.getBusinessLocation();

  @override
  Widget build(BuildContext context) {
    Constant.setupSize(context);

    return Container(
      decoration: BoxDecoration(
          image:
              getDecorationAssetImage(context, 'map.png', fit: BoxFit.cover)),
      child: Container(
        height: MediaQuery.of(context).size.height,
        child: DraggableScrollableSheet(
          maxChildSize: 0.7,
          builder: (BuildContext context, myscrollController) {
            return Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(22.r)),
              ),

              child: FutureBuilder<List<BusinessLocation.Data>>(
                future: categoryList,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                      controller: myscrollController,
                      itemCount: snapshot.data!.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          margin: EdgeInsets.symmetric(
                              horizontal:
                                  FetchPixels.getDefaultHorSpaceFigma(context),
                              vertical: 10.h),
                          decoration: getButtonDecoration(getCardColor(context),
                              withCorners: true,
                              corner: 20.h,
                              shadow: [
                                const BoxShadow(
                                    color: Color.fromRGBO(
                                        0, 0, 0, 0.07999999821186066),
                                    offset: Offset(-4, 5),
                                    blurRadius: 16)
                              ]),
                          width: double.infinity,
                          height: 100.h,
                          padding: EdgeInsets.symmetric(
                              vertical: 10.h, horizontal: 10.w),
                          child: InkWell(
                            onTap: () {
                              Constant.sendToNext(
                                  context, salonDetailScreenRoute);
                            },
                            child: Row(
                              children: [
                                getCircularImage(context, 80.h, double.infinity,
                                    20.h, "salon3.png",
                                    boxFit: BoxFit.cover),
                                12.w.horizontalSpace,
                                Expanded(
                                  flex: 1,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      getCustomFont(
                                        //"Royalty barbershop",
                                        snapshot.data![index].name,
                                        18,
                                        getFontColor(context),
                                        1,
                                        fontWeight: FontWeight.w700,
                                      ),
                                      6.h.verticalSpace,
                                      buildLocationRow(
                                          context,
                                          //"4140 Parker Rd.  New Mexico 31134",
                                          snapshot.data![index].city +
                                              " ," +
                                              snapshot.data![index].state,
                                          getFontGreyColor(context)),
                                      6.h.verticalSpace,
                                      Row(
                                        children: [
                                          buildStarView(context, "4.9"),
                                          10.w.horizontalSpace,
                                          buildDistanceView(context, "50 m"),
                                        ],
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  } else if (snapshot.hasError) {
                    return Text('${snapshot.error}');
                  }
                  // By default, show a loading spinner.
                  return const CircularProgressIndicator();
                },
              ),

              // child: Builder(builder: (context)
              // {
              //   return ListView.builder
              //   (
              //     controller: myscrollController,
              //     itemCount: 7,
              //     itemBuilder: (BuildContext context, int index) {
              //       return Container(
              //         margin: EdgeInsets.symmetric(
              //             horizontal:
              //                 FetchPixels.getDefaultHorSpaceFigma(context),
              //             vertical: 10.h),
              //         decoration: getButtonDecoration(getCardColor(context),
              //             withCorners: true,
              //             corner: 20.h,
              //             shadow: [
              //               const BoxShadow(
              //                   color: Color.fromRGBO(
              //                       0, 0, 0, 0.07999999821186066),
              //                   offset: Offset(-4, 5),
              //                   blurRadius: 16)
              //             ]),
              //         width: double.infinity,
              //         height: 100.h,
              //         padding: EdgeInsets.symmetric(
              //             vertical: 10.h, horizontal: 10.w),
              //         child: InkWell(
              //           onTap: () {
              //             Constant.sendToNext(context, salonDetailScreenRoute);
              //           },
              //           child: Row(
              //             children: [
              //               getCircularImage(context, 80.h, double.infinity,
              //                   20.h, "salon3.png",
              //                   boxFit: BoxFit.cover),
              //               12.w.horizontalSpace,
              //               Expanded(
              //                 flex: 1,
              //                 child: Column(
              //                   mainAxisAlignment: MainAxisAlignment.center,
              //                   crossAxisAlignment: CrossAxisAlignment.start,
              //                   children: [
              //                     getCustomFont(
              //                       "Royalty barbershop",
              //                       18,
              //                       getFontColor(context),
              //                       1,
              //                       fontWeight: FontWeight.w700,
              //                     ),
              //                     6.h.verticalSpace,
              //                     buildLocationRow(
              //                         context,
              //                         "4140 Parker Rd.  New Mexico 31134",
              //                         getFontGreyColor(context)),
              //                     6.h.verticalSpace,
              //                     Row(
              //                       children: [
              //                         buildStarView(context, "4.9"),
              //                         10.w.horizontalSpace,
              //                         buildDistanceView(context, "50 m"),
              //                       ],
              //                     ),
              //                   ],
              //                 ),
              //               )
              //             ],
              //           ),
              //         ),
              //       );
              //     },
              //   );
              // }),
            );
          },
        ),
      ),
    );
  }
}
