import 'package:hairsalon/app/model/model_bottom_nav.dart';
import 'package:hairsalon/app/model/model_category.dart';
import 'package:hairsalon/app/model/model_profile.dart';
import 'package:hairsalon/app/model/model_services.dart';

import '../app/model/model_banner.dart';
import '../app/model/model_chat.dart';
import '../app/model/model_intro.dart';
import '../app/model/model_notifications.dart';
import '../app/model/model_payment.dart';

class DataFile {
  static List<ModelPayment> getAllPaymentList() {
    List<ModelPayment> paymentList = [];

    paymentList.add(ModelPayment("Pay.svg", "PayPal"));
    paymentList.add(ModelPayment("Pay2.svg", "Visa"));
    paymentList.add(ModelPayment("Pay3.svg", "Master Card"));
    paymentList.add(ModelPayment("Pay4.svg", "Pay Point"));

    return paymentList;
  }

  static List<ModelBanner> getAllBannerList() {
    List<ModelBanner> list = [];

    list.add(ModelBanner("banner1.png", "#D9EEF9"));
    list.add(ModelBanner("banner2.png", "#FFE4EE"));
    list.add(ModelBanner("banner3.png", "#F0E4FF"));

    return list;
  }

  static List<String> slotTime = [
    "4:00 PM",
    "4:30 PM",
    "4:30 PM",
    "4:30 PM",
    "4:30 PM",
    "4:30 PM",
    "4:30 PM",
    "4:30 PM"
  ];

  static List<ModelServices> getAllServicesList() {
    List<ModelServices> serviceList = [];

    serviceList.add(ModelServices("haircut.png", "Hair Cut for men",
        "Shampoo, haircut,Blow dry.", "45 min", "150"));
    serviceList.add(ModelServices("cat3.png", "Hair coloring",
        "Shampoo, haircolor,Blow dry.", "65 min", "170"));
    serviceList.add(ModelServices("gallery4.png", "Hair styling",
        "Shampoo, haircolor,waves.", "65 min", "140"));
    serviceList.add(ModelServices("manicure.png", "Manicure",
        "Manicure ,message,cleaning.", "65 min", "70"));
    serviceList.add(ModelServices(
        "hair_spa.png", "Hair spa", "Shampoo,spa,blow dry.", "45 min", "150"));

    return serviceList;
  }

  static List<ModelCategory> getAllCategoryList() {
    List<ModelCategory> catList = [];

    catList.add(ModelCategory("Hair", "cat1.png"));
    catList.add(ModelCategory("Manicure", "cat2.png"));
    catList.add(ModelCategory("Coloring", "cat3.png"));
    catList.add(ModelCategory("Blow dry", "cat4.png"));
    catList.add(ModelCategory("Mackup", "cat5.png"));

    return catList;
  }

  static List<ModelCategory> getAllSearchCategoryList() {
    List<ModelCategory> catList = [];

    catList.add(ModelCategory("Hair", "cat1.png"));
    catList.add(ModelCategory("Hair Color", "cat3.png"));

    return catList;
  }

  static List<ModelBottomNav> getAllBottomNavList() {
    List<ModelBottomNav> bottomList = [];

    bottomList.add(ModelBottomNav("Home", "home.svg", "home_active.svg"));
    bottomList
        .add(ModelBottomNav("Location", "location.svg", "location_active.svg"));
    bottomList.add(ModelBottomNav("Booked", "save.svg", "save_active.svg"));
    bottomList.add(ModelBottomNav("Chat", "chat.svg", "chat_active.svg"));
    bottomList.add(ModelBottomNav("Profile", "Profile.svg", "user_active.svg"));

    return bottomList;
  }

  static List<ModelProfile> getAllProfileList() {
    List<ModelProfile> profileList = [];

    profileList.add(ModelProfile("Kirean Dely", "profile1.png"));
    profileList.add(ModelProfile("Maria", "profile2.png"));
    profileList.add(ModelProfile("William", "profile3.png"));
    profileList.add(ModelProfile("Seman", "profile4.png"));
    profileList.add(ModelProfile("Seman", "profile.jpg"));

    return profileList;
  }

  static List<ModelIntro> getAllIntroList() {
    List<ModelIntro> list = [];
    list.add(ModelIntro(
        "Discover and book your\nfavorite hair stylist !",
        "Schedule your date,time for your\nbeauty session in your favourite salon.",
        "intro1.png"));

    list.add(ModelIntro(
        "Helping you to take good\ncare of your Hair !",
        "With the help of our best stylist create\nyour own look.",
        "intro2.png"));

    list.add(ModelIntro(
        "Find your nearst salon in\nyour area !",
        "Set your location and find nearst salon\nto papmer you.",
        "intro3.png"));

    list.add(ModelIntro(
        "Confirm your bookind and\nmake secure pay",
        "When making time for beauty and\nwellness is already a challenge.",
        "intro4.png"));

    return list;
  }

  static List<ModelChat> getChattingList() {
    List<ModelChat> chatList = [];

    chatList.add(ModelChat(
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit,",
        "2:55 PM",
        false,
        false));
    chatList.add(ModelChat(
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut",
        "3:02 PM",
        true,
        true));
    chatList.add(ModelChat(
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit,",
        "4:58 PM",
        false,
        false));

    return chatList;
  }

  static List<ModelNotifications> getAllNotificationList() {
    List<ModelNotifications> notificationList = [];

    notificationList.add(ModelNotifications('salon1.png', 'Maria Sana',
        'Maria sana send message regarding \nservices check now!', '1 h ago'));
    notificationList.add(ModelNotifications('salon2.png', 'Maria Sana',
        'Maria sana send message regarding \nservices check now!', '1 h ago'));
    notificationList.add(ModelNotifications('salon3.png', 'Maria Sana',
        'Maria sana send message regarding \nservices check now!', '1 h ago'));
    notificationList.add(ModelNotifications('salon1.png', 'Maria Sana',
        'Maria sana send message regarding \nservices check now!', '1 h ago'));
    notificationList.add(ModelNotifications('salon2.png', 'Maria Sana',
        'Maria sana send message regarding \nservices check now!', '1 h ago'));

    return notificationList;
  }
}
