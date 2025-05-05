import 'package:injectable/injectable.dart';
import '../../../../../core/network/base_handling.dart';
import '../models/request/director_dept_assignment_request_model.dart';
import '../models/response/director_dept_assignment_response_model.dart';
import '../../domain/entities/director_dept_assignment_entity.dart';
import '../../domain/repositories/director_dept_assignment_repository.dart';
import '../../../../shared/entity/base_entity.dart';

 
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
