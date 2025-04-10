
import "package:kf_ess_mobile_app/features/create_request/domain/entities/leave_balance_entity.dart";

import "../../../../core/network/base_handling.dart";
import "../../../shared/entity/base_entity.dart";

/// Data operations for the LoanRequest collection
abstract class SickLeaveRequestRepository {
  /*
  A repository is a collection of data operations. It is responsible for 
  abstracting the data layer from the business logic layer. 
  */
  Future<CustomResponseType<BaseEntity<String>>> createSickLeaveRequest(
      sickLeaveRequestModel);

  Future<CustomResponseType<LeaveBalanceEntity>> getLeaveBalance();
}
