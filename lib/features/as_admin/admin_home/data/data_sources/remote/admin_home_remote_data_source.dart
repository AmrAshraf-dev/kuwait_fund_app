import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../core/network/api/network_apis_constants.dart';
import '../../../../../../core/network/base_handling.dart';
import '../../../../../../core/network/network_helper.dart';
import '../../../../../../error/failure.dart';
import '../../models/request/admin_home_request_model.dart';
import '../../models/response/admin_home_response_model.dart';

abstract class AdminHomeRemoteDataSource {
  Future<CustomResponseType<AdminHomeResponseModel>> getAdminHome(
      {required AdminHomeRequestModel adminHomeRequestModel});
}

@Injectable(as: AdminHomeRemoteDataSource)
class AdminHomeDataSourceImpl implements AdminHomeRemoteDataSource {
  AdminHomeDataSourceImpl(this.networkHelper);
  final NetworkHelper networkHelper;

  @override
  Future<CustomResponseType<AdminHomeResponseModel>> getAdminHome(
      {required AdminHomeRequestModel adminHomeRequestModel}) async {
    ({dynamic response, bool success}) result = await networkHelper
        .post(path: ApiConstants.profile, data: <String, String>{
      "email": adminHomeRequestModel.email ?? "",
      "lang": adminHomeRequestModel.lang ?? "a"
    });

    if (result.success) {
      return right(AdminHomeResponseModel.fromJson(result.response));
    } else {
      return left(ServerFailure(message: result.response as String));
    }
  }
}
