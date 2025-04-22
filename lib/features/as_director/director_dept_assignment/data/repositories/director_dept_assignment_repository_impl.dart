import 'package:injectable/injectable.dart';
import 'package:kf_ess_mobile_app/core/network/base_handling.dart';
import 'package:kf_ess_mobile_app/features/as_director/director_dept_assignment/data/models/request/director_dept_assignment_request_model.dart';
import 'package:kf_ess_mobile_app/features/as_director/director_dept_assignment/data/models/response/director_dept_assignment_response_model.dart';
import 'package:kf_ess_mobile_app/features/as_director/director_dept_assignment/domain/entities/director_dept_assignment_entity.dart';
import 'package:kf_ess_mobile_app/features/as_director/director_dept_assignment/domain/repositories/director_dept_assignment_repository.dart';
import 'package:kf_ess_mobile_app/features/shared/entity/base_entity.dart';

 
 import '../data_sources/remote/director_dept_assignment_remote_data_source.dart';
 

@Injectable(as: DirectorDeptAssignmentRepository)
class DirectorDeptAssignmentRepositoryImp implements DirectorDeptAssignmentRepository {
  DirectorDeptAssignmentRepositoryImp({
    required this.directorDeptAssignmentRemoteDataSource,
  });

  final DirectorDeptAssignmentRemoteDataSource directorDeptAssignmentRemoteDataSource;

 

    @override
  Future<CustomResponseType<BaseEntity<DirectorDeptAssignmentModel>>> getTotalMissionByDepartmentDashboard({required DirectorDeptAssignmentRequestModel directorDeptAssignmentRequestModel}) async {
    return directorDeptAssignmentRemoteDataSource.getTotalMissionByDepartmentDashboard(
      directorDeptAssignmentRequestModel: directorDeptAssignmentRequestModel,
    );
  }

 
}
