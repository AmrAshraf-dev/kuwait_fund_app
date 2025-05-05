import "../../data/models/request/dept_calendar_data_request_model.dart";

import "../entities/director_dept_calendar_data_entity.dart";

import "../../../../../core/network/base_handling.dart";
import "../../../../shared/entity/base_entity.dart";
 import "../entities/director_dept_mission_entity.dart";

/// Data operations for the AdminDirectorMission collection
abstract class DirectorDeptMissionRepository {
  /*
  A repository is a collection of data operations. It is responsible for 
  abstracting the data layer from the business logic layer. 
  */

  Future<CustomResponseType<BaseEntity<List<DeptEntity>>>>
      getAllDepts();

  Future<CustomResponseType<BaseEntity<List<DirectorDeptCalendarDataEntity>>>> getDeptCalenderData({required DeptCalenderDataRequestModel deptCalenderDataRequestModel});
}
