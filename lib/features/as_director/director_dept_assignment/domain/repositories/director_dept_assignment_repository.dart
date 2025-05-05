import "../../data/models/request/director_dept_assignment_request_model.dart";
import "../entities/director_dept_assignment_entity.dart";

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
