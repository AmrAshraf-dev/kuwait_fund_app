import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/network/api/network_apis_constants.dart';
import '../../../../../core/network/base_handling.dart';
import '../../../../../core/network/network_helper.dart';
import '../../../../../error/failure.dart';
import '../../models/request/account_request_model.dart';
import '../../models/response/account_response_model.dart';

abstract class AccountRemoteDataSource {
  Future<CustomResponseType<AccountResponseModel>> getAccount(
      {required AccountRequestModel accountRequestModel});
}

@Injectable(as: AccountRemoteDataSource)
class AccountDataSourceImpl implements AccountRemoteDataSource {
  AccountDataSourceImpl(this.networkHelper);
  final NetworkHelper networkHelper;

  @override
  Future<CustomResponseType<AccountResponseModel>> getAccount(
      {required AccountRequestModel accountRequestModel}) async {
    ({dynamic response, bool success}) result = await networkHelper
        .post(path: ApiConstants.profile, data: <String, String>{
      "email": accountRequestModel.email ?? "",
      "lang": accountRequestModel.lang ?? "a"
    });

    if (result.success) {
   
      return right(AccountResponseModel.fromJson(result.response));
    } else {
      return left(ServerFailure(message: result.response as String));
    }
  }
}
