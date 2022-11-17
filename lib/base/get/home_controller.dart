import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hairsalon/base/color_data.dart';
import 'package:hairsalon/base/get/storage.dart';

class HomeController extends GetxController {
  ThemeData get theme => isDark ? getDarkThemeData() : getLightThemeData();

  bool get introAvailable => isIntroAvailable;

  bool get isLogin => isLoggedIn;

  bool get isDlg => isDialog;

  bool fromDetail = false;

}
