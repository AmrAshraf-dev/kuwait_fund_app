import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/network/api/network_apis_constants.dart';
import '../../../../../core/network/base_handling.dart';
import '../../../../../core/network/network_helper.dart';
import '../../../../../error/failure.dart';
import '../../models/request/visitors_logs_request_model.dart';
import '../../models/response/visitors_logs_response_model.dart';

abstract class VisitorsLogsRemoteDataSource {
  Future<CustomResponseType<VisitorsLogsResponseModel>> getVisitorsLogs(
      {required VisitorsLogsRequestModel visitorsLogsRequestModel});
}

@Injectable(as: VisitorsLogsRemoteDataSource)
class VisitorsLogsDataSourceImpl implements VisitorsLogsRemoteDataSource {
  VisitorsLogsDataSourceImpl(this.networkHelper);
  final NetworkHelper networkHelper;

  @override
  Future<CustomResponseType<VisitorsLogsResponseModel>> getVisitorsLogs(
      {required VisitorsLogsRequestModel visitorsLogsRequestModel}) async {
    ({dynamic response, bool success}) result = await networkHelper
        .post(path: ApiConstants.profile, data: <String, String>{
      "email": visitorsLogsRequestModel.email ?? "",
      "lang": visitorsLogsRequestModel.lang ?? "a"
    });

    if (result.success) {
   
      return right(VisitorsLogsResponseModel.fromJson(result.response));
    } else {
      return left(ServerFailure(message: result.response as String));
    }
  }
}
