import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/network/api/network_apis_constants.dart';
import '../../../../../core/network/base_handling.dart';
import '../../../../../core/network/network_helper.dart';
import '../../../../../error/failure.dart';
import '../../models/request/create_request_request_model.dart';
import '../../models/response/create_request_response_model.dart';

abstract class CreateRequestRemoteDataSource {
  Future<CustomResponseType<CreateRequestResponseModel>> getCreateRequest(
      {required CreateRequestRequestModel createRequestRequestModel});
}

@Injectable(as: CreateRequestRemoteDataSource)
class CreateRequestDataSourceImpl implements CreateRequestRemoteDataSource {
  CreateRequestDataSourceImpl(this.networkHelper);
  final NetworkHelper networkHelper;

  @override
  Future<CustomResponseType<CreateRequestResponseModel>> getCreateRequest(
      {required CreateRequestRequestModel createRequestRequestModel}) async {
    ({dynamic response, bool success}) result = await networkHelper
        .post(path: ApiConstants.profile, data: <String, String>{
      "email": createRequestRequestModel.email ?? "",
      "lang": createRequestRequestModel.lang ?? "a"
    });

    if (result.success) {
   
      return right(CreateRequestResponseModel.fromJson(result.response));
    } else {
      return left(ServerFailure(message: result.response as String));
    }
  }
}
