import "../../../../../core/network/base_handling.dart";
import "../../../../shared/entity/base_entity.dart";
import "../../data/models/request/admin_dept_mission_request_model.dart";
import "../entities/admin_dept_mission_entity.dart";

/// Data operations for the AdminDeptMission collection
abstract class AdminDeptMissionRepository {
  /*
  A repository is a collection of data operations. It is responsible for 
  abstracting the data layer from the business logic layer. 
  */

  Future<CustomResponseType<BaseEntity<AdminDeptMissionEntity>>>
      getAdminDeptMission({
    required AdminDeptMissionRequestModel adminDeptMissionParams,
  });
}
