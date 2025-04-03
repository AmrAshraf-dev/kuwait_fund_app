import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:kf_ess_mobile_app/features/requests/data/models/response/request_type_response_model.dart';

import '../../../../../core/network/api/network_apis_constants.dart';
import '../../../../../core/network/base_handling.dart';
import '../../../../../core/network/network_helper.dart';
import '../../../../../error/failure.dart';
import '../../models/request/requests_request_model.dart';
import '../../models/response/requests_response_model.dart';

abstract class RequestsRemoteDataSource {
  Future<CustomResponseType<RequestsResponseModel>> getRequests(
      {required RequestsRequestModel requestsRequestModel});
   Future<CustomResponseType<RequestTypeResponseModel>> getRequestTypes();
}

@Injectable(as: RequestsRemoteDataSource)
class RequestsDataSourceImpl implements RequestsRemoteDataSource {
  RequestsDataSourceImpl(this.networkHelper);
  final NetworkHelper networkHelper;

  @override
  Future<CustomResponseType<RequestsResponseModel>> getRequests(
      {required RequestsRequestModel requestsRequestModel}) async {
    ({dynamic response, bool success}) result = await networkHelper
        .get(path: ApiConstants.getUserRequests, queryParams: <String, String>{
      if (requestsRequestModel.requestTypeID == null)
        "requestTypeID": "0"// Get all requests
      else
        "requestTypeID": requestsRequestModel.requestTypeID!,
    });

    if (result.success) {
      return right(RequestsResponseModel.fromJson(result.response));
    } else {
      return left(ServerFailure(message: result.response as String));
    }
  }

  @override
  Future<Either<Failure, RequestTypeResponseModel>> getRequestTypes() async {
    ({dynamic response, bool success}) result = await networkHelper.get(
      path: ApiConstants.getRequestTypes,
    );

    if (result.success) {
  
      return right(RequestTypeResponseModel.fromJson(result.response));
    } else {
      return left(ServerFailure(message: result.response as String));
    }
  }
}
