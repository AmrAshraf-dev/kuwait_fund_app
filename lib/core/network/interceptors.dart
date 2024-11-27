import 'dart:convert';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dart_ping/dart_ping.dart';
import 'package:dio/dio.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../../features/di/dependency_init.dart';
import '../../features/shared/data/local_data.dart';
import '../helper/view_toolbox.dart';
import 'api/network_apis_constants.dart';

///Header management interceptor
class AuthInterceptor extends Interceptor {
  final Dio _dio = getIt<Dio>();
  static const int _maxLineWidth = 90;
  static final _prettyDioLogger = PrettyDioLogger(
    requestHeader: true,
    requestBody: true,
    // responseBody: BuildConfig.instance.environment == Environment.DEVELOPMENT,
    responseHeader: false,
    error: true,
    maxWidth: _maxLineWidth,
  );

  Future<String> getMobKey({required String token}) async {
    try {
      Response result = await _dio.post(
        ApiConstants.profile,
        data: jsonEncode(token),
        options: Options(
          headers: <String, dynamic>{
            "x-api-key": "AEEB6FC5-4B05-4175-B945-BA85180A4650",
          },
        ),
      );

      if (result.statusCode == 200) {
        return result.data['key'];
      } else {
        return "";
      }
    } on DioException catch (e) {
      return "";
    }
  }

  @override
  Future<void> onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    final PingData resultPing = await Ping('google.com', count: 1).stream.first;

    List<ConnectivityResult> result = await Connectivity().checkConnectivity();
    if (err.type == DioExceptionType.connectionTimeout ||
        err.type == DioExceptionType.receiveTimeout) {
      ViewsToolbox.dismissLoading();
      handler.reject(err);
      return;
    } else if (result.first == ConnectivityResult.none) {
      ViewsToolbox.dismissLoading();
      handler.reject(err);
      return;
    } else if (result.first != ConnectivityResult.none &&
        resultPing.response?.ttl == null) {
      ViewsToolbox.dismissLoading();
      handler.reject(err);
      return;
    } else if (err.response?.statusCode == 429) {
      _dio.interceptors.clear();
      _dio.interceptors.addAll(<Interceptor>[
        AuthInterceptor(),
        if (kDebugMode) _prettyDioLogger,
      ]);

      handler.resolve(await _dio.fetch(err.requestOptions));

      return;
    } else if ((err.response == null) ||
        (err.response?.data == "") ||
        err.response?.statusCode == 401) {
      //TODO: use refresh token or generate new login token .
      try {
        ViewsToolbox.dismissLoading();
        handler.reject(err);
        FirebaseCrashlytics.instance.recordError(err, null,
            reason: "Dio Exp \nerr:${err.requestOptions.path}\n");
        return;
      } catch (e) {
        FirebaseCrashlytics.instance.recordError(e, null,
            reason: "Dio Exp \nerr:${err.requestOptions.path}\n");
        ViewsToolbox.dismissLoading();
        return;
      }
    }
    ViewsToolbox.dismissLoading();
    handler.next(err);
  }

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final String? mobKey = LocalData.getMobKey();

    if (mobKey != null) {
      options.headers["mobKey"] = mobKey;
    }
    //  options.headers["Content-Type"] = "application/json";
    options.headers["Accept"] = "application/json";
    options.headers["Content-Type"] = "application/json";
    options.headers["Connection"] = "keep-alive";

    // if (options.headers["x-api-key"] == null) {
    //   options.headers["mobKey"] =
    //       "D9GVHLI49G+ZNuv5ScCE3HKfaasvzX0bR7TAqQzuXeO3hRlZd2+d3KF6o8fiLevyKTk3zHkScdT+3wB1YdByN3kxoxSleSRdEX6fPKTcLiJFhWw36YkoRsCbqFzwkZl4XqS6cZut0ujISvFLixwG4pKkZQOo/Sz9tscKl8RmLKZVgIrtqlR3cH5AHFtro9ik+VYU7HytQQ8Bfvs2x9kD3uQX3JaZjKa+Gk5TzyNmLqxm+zLK5Tu6zWz5jGyJit/Eav+SMqPHR2p+Ayt2zcafo+hQOhgADbgsHfzx62PQeqAr4XxriPIgkqxdUPPi77SyQN0CADCE83M=";
    // }

    handler.next(options);
  }
}



//parsing data
