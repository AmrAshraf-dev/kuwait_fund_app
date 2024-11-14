import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/network/api/network_apis_constants.dart';
import '../../../../../core/network/base_handling.dart';
import '../../../../../core/network/network_helper.dart';
import '../../../../../error/failure.dart';
import '../../models/request/requests_request_model.dart';
import '../../models/response/requests_response_model.dart';

abstract class RequestsRemoteDataSource {
  Future<CustomResponseType<RequestsResponseModel>> getRequests(
      {required RequestsRequestModel requestsRequestModel});
}

@Injectable(as: RequestsRemoteDataSource)
class RequestsDataSourceImpl implements RequestsRemoteDataSource {
  RequestsDataSourceImpl(this.networkHelper);
  final NetworkHelper networkHelper;

  @override
  Future<CustomResponseType<RequestsResponseModel>> getRequests(
      {required RequestsRequestModel requestsRequestModel}) async {
    ({dynamic response, bool success}) result = await networkHelper
        .post(path: ApiConstants.profile, data: <String, String>{
      "email": requestsRequestModel.email ?? "",
      "lang": requestsRequestModel.lang ?? "a"
    });

    if (result.success) {
   
      return right(RequestsResponseModel.fromJson(result.response));
    } else {
      return left(ServerFailure(message: result.response as String));
    }
  }
}
