import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dart_ping/dart_ping.dart';
import 'package:dio/dio.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import '../helper/view_toolbox.dart';
import '../routes/route_sevices.dart';
import '../routes/routes.gr.dart';
import '../services/device_service.dart';
import '../../features/auth/data/models/request/auth_request_model.dart';
import '../../features/auth/presentation/cubits/auth_cubit.dart';
import '../../features/di/dependency_init.dart';
import '../../features/firebase/firebase_service.dart';
import '../../features/shared/data/local_data.dart';
import '../../features/shared/data/secured_storage_data.dart';

 
class AuthInterceptor extends Interceptor {
    final SecuredStorageData securedStorageData = getIt<SecuredStorageData>();
Dio dio;
  AuthInterceptor(this. dio);





  @override
  Future<void> onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    try {
      // Check connectivity
      // if (await _isNetworkUnavailable(err)) {
      //   ViewsToolbox.dismissLoading();
      //   handler.reject(err);
      //   return;
      // }
      if (err.type == DioExceptionType.unknown) {
        ViewsToolbox.dismissLoading();
        handler.reject(err);
        return;
      }

      // Handle 429 (Too Many Requests)
      if (err.response?.statusCode == 429) {
        handler.resolve(await _retryRequest(err, dio));
        return;
      }

      // Handle 401 (Unauthorized)
      if (err.response?.statusCode == 401) {

        bool isTokenRefreshed = await  _reLogin();
       // bool refreshTokenResult = await _handleRefreshToken(err);

        if (isTokenRefreshed) {
          handler.resolve(await _retryRequest(err, dio));
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
      "Accept-Language": LocalData.getLangCode() == "ar" ? "ar-KW" : "en-US",
      "Location": Platform.isAndroid ? "AndroidApp" : "IOSApp",
      "DeviceIdentifier": DeviceService().getDeviceId() ,
      "SessionIdentifier": FirebaseMessagingService().token ?? "",
      "Accept": "application/json",
      "Content-Type": "application/json",
      "Connection": "keep-alive",
      if (LocalData.getUser()?.tokenInfo.token != null)
        "Authorization": "Bearer ${LocalData.getUser()?.tokenInfo.token}",
    });
    handler.next(options);
  }

  Future<bool> _isNetworkUnavailable(DioException err) async {
    final connectivityResult = await Connectivity().checkConnectivity();

    // Consider no connection if connectivity is 'none'
    if (connectivityResult.first == ConnectivityResult.none) {
      return true;
    }

    // Check if ping to a reliable host fails
    bool pingFailed = false;
    try {
      final ping = Ping('www.google.com', count: 1);
      final pingData = await ping.stream.first;
      if (pingData.response == null || pingData.response!.ttl == null) {
        pingFailed = true;
      }
    } catch (_) {
      pingFailed = true;
    }

    // Consider network unavailable if any of these are true
    return err.type == DioExceptionType.connectionTimeout ||
        err.type == DioExceptionType.receiveTimeout ||
        pingFailed;
  }



      Future<bool> _reLogin() async {
          final AuthCubit authCubit = getIt<AuthCubit>();

    // Retrieve saved credentials from local storage
        String? savedUserName = await securedStorageData.getUsername();
        String? savedPassword = await securedStorageData.getPassword();

      if (savedUserName != null && savedPassword != null) {
         bool result = await   authCubit.getAuth(
            authModel: AuthRequestModel(
              userId: savedUserName,
              password: savedPassword,
            ),
          );
         return result;

}
else {
        return false;
      }
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

  Future<Response> _retryRequest(DioException err , Dio dio) async {
    final newRequestOptions = err.requestOptions;
    return await  dio.fetch(newRequestOptions);
  }
}
