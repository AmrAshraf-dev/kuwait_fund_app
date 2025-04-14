import "package:kf_ess_mobile_app/features/as_supervisor/submissions/data/models/request/approve_leave_request_model.dart";

import "../../../../core/network/base_handling.dart";
import "../../../shared/entity/base_entity.dart";
import "../../data/models/request/annual_leave_request_request_model.dart";

/// Data operations for the AnnualLeaveRequest collection
abstract class AnnualLeaveRequestRepository {
  /*
  A repository is a collection of data operations. It is responsible for 
  abstracting the data layer from the business logic layer. 
  */

  Future<CustomResponseType<BaseEntity<String>>> createAnnualLeaveRequest({
    required AnnualLeaveRequestRequestModel annualLeaveRequestRequestModel,
  });

  Future<CustomResponseType<BaseEntity<dynamic>>> getAnnualLeaveBalance();

 
}
