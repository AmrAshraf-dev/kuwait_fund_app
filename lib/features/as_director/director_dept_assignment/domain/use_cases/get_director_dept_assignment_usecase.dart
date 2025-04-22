 

import 'package:injectable/injectable.dart';

import '../../../../../core/domain/usecase/base_usecase.dart';
import '../../../../../core/network/base_handling.dart';
import '../../../../shared/entity/base_entity.dart';
import '../../data/models/request/director_dept_assignment_request_model.dart';
import '../entities/director_dept_assignment_entity.dart';
import '../repositories/director_dept_assignment_repository.dart';

@injectable
class GetDirectorDeptAssignmentUsecase
    implements
        UseCase<BaseEntity<DirectorDeptAssignmentEntity>,
            DirectorDeptAssignmentRequestModel> {
  GetDirectorDeptAssignmentUsecase({required this.directorDeptAssignmentRepository});

  final DirectorDeptAssignmentRepository  directorDeptAssignmentRepository;

  @override
  Future<CustomResponseType<BaseEntity<DirectorDeptAssignmentEntity>>> call(
    DirectorDeptAssignmentRequestModel params,
  ) {
    return directorDeptAssignmentRepository.getTotalMissionByDepartmentDashboard(
        directorDeptAssignmentRequestModel: params);
  }
}
