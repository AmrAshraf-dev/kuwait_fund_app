import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../core/network/api/network_apis_constants.dart';
import '../../../../../../core/network/base_handling.dart';
import '../../../../../../core/network/network_helper.dart';
import '../../../../../../error/failure.dart';
import '../../models/request/submissions_request_model.dart';
import '../../models/response/submissions_response_model.dart';

abstract class SubmissionsRemoteDataSource {
  Future<CustomResponseType<SubmissionsResponseModel>> getSubmissions(
      {required SubmissionsRequestModel submissionsRequestModel});
}

@Injectable(as: SubmissionsRemoteDataSource)
class SubmissionsDataSourceImpl implements SubmissionsRemoteDataSource {
  SubmissionsDataSourceImpl(this.networkHelper);
  final NetworkHelper networkHelper;

  @override
  Future<CustomResponseType<SubmissionsResponseModel>> getSubmissions(
      {required SubmissionsRequestModel submissionsRequestModel}) async {
    ({dynamic response, bool success}) result = await networkHelper
        .get(path: ApiConstants.getSubmissions, queryParams: <String, String>{
      if (submissionsRequestModel.requestTypeID != null)
        "requestTypeID": submissionsRequestModel.requestTypeID ?? "",
      "userName": "TEST33"
    });

    if (result.success) {
      return right(SubmissionsResponseModel.fromJson(result.response));
    } else {
      return left(ServerFailure(message: result.response as String));
    }
  }
}
