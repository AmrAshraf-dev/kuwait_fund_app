import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../director_dept_mission/data/models/request/director_dept_mission_details_request_model.dart';
import '../../../../director_dept_mission/data/models/response/director_dept_mission_details_reponse_model.dart';
import '../../models/request/director_mission_details_request_model.dart';
import '../../models/request/management_calender_data_request_model.dart';
import '../../models/response/director_mission_details_reponse_model.dart';
import '../../models/response/management_calender_data_response_model.dart';

import '../../../../../../core/network/api/network_apis_constants.dart';
import '../../../../../../core/network/base_handling.dart';
import '../../../../../../core/network/network_helper.dart';
import '../../../../../../error/failure.dart';
 import '../../models/response/directors_response_model.dart';

abstract class AdminHomeRemoteDataSource {
getDirectorsList();

    Future<CustomResponseType<ManagementCalenderDataResponseModel>>  getManagementCalenderData(ManagementCalenderDataRequestModel managementCalenderDataRequestModel);

  Future<CustomResponseType<DirectorMissionDetailsResponseModel>>  getDirectorMissionsDetails(DirectorMissionDetailsRequestModel directorMissionDetailsRequestModel);

 Future<CustomResponseType<DirectorDeptMissionDetailsResponseModel>>    getDirectorDeptMissionsDetails(DirectorDeptMissionDetailsRequestModel directorDeptMissionDetailsRequestModel) ;
}

@Injectable(as: AdminHomeRemoteDataSource)
class AdminHomeDataSourceImpl implements AdminHomeRemoteDataSource {
  AdminHomeDataSourceImpl(this.networkHelper);
  final NetworkHelper networkHelper;

  @override
  Future<CustomResponseType<DirectorsResponseModel>> getDirectorsList(
      ) async {
    ({dynamic response, bool success}) result = await networkHelper
        .get(path: ApiConstants.getAllManagement);

    if (result.success) {
      return right(DirectorsResponseModel.fromJson(result.response));
    } else {
      return left(ServerFailure(message: result.response as String));
    }
  }
  
  @override
  getManagementCalenderData(ManagementCalenderDataRequestModel managementCalenderDataRequestModel) async {
    ({dynamic response, bool success}) result = await networkHelper
        .get(path: ApiConstants.getManagementCalenderData, queryParams: managementCalenderDataRequestModel.toJson());

    if (result.success) {
      return right(ManagementCalenderDataResponseModel.fromJson(result.response));
    } else {
      return left(ServerFailure(message: result.response as String));
    }
  }
  
  @override
  getDirectorMissionsDetails(DirectorMissionDetailsRequestModel directorMissionDetailsRequestModel) async {
    ({dynamic response, bool success}) result = await networkHelper
        .get(path: ApiConstants.getDirectorMissionsDetails, queryParams: directorMissionDetailsRequestModel.toJson());

    if (result.success) {
      return right( DirectorMissionDetailsResponseModel.fromJson(result.response));
    } else {
      return left(ServerFailure(message: result.response as String));
    }
  }
  
  @override
  Future<CustomResponseType<DirectorDeptMissionDetailsResponseModel>> getDirectorDeptMissionsDetails(DirectorDeptMissionDetailsRequestModel directorDeptMissionDetailsRequestModel)  async {
    ({dynamic response, bool success}) result = await networkHelper
        .get(path: ApiConstants.getDirectorDeptMissionsDetails, queryParams: directorDeptMissionDetailsRequestModel.toJson());

    if (result.success) {
      return right(DirectorDeptMissionDetailsResponseModel.fromJson(result.response));
    } else {
      return left(ServerFailure(message: result.response as String));
    }
  }
}
