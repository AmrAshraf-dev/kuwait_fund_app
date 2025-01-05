import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dart_ping/dart_ping.dart';
import 'package:dio/dio.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:kf_ess_mobile_app/core/helper/view_toolbox.dart';
import 'package:kf_ess_mobile_app/core/routes/route_sevices.dart';
import 'package:kf_ess_mobile_app/core/routes/routes.gr.dart';
import 'package:kf_ess_mobile_app/features/di/dependency_init.dart';
import 'package:kf_ess_mobile_app/features/shared/data/local_data.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class AuthInterceptor extends Interceptor {
  final Dio _dio = getIt<Dio>();

  static const int _maxLineWidth = 90;
  static final _prettyDioLogger = PrettyDioLogger(
    requestHeader: true,
    requestBody: true,
    responseHeader: false,
    error: true,
    maxWidth: _maxLineWidth,
  );

  AuthInterceptor() {
    _dio.interceptors.addAll([
      this,
      if (kDebugMode) _prettyDioLogger,
    ]);
  }

  @override
  Future<void> onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    try {
      // Check connectivity
      if (await _isNetworkUnavailable(err)) {
        ViewsToolbox.dismissLoading();
        handler.reject(err);
        return;
      }
      if (err.type == DioExceptionType.unknown) {
        ViewsToolbox.dismissLoading();
        handler.reject(err);
        return;
      }

      // Handle 429 (Too Many Requests)
      if (err.response?.statusCode == 429) {
        handler.resolve(await _retryRequest(err));
        return;
      }

      // Handle 401 (Unauthorized)
      if (err.response?.statusCode == 401) {
        bool refreshTokenResult = await _handleRefreshToken(err);

        if (refreshTokenResult) {
          handler.resolve(await _retryRequest(err));
          return;
        } else {
          ViewsToolbox.dismissLoading();
          FirebaseCrashlytics.instance.recordError(err, null,
              reason:
                  "Refresh Token Failed for Request: ${err.requestOptions.path}");
          LocalData.clearAuthTokens();
          ViewsToolbox.loginShowDialog(
            title: "session_expired",
            message: "session_expired_message",
            onConfirm: () {
              CustomMainRouter.push(AuthRoute());
            },
          );
          return;
        }
      }

      // Log other errors
      ViewsToolbox.dismissLoading();
      FirebaseCrashlytics.instance.recordError(err, null,
          reason: "Dio Error: ${err.requestOptions.path}");
      handler.next(err);
    } catch (e) {
      FirebaseCrashlytics.instance.recordError(e, null,
          reason:
              "Unhandled Error in Dio Interceptor: ${err.requestOptions.path}");
      ViewsToolbox.dismissLoading();
      handler.next(err);
    }
  }

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers.addAll({
      //   "Accept-Language": LocalData.getLangCode() == "ar" ? "ar-KW" : "en-US",
      //   "Location": Platform.isAndroid ? "CustomerAndroidApp" : "CustomerIOSApp",
      // "DeviceIdentifier": FirebaseMessagingService().token ?? "",
      // "SessionIdentifier": DeviceService().getDeviceId(),
      // "Accept": "application/json",
      // "Content-Type": "application/json",
      // "Connection": "keep-alive",
      "Authorization": "Bearer ${LocalData.getUser()?.tokenInfo.token}",
    });
    handler.next(options);
  }

  Future<bool> _isNetworkUnavailable(DioException err) async {
    final connectivityResult = await Connectivity().checkConnectivity();
    final pingResult = await Ping('google.com', count: 1).stream.first;

    return err.type == DioExceptionType.connectionTimeout ||
        err.type == DioExceptionType.receiveTimeout ||
        connectivityResult == ConnectivityResult.none ||
        pingResult.response?.ttl == null;
  }

  Future<bool> _handleRefreshToken(DioException err) async {
    return false;
    // try {
    //   Dio dio = Dio();

    //   dio.options.headers['Content-Type'] = 'application/json';
    //   dio.options.headers['Accept'] = 'application/json';
    //   dio.options.headers['Connection'] = 'keep-alive';
    //   dio.options.headers['Accept-Language'] =
    //       LocalData.getLangCode() == "ar" ? "ar-KW" : "en-US";
    //   dio.options.headers['Location'] =
    //       Platform.isAndroid ? "CustomerAndroidApp" : "CustomerIOSApp";
    //   dio.options.headers['DeviceIdentifier'] =
    //       FirebaseMessagingService().token ?? "";
    //   dio.options.headers['SessionIdentifier'] = DeviceService().getDeviceId();

    //   final response = await dio.post(
    //     "https://mpwpayment.diyarme.com/SplittcustomerAPI/api/Auth/GetRefreshToken",
    //     data: {
    //       "token": LocalData.getAuthTokens()?.token,
    //       "refreshToken": LocalData.getAuthTokens()?.refreshToken,
    //     },
    //   );

    //   if (response.statusCode == 200 && response.data != null) {
    //     // Update local token storage
    //     LocalData.setAuthTokens(response.data);
    //     return true;
    //   }
    // } catch (e) {
    //   FirebaseCrashlytics.instance.recordError(e, null,
    //       reason:
    //           "Refresh Token Failed for Request: ${err.requestOptions.path}");
    // }
    // return false;
  }

  Future<Response> _retryRequest(DioException err) async {
    final newRequestOptions = err.requestOptions;
    return await _dio.fetch(newRequestOptions);
  }
}
