import 'package:get_storage/get_storage.dart';

String keyNightMode = "keyIsNightMode";
String keyIntroAvailable = "keyIsIntroAvailable";
String keyLoggedIn = "keyIsLoggedIn";
String keyDialog = "keyIsDialog";

void setData(String key, dynamic value) => GetStorage().write(key, value);

int? getInt(String key) => GetStorage().read(key);

String? getString(String key) => GetStorage().read(key);

bool? getBool(String key) => GetStorage().read(key);

double? getDouble(String key) => GetStorage().read(key);

dynamic getData(String key) => GetStorage().read(key);

void clearData() async => GetStorage().erase();

void changeTheme(bool val) => setData(keyNightMode, val);

void changeIntroVal(bool val) => setData(keyIntroAvailable, val);

void setLoggedIn(bool val) => setData(keyLoggedIn, val);

void setDialog(bool val) => setData(keyDialog, val);

bool get isDark => getBool(keyNightMode) ?? false;

bool get isIntroAvailable => getBool(keyIntroAvailable) ?? true;

bool get isLoggedIn => getBool(keyLoggedIn) ?? false;

bool get isDialog => getBool(keyDialog) ?? false;

