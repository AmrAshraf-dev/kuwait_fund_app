import "package:kf_ess_mobile_app/features/as_director/director_home_mission/data/models/request/director_mission_details_request_model.dart";
import "package:kf_ess_mobile_app/features/as_director/director_home_mission/data/models/request/management_calender_data_request_model.dart";
import "package:kf_ess_mobile_app/features/as_director/director_home_mission/domain/entities/director_entity.dart";
import "package:kf_ess_mobile_app/features/as_director/director_home_mission/domain/entities/director_mission_details_entity.dart";
import "package:kf_ess_mobile_app/features/as_director/director_home_mission/domain/entities/management_calender_data_entity.dart";

import "../../../../../core/network/base_handling.dart";
import "../../../../shared/entity/base_entity.dart";
 
/// Data operations for the AdminHome collection
abstract class AdminHomeRepository {
  /*
  A repository is a collection of data operations. It is responsible for 
  abstracting the data layer from the business logic layer. 
  */

  Future<CustomResponseType<BaseEntity<List<DirectorEntity>>>> getDirectorsList();

  Future<CustomResponseType<BaseEntity<List<ManagementCalenderDataEntity>>>> getManagementCalenderData(ManagementCalenderDataRequestModel managementCalenderDataRequestModel);

  Future<CustomResponseType<BaseEntity<List<DirectorMissionDetailsEntity>>>> getDirectorMissionsDetails(DirectorMissionDetailsRequestModel directorMissionDetailsRequestModel) ;
}
