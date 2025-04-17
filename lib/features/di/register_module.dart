import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../core/network/api/network_apis_constants.dart';

/// this class register the third party plugins
@module
abstract class RegisterModule {
  // You can register named preemptive types like follows

  @Named("BaseUrl")
  String get baseUrl => ApiConstants.baseUrl;
  // @lazySingleton
  // FirebaseMessaging firebaseMessaging() => FirebaseMessaging.instance;

  @preResolve
  @singleton
  Future<SharedPreferences> get prefs => SharedPreferences.getInstance();

 @lazySingleton
  FlutterSecureStorage get secureStorage => const FlutterSecureStorage();

  // url here will be injected
  @lazySingleton
  Dio dio(@Named('BaseUrl') String url) => Dio(BaseOptions(baseUrl: url));
  // @preResolve
  // @lazySingleton
  // Future<SessionManager> get sessionManger async => SessionManager();
}
