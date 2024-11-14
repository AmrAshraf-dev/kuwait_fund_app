import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/network/api/network_apis_constants.dart';
import '../../../../../core/network/base_handling.dart';
import '../../../../../core/network/network_helper.dart';
import '../../../../../error/failure.dart';
import '../../models/request/notifications_request_model.dart';
import '../../models/response/notifications_response_model.dart';

abstract class NotificationsRemoteDataSource {
  Future<CustomResponseType<NotificationsResponseModel>> getNotifications(
      {required NotificationsRequestModel notificationsRequestModel});
}

@Injectable(as: NotificationsRemoteDataSource)
class NotificationsDataSourceImpl implements NotificationsRemoteDataSource {
  NotificationsDataSourceImpl(this.networkHelper);
  final NetworkHelper networkHelper;

  @override
  Future<CustomResponseType<NotificationsResponseModel>> getNotifications(
      {required NotificationsRequestModel notificationsRequestModel}) async {
    ({dynamic response, bool success}) result = await networkHelper
        .post(path: ApiConstants.profile, data: <String, String>{
      "email": notificationsRequestModel.email ?? "",
      "lang": notificationsRequestModel.lang ?? "a"
    });

    if (result.success) {
   
      return right(NotificationsResponseModel.fromJson(result.response));
    } else {
      return left(ServerFailure(message: result.response as String));
    }
  }
}
