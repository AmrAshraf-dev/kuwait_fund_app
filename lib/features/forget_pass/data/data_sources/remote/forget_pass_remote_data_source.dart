import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/network/api/network_apis_constants.dart';
import '../../../../../core/network/base_handling.dart';
import '../../../../../core/network/network_helper.dart';
import '../../../../../error/failure.dart';
import '../../models/request/forget_pass_request_model.dart';
import '../../models/response/forget_pass_response_model.dart';

abstract class ForgetPassRemoteDataSource {
  Future<CustomResponseType<ForgetPassResponseModel>> getForgetPass(
      {required ForgetPassRequestModel forgetPassRequestModel});

  Future<CustomResponseType<ForgetPassResponseModel>> verifyOtp(
      {required ForgetPassRequestModel forgetPassRequestModel});

  Future<CustomResponseType<ForgetPassResponseModel>> changePassword(
      {required ForgetPassRequestModel forgetPassRequestModel});
}

@Injectable(as: ForgetPassRemoteDataSource)
class ForgetPassDataSourceImpl implements ForgetPassRemoteDataSource {
  ForgetPassDataSourceImpl(this.networkHelper);
  final NetworkHelper networkHelper;

  @override
  Future<CustomResponseType<ForgetPassResponseModel>> getForgetPass(
      {required ForgetPassRequestModel forgetPassRequestModel}) async {
    ({dynamic response, bool success}) result = await networkHelper.get(
      path: ApiConstants.generateOTP,
      queryParams: forgetPassRequestModel.toJson(),
    );

    if (result.success) {
      return right(ForgetPassResponseModel.fromJson(result.response));
    } else {
      return left(ServerFailure(message: result.response as String));
    }
  }

  @override
  Future<CustomResponseType<ForgetPassResponseModel>> verifyOtp(
      {required ForgetPassRequestModel forgetPassRequestModel}) async {
    ({dynamic response, bool success}) result = await networkHelper.get(
      path: ApiConstants.verifyOTP,
      queryParams: forgetPassRequestModel.toJson(),
    );

    if (result.success) {
      return right(ForgetPassResponseModel.fromJson(result.response));
    } else {
      return left(ServerFailure(message: result.response as String));
    }
  }

  @override
  Future<CustomResponseType<ForgetPassResponseModel>> changePassword(
      {required ForgetPassRequestModel forgetPassRequestModel}) async {
    ({dynamic response, bool success}) result = await networkHelper.get(
      path: ApiConstants.changePassword,
      queryParams: forgetPassRequestModel.toJson(),
    );

    if (result.success) {
      return right(ForgetPassResponseModel(data: result.response["data"]=="true"));
    } else {
      return left(ServerFailure(message: result.response as String));
    }
  }
}
