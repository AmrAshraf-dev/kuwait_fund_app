import 'dart:convert';
import 'dart:typed_data';

import 'package:shared_preferences/shared_preferences.dart';

import '../../di/dependency_init.dart';

class LocalData {
  static final SharedPreferences sharedPreferences = getIt<SharedPreferences>();

  static void clearAllData() {
    sharedPreferences.clear();
    // CustomMainRouter.push(const LoginRoute());
  }

  static void clearAzureToken() {
    sharedPreferences.setString("azureToken", "");
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

  static String? getAzureToken() {
    return sharedPreferences.getString("azureToken");
  }

  static String? getAzureTokenDate() {
    return sharedPreferences.getString("azureTokenDate");
  }

  static bool? getIsDarkMode() {
    return sharedPreferences.getBool("isDarkMode");
  }

  static String? getLangCode() {
    return sharedPreferences.getString("LangCode");
  }

  static String? getMobKey() {
    return sharedPreferences.getString("mobKey");
  }

  static String? getProfilePhoto() {
    return sharedPreferences.getString("profilePhoto");
  }

  static String? getRefreshToken() {
    return sharedPreferences.getString("refreshToken");
  }

  // set and get user email
  static String? getUserEmail() {
    final String? userEmail = sharedPreferences.getString("userEmail");
    return userEmail;
  }

  static Future<void>? setAppAndroidVersion(String androidVersion) async {
    await sharedPreferences.setString("androidVersion", androidVersion);
  }

  static Future<void>? setAppIosVersion(String iosVersion) async {
    await sharedPreferences.setString("iosVersion", iosVersion);
  }

  static void setAzureToken(String token) {
    sharedPreferences.setString("azureToken", token);
  }

  static void setAzureTokenDate(DateTime azureTokenExpireDate) {
    sharedPreferences.setString(
        "azureTokenDate", azureTokenExpireDate.toString());
  }

  static Future<void>? setIsDarkMode(bool isDarkMode) async {
    await sharedPreferences.setBool("isDarkMode", isDarkMode);
  }

  static Future<void>? setLangCode(String langCode) async {
    await sharedPreferences.setString("LangCode", langCode);
  }

  static Future<void>? setMobKey(String mobKey) async {
    await sharedPreferences.setString("mobKey", mobKey);
  }

  static void setProfilePhoto(Uint8List bytes) {
    sharedPreferences.setString("profilePhoto", base64Encode(bytes));
  }

  static void setRefreshToken(String refreshToken) {
    sharedPreferences.setString("refreshToken", refreshToken);
  }

  static Future<void>? setUserEmail(String userEmail) async {
    await sharedPreferences.setString("userEmail", userEmail);
  }

  bool? getBool(String key) {
    return sharedPreferences.getBool(key);
  }

  Future<bool> setBool(String key, bool value) async {
    return sharedPreferences.setBool(key, value);
  }

  getKeys() {
    return sharedPreferences.getKeys();
  }
}
