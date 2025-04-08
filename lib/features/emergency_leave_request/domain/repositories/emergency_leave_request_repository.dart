import "../../../../core/network/base_handling.dart";
import "../../../shared/entity/base_entity.dart";
import "../../data/models/request/emergency_leave_request_request_model.dart";
import "../entities/emergency_leave_request_entity.dart";

/// Data operations for the EmergencyLeaveRequest collection
abstract class EmergencyLeaveRequestRepository {
  /*
  A repository is a collection of data operations. It is responsible for 
  abstracting the data layer from the business logic layer. 
  */

  Future<CustomResponseType<BaseEntity<String>>>
      createEmergencyLeaveRequest({
    required EmergencyLeaveRequestRequestModel emergencyLeaveRequestParams,
  });

  Future<CustomResponseType<BaseEntity<dynamic>>> getEmergencyLeaveBalance();

  Future<CustomResponseType<BaseEntity<dynamic>>> getEmergencyAvailableDays();
}
