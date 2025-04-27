import 'dart:convert';
import 'dart:typed_data';

import 'package:kf_ess_mobile_app/features/auth/data/models/response/auth_response_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../di/dependency_init.dart';

class LocalData {
  static final SharedPreferences sharedPreferences = getIt<SharedPreferences>();

  static void clearAllData() {
    //sharedPreferences.clear();
    // CustomMainRouter.push(const LoginRoute());
clearUserData();
  }

static void clearUserData() {
    sharedPreferences.remove("userInfo");
    sharedPreferences.remove("refreshToken");
  }
  static void clearProfilePhoto() {
    sharedPreferences.setString("profilePhoto", "");
  }

  static String? getAppAndroidVersion() {
    return sharedPreferences.getString("androidVersion");
  }

  static String? getAppIosVersion() {
    return sharedPreferences.getString("iosVersion");
  }

  static bool? getIsDarkMode() {
    return sharedPreferences.getBool("isDarkMode");
  }

  static String? getLangCode() {
    return sharedPreferences.getString("LangCode");
  }

  // static String? getProfilePhoto() {
  //   return sharedPreferences.getString("profilePhoto");
  // }

  // static String? getRefreshToken() {
  //   return sharedPreferences.getString("refreshToken");
  // }

  // set and get user email
  // static String? getUserEmail() {
  //   final String? userEmail = sharedPreferences.getString("userEmail");
  //   return userEmail;
  // }

  static Future<void>? setAppAndroidVersion(String androidVersion) async {
    await sharedPreferences.setString("androidVersion", androidVersion);
  }

  static Future<void>? setAppIosVersion(String iosVersion) async {
    await sharedPreferences.setString("iosVersion", iosVersion);
  }

  static Future<void>? setIsDarkMode(bool isDarkMode) async {
    await sharedPreferences.setBool("isDarkMode", isDarkMode);
  }

  static Future<void>? setLangCode(String langCode) async {
    await sharedPreferences.setString("LangCode", langCode);
  }

  // static void setProfilePhoto(Uint8List bytes) {
  //   sharedPreferences.setString("profilePhoto", base64Encode(bytes));
  // }

  // static void setRefreshToken(String refreshToken) {
  //   sharedPreferences.setString("refreshToken", refreshToken);
  // }

  // static Future<void>? setUserEmail(String userEmail) async {
  //   await sharedPreferences.setString("userEmail", userEmail);
  // }

  bool? getBool(String key) {
    return sharedPreferences.getBool(key);
  }

  static Future<bool> setBool(String key, bool value) async {
    return sharedPreferences.setBool(key, value);
  }

  static getKeys() {
    return sharedPreferences.getKeys();
  }

  void saveUser(AuthModel? data) {
    if (data != null) {
      sharedPreferences.setString("userInfo", jsonEncode(data));
    }
  }

  static AuthModel? getUser() {
    final String? userInfo = sharedPreferences.getString("userInfo");

    if (userInfo != null) {
      return AuthModel.fromJson(jsonDecode(userInfo));
    }
    return null;
  }

  static clearAuthTokens() {
    sharedPreferences.remove("userInfo");
    sharedPreferences.remove("refreshToken");
  }

  static void setSmartLogin(bool bool) {
    sharedPreferences.setBool("smartLoginToggle", bool);
  }

  static bool getSmartLogin() {
    return sharedPreferences.getBool("smartLoginToggle") ?? true;
  }
}
