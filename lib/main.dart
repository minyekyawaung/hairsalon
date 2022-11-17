import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hairsalon/app/booking/booking_detail_screen.dart';
import 'package:hairsalon/app/booking/confirm_list.dart';
import 'package:hairsalon/app/booking/payment_list.dart';
import 'package:hairsalon/app/booking/payment_screen.dart';
import 'package:hairsalon/app/booking/services_list.dart';
import 'package:hairsalon/app/home/home_screen.dart';
import 'package:hairsalon/app/home/tab/chat_screen.dart';
import 'package:hairsalon/app/location/select_location.dart';
import 'package:hairsalon/app/intro/intro_screen.dart';
import 'package:hairsalon/app/intro/splash_screen.dart';
import 'package:hairsalon/app/lists/filter_screen.dart';
import 'package:hairsalon/app/lists/offer_detail_Screen.dart';
import 'package:hairsalon/app/lists/salon_detail_screen.dart';
import 'package:hairsalon/app/lists/salon_list.dart';
import 'package:hairsalon/app/lists/search_screen.dart';
import 'package:hairsalon/app/lists/specialist_detail_screen.dart';
import 'package:hairsalon/app/location/select_other_location.dart';
import 'package:hairsalon/app/login/forgot_pass_screen.dart';
import 'package:hairsalon/app/login/login_screen.dart';
import 'package:hairsalon/app/login/phone_number_screen.dart';
import 'package:hairsalon/app/login/registration_screen.dart';
import 'package:hairsalon/app/login/reset_password_screen.dart';
import 'package:hairsalon/app/login/termn_condition_screen.dart';
import 'package:hairsalon/app/login/verification_screen.dart';
import 'package:hairsalon/app/profile/edit_profile.dart';
import 'package:hairsalon/app/profile/my_profile_screen.dart';
import 'package:hairsalon/app/profile/notification_screen.dart';
import 'package:hairsalon/app/profile/settings_screen.dart';
import 'package:hairsalon/base/get/home_controller.dart';
import 'package:hairsalon/base/get/store_binding.dart';

import 'app/lists/category_list.dart';
import 'base/get/route_key.dart';
import 'base/my_custom_scroll_behavior.dart';
import 'generated/l10n.dart';

Future<void> main() async {
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // @override
  // Widget build(BuildContext context) {
  //   // TODO: implement build
  //   return SplashScreen();
  // }

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());

    return GetMaterialApp(
      scrollBehavior: MyCustomScrollBehavior(),
      debugShowCheckedModeBanner: false,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        S.delegate,
      ],
      title: 'Grocery',
      initialBinding: StoreBinding(),
      initialRoute: "/",
      theme: controller.theme,
      // themeMode: (darkThemeProvider.darkMode) ? ThemeMode.dark : ThemeMode.light,
      routes: {
        "/": (context) => SplashScreen(),
        splashRoute: (context) => SplashScreen(),
        introRoute: (context) => IntroScreen(),
        loginRoute: (context) => LoginScreen(),
        forgotPassRoute: (context) => ForgotPasswordScreen(),
        resetPassRoute: (context) => ResetPasswordScreen(),
        registrationRoute: (context) => RegistrationScreen(),
        phoneNumberRoute: (context) => PhoneNumberScreen(),
        verificationScreenRoute: (context) => VerificationScreen(),
        termNCondition: (context) => TermsNCondition(),
        homeScreenRoute: (context) => HomeScreen(),
        categoryScreenRoute: (context) => CategoryList(),
        salonScreenRoute: (context) => SalonList(),
        searchScreenRoute: (context) => SearchScreen(),
        filterScreenRoute: (context) => FilterScreen(),
        offerDetailScreenRoute: (context) => OfferDetailScreen(),
        salonDetailScreenRoute: (context) => SalonDetailScreen(),
        specialistDetailScreenRoute: (context) => SpecialistDetailScreen(),
        serviceListRoute: (context) => ServicesList(),
        confirmServiceListRoute: (context) => ConfirmList(),
        paymentListRoute: (context) => PaymentList(),
        paymentScreenRoute: (context) => PaymentScreen(),
        bookingDetailScreenRoute: (context) => BookingDetailScreen(),
        selectLocationRoute: (context) => SelectLocation(),
        selectOtherLocationRoute: (context) => SelectOtherLocation(),
        chatScreenRoute: (context) => ChatScreen(),
        myProfileScreenRoute: (context) => MyProfileScreen(),
        editProfileRoute: (context) => EditProfile(),
        settingScreenRoute: (context) => SettingScreen(),
        notificationScreenRoute: (context) => NotificationScreen(),
        // "/": (context) => controller.isLogin ? const HomeScreen() : SplashScreen()
      },
    );
  }
}
