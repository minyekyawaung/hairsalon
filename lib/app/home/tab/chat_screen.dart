import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../base/color_data.dart';
import '../../../base/constant.dart';
import '../../../base/data_file.dart';
import '../../../base/fetch_pixels.dart';
import '../../../base/widget_utils.dart';
import '../../model/model_chat.dart';

class ChatScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ChatScreen();
  }
}

class _ChatScreen extends State<ChatScreen> {
  finish() {
    Constant.backToPrev(context);
  }

  DateTime dateTime = DateTime.now();

  List<ModelChat> chattingList = DataFile.getChattingList();
  TextEditingController messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Constant.setupSize(context);
    double horSpace = FetchPixels.getDefaultHorSpaceFigma(context);
    EdgeInsets edgeInsets = EdgeInsets.symmetric(horizontal: horSpace);

    return getScreenDetailDefaultView(context, 'maria Swaui', () {
      Constant.backToPrev(context);
    },
        centerTitle: false,
        subtitle: true,
        subtitleText: 'online',
        actionImg: 'profile.jpg',
        Padding(
          padding: edgeInsets,
          child: Column(children: [
            Expanded(
              child: ListView.builder(
                  itemBuilder: (context, index) {
                    ModelChat modelChat = chattingList[index];
                    Radius radius = Radius.circular(16.h);
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: (modelChat.isSender)
                          ? CrossAxisAlignment.end
                          : CrossAxisAlignment.start,
                      children: [
                        30.h.verticalSpace,
                        Container(
                          width: 229.w,
                          padding: EdgeInsets.symmetric(
                              horizontal: 16.w, vertical: 12.h),
                          decoration: BoxDecoration(
                            color: (modelChat.isSender)
                                ? getGreyCardColor(context)
                                : lightAccentColor,
                            borderRadius: BorderRadius.only(
                                topLeft: radius,
                                topRight: radius,
                                bottomRight: (!modelChat.isSender)
                                    ? radius
                                    : Radius.zero,
                                bottomLeft: (modelChat.isSender)
                                    ? radius
                                    : Radius.zero),
                          ),
                          child: getMultilineCustomFont(
                              modelChat.msg,
                              16,
                              (modelChat.isReceive)
                                  ? getFontColor(context)
                                  : getAccentColor(context),
                              fontWeight: FontWeight.w500),
                        ),
                        10.h.verticalSpace,
                        Row(
                          mainAxisAlignment: (modelChat.isSender)
                              ? MainAxisAlignment.end
                              : MainAxisAlignment.start,
                          children: [
                            getCustomFont(modelChat.time, 14,
                                getFontGreyColor(context), 1,
                                fontWeight: FontWeight.w400),
                            (modelChat.isSender)
                                ? getSvgImageWithSize(
                                    context, "done_all.svg", 16.h, 16.h,
                                    fit: BoxFit.fill)
                                : 0.w.horizontalSpace
                          ],
                        ),
                      ],
                    );
                  },
                  itemCount: chattingList.length,
                  shrinkWrap: true,
                  padding: EdgeInsets.symmetric(
                    vertical: 18.h,
                  )),
              flex: 1,
            ),
            Row(
              children: [
                InkWell(
                  onTap: () {},
                  child: getSvgImageWithSize(
                    context,
                    "attach.svg",
                    24.h,
                    24.h,
                    fit: BoxFit.scaleDown,
                  ),
                ),
                Expanded(
                    child: getDefaultTextFiled(context, 'message',
                        messageController, getFontHint(context), (value) {})),
                getSvgImageWithSize(context, "send.svg", 24.h, 24.h,
                    fit: BoxFit.scaleDown)
              ],
            ),
            30.h.verticalSpace,
          ]),
        ));
  }
}
