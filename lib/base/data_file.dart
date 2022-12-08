import 'dart:convert';

import 'package:hairsalon/app/model/model_bottom_nav.dart';
import 'package:hairsalon/app/model/model_category.dart';
import 'package:hairsalon/app/model/model_profile.dart';
import 'package:hairsalon/app/model/model_services.dart';

import '../app/model/Taxonomy.dart' as Taxoomy;
import '../app/model/BusinessLocation.dart' as BusinessLocation;
import '../app/model/SalonSpecialists.dart' as SalonSpecialists;
import '../app/model/model_banner.dart';
import '../app/model/model_chat.dart';
import '../app/model/model_intro.dart';
import '../app/model/model_notifications.dart';
import '../app/model/model_payment.dart';
import 'package:http/http.dart' as http;

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

  static List<String> getAllTaxonomy() {
    List<String> list = [];

    return list;
  }

  static Future<List<String>> callService() async {
    try {
      String uri =
          'https://pos.crystalshine.net/connector/api/business-location';
      String token =
          'eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiIsImp0aSI6ImRmYTVmNTQ3YjBmZjQ5ODU0MmRiNTk2YTI5MzdmYzFmZWQ1MzRjMzI5OGYxNjcxYmVjNGQ0OTA2Y2I1MmMxNTEyMjM4YjkxYTY4NzllZDFhIn0.eyJhdWQiOiI1IiwianRpIjoiZGZhNWY1NDdiMGZmNDk4NTQyZGI1OTZhMjkzN2ZjMWZlZDUzNGMzMjk4ZjE2NzFiZWM0ZDQ5MDZjYjUyYzE1MTIyMzhiOTFhNjg3OWVkMWEiLCJpYXQiOjE2Njk4NzQ0OTgsIm5iZiI6MTY2OTg3NDQ5OCwiZXhwIjoxNzAxNDEwNDk4LCJzdWIiOiIxIiwic2NvcGVzIjpbXX0.ST4qUSKtZ5qKxdt_s1nPMN7JqLv82ALhotyW7xDgQRJ_uDD7Mbd1df7aEkSY6Jhplq7XyF_CiRmOGQuunWKaaQgXy6qb4APwsgQyYOw81nYtx6Ss42K8jYPNxZ-WsX2CDC80wp_e17R-_9gCz3poi8DPZ8pTj0M2AzUoBFysgNrqEFjPSOZyuJyYTPs_pQWPBOuSPQLu7TtVTARfNrQNXxLIp37L93bel_sW8OrPsaaZYKNbhgTevGUjTIPq_no0KhqKVILuE4wlD1hlJsfgcDfq1zY9xNDlN4A__sK1tSFcvbUw1hRP_TEJQjJ0xmRrUFwnRTtNnJCH7fcwiVSu_ncMh6HDCn0prqyVu210Z5AUkWiGk1D-SCmnNnrBAIKNLk5SESOEtV_dm0bimuz0PBlUY2zmMTE3a5U3tjttnKLrBycb0sUXxUrzbjJmnsMPlZ8gLZowBfOW8kQFxv-V_YXmR7tSY18hQrCAO_COpYu8P-LAUf6c85kNwhDWMseAhdfs4DtnTVLxUW9qayOLUlNBBcXaoPHQCabIYvSf_1cwDSj4nRKTjBKOxhPQ_p6Al-vkxFpwopqzKM8G3mHYGt6I-QPo8lj-Ay3AMU-lrUWv4DM04NzSHgSnm56tRZfbVSG6tr2o8oozWKsUfWCeHTOvKsUecRoX7Dp2UshYyrI';

      var headers = {
        "Content-Type": "application/json",
        "Accept": "application/json",
        "Authorization": "Bearer $token",
      };
      http.Response response = await http.get(
        Uri.parse(uri),
        headers: headers,
      );

      var tagObjsJson = jsonDecode(response.body)['data'] as List;
      List<BusinessLocation.Data> tagObjs = tagObjsJson
          .map((tagJson) => BusinessLocation.Data.fromJson(tagJson))
          .toList();

      List<String> service = <String>[];

      for (var element in tagObjs) {
        service.add(element.name);
      }

      return service;
      // return tagObjs;
    } catch (e) {
      print(e);
      return [];
    }
  }

  static Future<List<ModelProfile>> getSalonSpecialists() async {
    print('getSalonSpecialists');

    try {
      String uri = 'https://pos.crystalshine.net/connector/api/user';
      String token =
          'eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiIsImp0aSI6ImRmYTVmNTQ3YjBmZjQ5ODU0MmRiNTk2YTI5MzdmYzFmZWQ1MzRjMzI5OGYxNjcxYmVjNGQ0OTA2Y2I1MmMxNTEyMjM4YjkxYTY4NzllZDFhIn0.eyJhdWQiOiI1IiwianRpIjoiZGZhNWY1NDdiMGZmNDk4NTQyZGI1OTZhMjkzN2ZjMWZlZDUzNGMzMjk4ZjE2NzFiZWM0ZDQ5MDZjYjUyYzE1MTIyMzhiOTFhNjg3OWVkMWEiLCJpYXQiOjE2Njk4NzQ0OTgsIm5iZiI6MTY2OTg3NDQ5OCwiZXhwIjoxNzAxNDEwNDk4LCJzdWIiOiIxIiwic2NvcGVzIjpbXX0.ST4qUSKtZ5qKxdt_s1nPMN7JqLv82ALhotyW7xDgQRJ_uDD7Mbd1df7aEkSY6Jhplq7XyF_CiRmOGQuunWKaaQgXy6qb4APwsgQyYOw81nYtx6Ss42K8jYPNxZ-WsX2CDC80wp_e17R-_9gCz3poi8DPZ8pTj0M2AzUoBFysgNrqEFjPSOZyuJyYTPs_pQWPBOuSPQLu7TtVTARfNrQNXxLIp37L93bel_sW8OrPsaaZYKNbhgTevGUjTIPq_no0KhqKVILuE4wlD1hlJsfgcDfq1zY9xNDlN4A__sK1tSFcvbUw1hRP_TEJQjJ0xmRrUFwnRTtNnJCH7fcwiVSu_ncMh6HDCn0prqyVu210Z5AUkWiGk1D-SCmnNnrBAIKNLk5SESOEtV_dm0bimuz0PBlUY2zmMTE3a5U3tjttnKLrBycb0sUXxUrzbjJmnsMPlZ8gLZowBfOW8kQFxv-V_YXmR7tSY18hQrCAO_COpYu8P-LAUf6c85kNwhDWMseAhdfs4DtnTVLxUW9qayOLUlNBBcXaoPHQCabIYvSf_1cwDSj4nRKTjBKOxhPQ_p6Al-vkxFpwopqzKM8G3mHYGt6I-QPo8lj-Ay3AMU-lrUWv4DM04NzSHgSnm56tRZfbVSG6tr2o8oozWKsUfWCeHTOvKsUecRoX7Dp2UshYyrI';

      var headers = {
        "Content-Type": "application/json",
        "Accept": "application/json",
        "Authorization": "Bearer $token",
      };
      http.Response response = await http.get(
        Uri.parse(uri),
        headers: headers,
      );

      print(response.statusCode);

      var tagObjsJson = jsonDecode(response.body)['data'] as List;

      // print(tagObjsJson);

      List<SalonSpecialists.Data> tagObjs = tagObjsJson
          .map((tagJson) => SalonSpecialists.Data.fromJson(tagJson))
          .toList();

      print("result start");
      print(tagObjs);
      print("result end");

      List<ModelProfile> modelProfile = [];

      for (var element in tagObjs) {
        ModelProfile profile =
            new ModelProfile(element.firstName, element.fbLink);
        print(element.firstName);
        print(element.fbLink);
        modelProfile.add(profile);
      }

      //return tagObjs;
      return modelProfile;
    } catch (e) {
      print(e);
      return [];
    }
  }

  static Future<List<BusinessLocation.Data>> getBusinessLocation() async {
    try {
      String uri =
          'https://pos.crystalshine.net/connector/api/business-location';
      String token =
          'eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiIsImp0aSI6ImRmYTVmNTQ3YjBmZjQ5ODU0MmRiNTk2YTI5MzdmYzFmZWQ1MzRjMzI5OGYxNjcxYmVjNGQ0OTA2Y2I1MmMxNTEyMjM4YjkxYTY4NzllZDFhIn0.eyJhdWQiOiI1IiwianRpIjoiZGZhNWY1NDdiMGZmNDk4NTQyZGI1OTZhMjkzN2ZjMWZlZDUzNGMzMjk4ZjE2NzFiZWM0ZDQ5MDZjYjUyYzE1MTIyMzhiOTFhNjg3OWVkMWEiLCJpYXQiOjE2Njk4NzQ0OTgsIm5iZiI6MTY2OTg3NDQ5OCwiZXhwIjoxNzAxNDEwNDk4LCJzdWIiOiIxIiwic2NvcGVzIjpbXX0.ST4qUSKtZ5qKxdt_s1nPMN7JqLv82ALhotyW7xDgQRJ_uDD7Mbd1df7aEkSY6Jhplq7XyF_CiRmOGQuunWKaaQgXy6qb4APwsgQyYOw81nYtx6Ss42K8jYPNxZ-WsX2CDC80wp_e17R-_9gCz3poi8DPZ8pTj0M2AzUoBFysgNrqEFjPSOZyuJyYTPs_pQWPBOuSPQLu7TtVTARfNrQNXxLIp37L93bel_sW8OrPsaaZYKNbhgTevGUjTIPq_no0KhqKVILuE4wlD1hlJsfgcDfq1zY9xNDlN4A__sK1tSFcvbUw1hRP_TEJQjJ0xmRrUFwnRTtNnJCH7fcwiVSu_ncMh6HDCn0prqyVu210Z5AUkWiGk1D-SCmnNnrBAIKNLk5SESOEtV_dm0bimuz0PBlUY2zmMTE3a5U3tjttnKLrBycb0sUXxUrzbjJmnsMPlZ8gLZowBfOW8kQFxv-V_YXmR7tSY18hQrCAO_COpYu8P-LAUf6c85kNwhDWMseAhdfs4DtnTVLxUW9qayOLUlNBBcXaoPHQCabIYvSf_1cwDSj4nRKTjBKOxhPQ_p6Al-vkxFpwopqzKM8G3mHYGt6I-QPo8lj-Ay3AMU-lrUWv4DM04NzSHgSnm56tRZfbVSG6tr2o8oozWKsUfWCeHTOvKsUecRoX7Dp2UshYyrI';

      var headers = {
        "Content-Type": "application/json",
        "Accept": "application/json",
        "Authorization": "Bearer $token",
      };
      http.Response response = await http.get(
        Uri.parse(uri),
        headers: headers,
      );

      var tagObjsJson = jsonDecode(response.body)['data'] as List;
      List<BusinessLocation.Data> tagObjs = tagObjsJson
          .map((tagJson) => BusinessLocation.Data.fromJson(tagJson))
          .toList();

      return tagObjs;
    } catch (e) {
      print(e);
      return [];
    }
  }

  static Future<List<ModelCategory>> getBusinessLocationSeeAll() async {
    print("getBusinessLocationSeeAll");
    try {
      String uri =
          'https://pos.crystalshine.net/connector/api/business-location';
      String token =
          'eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiIsImp0aSI6ImRmYTVmNTQ3YjBmZjQ5ODU0MmRiNTk2YTI5MzdmYzFmZWQ1MzRjMzI5OGYxNjcxYmVjNGQ0OTA2Y2I1MmMxNTEyMjM4YjkxYTY4NzllZDFhIn0.eyJhdWQiOiI1IiwianRpIjoiZGZhNWY1NDdiMGZmNDk4NTQyZGI1OTZhMjkzN2ZjMWZlZDUzNGMzMjk4ZjE2NzFiZWM0ZDQ5MDZjYjUyYzE1MTIyMzhiOTFhNjg3OWVkMWEiLCJpYXQiOjE2Njk4NzQ0OTgsIm5iZiI6MTY2OTg3NDQ5OCwiZXhwIjoxNzAxNDEwNDk4LCJzdWIiOiIxIiwic2NvcGVzIjpbXX0.ST4qUSKtZ5qKxdt_s1nPMN7JqLv82ALhotyW7xDgQRJ_uDD7Mbd1df7aEkSY6Jhplq7XyF_CiRmOGQuunWKaaQgXy6qb4APwsgQyYOw81nYtx6Ss42K8jYPNxZ-WsX2CDC80wp_e17R-_9gCz3poi8DPZ8pTj0M2AzUoBFysgNrqEFjPSOZyuJyYTPs_pQWPBOuSPQLu7TtVTARfNrQNXxLIp37L93bel_sW8OrPsaaZYKNbhgTevGUjTIPq_no0KhqKVILuE4wlD1hlJsfgcDfq1zY9xNDlN4A__sK1tSFcvbUw1hRP_TEJQjJ0xmRrUFwnRTtNnJCH7fcwiVSu_ncMh6HDCn0prqyVu210Z5AUkWiGk1D-SCmnNnrBAIKNLk5SESOEtV_dm0bimuz0PBlUY2zmMTE3a5U3tjttnKLrBycb0sUXxUrzbjJmnsMPlZ8gLZowBfOW8kQFxv-V_YXmR7tSY18hQrCAO_COpYu8P-LAUf6c85kNwhDWMseAhdfs4DtnTVLxUW9qayOLUlNBBcXaoPHQCabIYvSf_1cwDSj4nRKTjBKOxhPQ_p6Al-vkxFpwopqzKM8G3mHYGt6I-QPo8lj-Ay3AMU-lrUWv4DM04NzSHgSnm56tRZfbVSG6tr2o8oozWKsUfWCeHTOvKsUecRoX7Dp2UshYyrI';

      var headers = {
        "Content-Type": "application/json",
        "Accept": "application/json",
        "Authorization": "Bearer $token",
      };
      http.Response response = await http.get(
        Uri.parse(uri),
        headers: headers,
      );

      var tagObjsJson = jsonDecode(response.body)['data'] as List;
      List<BusinessLocation.Data> tagObjs = tagObjsJson
          .map((tagJson) => BusinessLocation.Data.fromJson(tagJson))
          .toList();
      List<ModelCategory> modellist = [];
      for (var element in tagObjs) {
        // ModelCategory modelCategory =
        //     new ModelCategory(element.name, "cat1.png");
        ModelCategory modelCategory =
            new ModelCategory(element.name, element.website);
        modellist.add(modelCategory);
      }

      print(modellist.length);
      return modellist;
      //return tagObjs;
    } catch (e) {
      print(e);
      return [];
    }
  }

  static Future<List<Taxoomy.Data>> getTaxonomy() async {
    print('hi');
    try {
      String uri = 'https://pos.crystalshine.net/connector/api/taxonomy';
      String token =
          'eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiIsImp0aSI6ImRmYTVmNTQ3YjBmZjQ5ODU0MmRiNTk2YTI5MzdmYzFmZWQ1MzRjMzI5OGYxNjcxYmVjNGQ0OTA2Y2I1MmMxNTEyMjM4YjkxYTY4NzllZDFhIn0.eyJhdWQiOiI1IiwianRpIjoiZGZhNWY1NDdiMGZmNDk4NTQyZGI1OTZhMjkzN2ZjMWZlZDUzNGMzMjk4ZjE2NzFiZWM0ZDQ5MDZjYjUyYzE1MTIyMzhiOTFhNjg3OWVkMWEiLCJpYXQiOjE2Njk4NzQ0OTgsIm5iZiI6MTY2OTg3NDQ5OCwiZXhwIjoxNzAxNDEwNDk4LCJzdWIiOiIxIiwic2NvcGVzIjpbXX0.ST4qUSKtZ5qKxdt_s1nPMN7JqLv82ALhotyW7xDgQRJ_uDD7Mbd1df7aEkSY6Jhplq7XyF_CiRmOGQuunWKaaQgXy6qb4APwsgQyYOw81nYtx6Ss42K8jYPNxZ-WsX2CDC80wp_e17R-_9gCz3poi8DPZ8pTj0M2AzUoBFysgNrqEFjPSOZyuJyYTPs_pQWPBOuSPQLu7TtVTARfNrQNXxLIp37L93bel_sW8OrPsaaZYKNbhgTevGUjTIPq_no0KhqKVILuE4wlD1hlJsfgcDfq1zY9xNDlN4A__sK1tSFcvbUw1hRP_TEJQjJ0xmRrUFwnRTtNnJCH7fcwiVSu_ncMh6HDCn0prqyVu210Z5AUkWiGk1D-SCmnNnrBAIKNLk5SESOEtV_dm0bimuz0PBlUY2zmMTE3a5U3tjttnKLrBycb0sUXxUrzbjJmnsMPlZ8gLZowBfOW8kQFxv-V_YXmR7tSY18hQrCAO_COpYu8P-LAUf6c85kNwhDWMseAhdfs4DtnTVLxUW9qayOLUlNBBcXaoPHQCabIYvSf_1cwDSj4nRKTjBKOxhPQ_p6Al-vkxFpwopqzKM8G3mHYGt6I-QPo8lj-Ay3AMU-lrUWv4DM04NzSHgSnm56tRZfbVSG6tr2o8oozWKsUfWCeHTOvKsUecRoX7Dp2UshYyrI';

      var headers = {
        "Content-Type": "application/json",
        "Accept": "application/json",
        "Authorization": "Bearer $token",
      };
      http.Response response = await http.get(
        Uri.parse(uri),
        headers: headers,
      );

      var tagObjsJson = jsonDecode(response.body)['data'] as List;
      List<Taxoomy.Data> tagObjs =
          tagObjsJson.map((tagJson) => Taxoomy.Data.fromJson(tagJson)).toList();

      return tagObjs;
    } catch (e) {
      print(e);
      return [];
    }
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

    print(serviceList);
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
