import "package:kf_ess_mobile_app/features/insurance/data/models/request/create_insurance_request_model.dart";
import "package:kf_ess_mobile_app/features/insurance/domain/entities/insurance_entity.dart";
import "package:kf_ess_mobile_app/features/insurance/domain/entities/insurance_programs.dart";

import "../../../../core/network/base_handling.dart";
import "../../../shared/entity/base_entity.dart";
import "../entities/family_member_entity.dart";
import "../entities/subscriber_entity.dart";

/// Data operations for the Insurance collection
abstract class InsuranceRepository {
  /*
  A repository is a collection of data operations. It is responsible for 
  abstracting the data layer from the business logic layer. 
  */

  Future<CustomResponseType<BaseEntity<List<InsuranceProgramsEntity>>>>
      getInsurancePrograms();
  Future<CustomResponseType<BaseEntity<InsuranceEntity>>>
      getInsuranceMasterInfo();
  Future<CustomResponseType<BaseEntity<String>>> unsubscribeInsurance();
  Future<CustomResponseType<BaseEntity<List<FamilyMemberEntity>>>>
      getFamilyMembers();
  Future<CustomResponseType<BaseEntity<List<SubscriberEntity>>>>
      getSubscribers();

  Future<CustomResponseType<BaseEntity<InsuranceEntity>>>
      createInsuranceRequest(
          {required CreateInsuranceRequestModel insuranceRequestModel});
}
