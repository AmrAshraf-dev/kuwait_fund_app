import "package:kf_ess_mobile_app/features/as_director/director_dept_assignment/data/models/request/director_dept_assignment_request_model.dart";
import "package:kf_ess_mobile_app/features/as_director/director_dept_assignment/domain/entities/director_dept_assignment_entity.dart";

import "../../../../../core/network/base_handling.dart";
import "../../../../shared/entity/base_entity.dart";
 

/// Data operations for the AdminDeptMission collection
abstract class DirectorDeptAssignmentRepository {
  /*
  A repository is a collection of data operations. It is responsible for 
  abstracting the data layer from the business logic layer. 
  */

  Future<CustomResponseType<BaseEntity<DirectorDeptAssignmentEntity>>>
      getTotalMissionByDepartmentDashboard({
    required DirectorDeptAssignmentRequestModel  directorDeptAssignmentRequestModel,
  });
}
