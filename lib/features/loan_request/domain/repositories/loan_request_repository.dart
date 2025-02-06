import "package:kf_ess_mobile_app/features/loan_request/domain/entities/personal_loan_master_info_entity.dart";
import "package:kf_ess_mobile_app/features/loan_request/domain/entities/personal_loan_reason_entity.dart";

import "../../../../core/network/base_handling.dart";
import "../../../shared/entity/base_entity.dart";

/// Data operations for the LoanRequest collection
abstract class LoanRequestRepository {
  /*
  A repository is a collection of data operations. It is responsible for 
  abstracting the data layer from the business logic layer. 
  */

  Future<CustomResponseType<BaseEntity<List<PersonalLoanReasonEntity>>>>
      getLoanReasons();

  Future<CustomResponseType<BaseEntity<String>>> createLoanRequest(
      loanRequestModel);

  Future<CustomResponseType<BaseEntity<PersonalLoanMasterInfoEntity>>>
      getPersonalLoanMasterInfo();
}
