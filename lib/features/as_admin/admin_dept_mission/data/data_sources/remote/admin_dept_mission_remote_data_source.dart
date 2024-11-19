import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../core/network/api/network_apis_constants.dart';
import '../../../../../../core/network/base_handling.dart';
import '../../../../../../core/network/network_helper.dart';
import '../../../../../../error/failure.dart';
import '../../models/request/admin_dept_mission_request_model.dart';
import '../../models/response/admin_dept_mission_response_model.dart';

abstract class AdminDeptMissionRemoteDataSource {
  Future<CustomResponseType<AdminDeptMissionResponseModel>> getAdminDeptMission(
      {required AdminDeptMissionRequestModel adminDeptMissionRequestModel});
}

@Injectable(as: AdminDeptMissionRemoteDataSource)
class AdminDeptMissionDataSourceImpl
    implements AdminDeptMissionRemoteDataSource {
  AdminDeptMissionDataSourceImpl(this.networkHelper);
  final NetworkHelper networkHelper;

  @override
  Future<CustomResponseType<AdminDeptMissionResponseModel>> getAdminDeptMission(
      {required AdminDeptMissionRequestModel
          adminDeptMissionRequestModel}) async {
    ({dynamic response, bool success}) result = await networkHelper
        .post(path: ApiConstants.profile, data: <String, String>{
      "email": adminDeptMissionRequestModel.email ?? "",
      "lang": adminDeptMissionRequestModel.lang ?? "a"
    });

    if (result.success) {
      return right(AdminDeptMissionResponseModel.fromJson(result.response));
    } else {
      return left(ServerFailure(message: result.response as String));
    }
  }
}
