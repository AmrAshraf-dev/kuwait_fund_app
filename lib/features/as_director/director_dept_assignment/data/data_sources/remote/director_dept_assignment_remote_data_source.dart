import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:kf_ess_mobile_app/features/as_director/director_dept_assignment/data/models/request/director_dept_assignment_request_model.dart';
import 'package:kf_ess_mobile_app/features/as_director/director_dept_assignment/data/models/response/director_dept_assignment_response_model.dart';
import 'package:kf_ess_mobile_app/features/shared/entity/base_entity.dart';

import '../../../../../../core/network/api/network_apis_constants.dart';
import '../../../../../../core/network/base_handling.dart';
import '../../../../../../core/network/network_helper.dart';
import '../../../../../../error/failure.dart';
 

abstract class DirectorDeptAssignmentRemoteDataSource {
  Future<CustomResponseType<BaseEntity<DirectorDeptAssignmentModel>>> getTotalMissionByDepartmentDashboard({required DirectorDeptAssignmentRequestModel directorDeptAssignmentRequestModel}); 
 
}

@Injectable(as: DirectorDeptAssignmentRemoteDataSource)
class DirectorDeptAssignmentDataSourceImpl
    implements DirectorDeptAssignmentRemoteDataSource {
  DirectorDeptAssignmentDataSourceImpl(this.networkHelper);
  final NetworkHelper networkHelper;
  
   
      @override
  Future<CustomResponseType<DirectorDeptAssignmentResponseModel>>
      getTotalMissionByDepartmentDashboard( {required DirectorDeptAssignmentRequestModel directorDeptAssignmentRequestModel}
         ) async {
    ({dynamic response, bool success}) result = await networkHelper
        .get(path: ApiConstants.getTotalMissionByDepartmentDashboard, queryParams: directorDeptAssignmentRequestModel.toJson());

    if (result.success) {
      return right(DirectorDeptAssignmentResponseModel.fromJson(result.response));
    } else {
      return left(ServerFailure(message: result.response as String));
    }
  }

    }
