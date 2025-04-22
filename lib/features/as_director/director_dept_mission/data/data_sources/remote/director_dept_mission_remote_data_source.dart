import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:kf_ess_mobile_app/features/as_director/director_dept_mission/data/models/request/dept_calendar_data_request_model.dart';
import 'package:kf_ess_mobile_app/features/as_director/director_dept_mission/data/models/response/dept_calendar_data_response_model.dart';

import '../../../../../../core/network/api/network_apis_constants.dart';
import '../../../../../../core/network/base_handling.dart';
import '../../../../../../core/network/network_helper.dart';
import '../../../../../../error/failure.dart';
import '../../models/response/dept_response_model.dart';

abstract class DirectorDeptMissionRemoteDataSource {
  Future<CustomResponseType<DeptResponseModel>>
      getAllDepts(
            );
 
  Future<CustomResponseType<DeptCalendarDataResponseModel>> getDeptCalenderData({required DeptCalenderDataRequestModel deptCalenderDataRequestModel}) ;
}

@Injectable(as: DirectorDeptMissionRemoteDataSource)
class DirectorDeptMissionDataSourceImpl
    implements DirectorDeptMissionRemoteDataSource {
  DirectorDeptMissionDataSourceImpl(this.networkHelper);
  final NetworkHelper networkHelper;

  @override
  Future<CustomResponseType<DeptResponseModel>>
      getAllDepts(
         ) async {
    ({dynamic response, bool success}) result = await networkHelper
        .get(path: ApiConstants.readDepartments, );

    if (result.success) {
      return right(DeptResponseModel.fromJson(result.response));
    } else {
      return left(ServerFailure(message: result.response as String));
    }
  }



    @override
  Future<CustomResponseType<DeptCalendarDataResponseModel>>
      getDeptCalenderData( {required DeptCalenderDataRequestModel deptCalenderDataRequestModel}
         ) async {
    ({dynamic response, bool success}) result = await networkHelper
        .get(path: ApiConstants.getDeptCalenderData, queryParams: deptCalenderDataRequestModel.toJson());

    if (result.success) {
      return right(DeptCalendarDataResponseModel.fromJson(result.response));
    } else {
      return left(ServerFailure(message: result.response as String));
    }
  }
  
}
