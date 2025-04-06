import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/network/api/network_apis_constants.dart';
import '../../../../../core/network/base_handling.dart';
import '../../../../../core/network/network_helper.dart';
import '../../../../../error/failure.dart';
import '../../models/request/auth_request_model.dart';
import '../../models/response/auth_response_model.dart';

abstract class AuthRemoteDataSource {
  Future<CustomResponseType<AuthResponseModel>> getAuth(
      {required AuthRequestModel authRequestModel});
}

@Injectable(as: AuthRemoteDataSource)
class AuthDataSourceImpl implements AuthRemoteDataSource {
  AuthDataSourceImpl(this.networkHelper);
  final NetworkHelper networkHelper;

  @override
  Future<CustomResponseType<AuthResponseModel>> getAuth(
      {required AuthRequestModel authRequestModel}) async {
    ({dynamic response, bool success}) result = await networkHelper.post(
        path: ApiConstants.auth, data : authRequestModel.toJson());

    if (result.success) {
      return right(AuthResponseModel.fromJson(result.response));
    } else {
      return left(ServerFailure(message: result.response as String));
    }
  }
}
