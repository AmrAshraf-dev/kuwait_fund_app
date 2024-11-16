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
        .post(path: ApiConstants.profile, data: <String, String>{
      "email": submissionsRequestModel.email ?? "",
      "lang": submissionsRequestModel.lang ?? "a"
    });

    if (result.success) {
      return right(SubmissionsResponseModel.fromJson(result.response));
    } else {
      return left(ServerFailure(message: result.response as String));
    }
  }
}
