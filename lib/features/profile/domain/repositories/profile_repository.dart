import "package:kf_ess_mobile_app/features/profile/domain/entities/child_entity.dart";
import "package:kf_ess_mobile_app/features/profile/domain/entities/family_entity.dart";

import "../../../../core/network/base_handling.dart";
import "../../../shared/entity/base_entity.dart";
import "../../data/models/request/child_request_model.dart";
import "../../data/models/request/edit_child_request_model.dart";
import "../../data/models/request/edit_spouse_request_model.dart";
import "../../data/models/request/profile_request_model.dart";
import "../../data/models/request/spouse_request_model.dart";
 import "../../data/models/response/experiences_response_model.dart";
import "../../data/models/response/qualifications_response_model.dart";
import "../entities/address_entity.dart";
import "../entities/look_up_entity.dart";
import "../entities/main_profile_entity.dart";
import "../entities/spouse_entity.dart";

/// Data operations for the Profile collection
abstract class ProfileRepository {
  /*
  A repository is a collection of data operations. It is responsible for 
  abstracting the data layer from the business logic layer. 
  */
  Future<CustomResponseType<BaseEntity<MainProfileEntity>>> getProfile(
    
      );
  Future<CustomResponseType<BaseEntity<MyAddressEntity>>> getAddress();
  Future<CustomResponseType<BaseEntity<List<FamilyEntity>>>> getFamily();
  Future<CustomResponseType<BaseEntity<List<QualificationsModel>>>>
      getQualifications();
  Future<CustomResponseType<BaseEntity<List<ExperiencesModel>>>>
      getExperiences();

  Future<CustomResponseType<BaseEntity<SpouseEntity>>> getSpouse({
    required SpouseRequestModel spouseParams,
  });
  Future<CustomResponseType<BaseEntity<ChildEntity>>> getChild({
    required ChildRequestModel childParams,
  });
  Future<CustomResponseType<BaseEntity<String>>> editProfile({
    required ProfileRequestModel profileRequestModel,
  });
  Future<CustomResponseType<BaseEntity<String>>> editSpouse({
    required EditSpouseRequestModel editSpouseRequestModel,
  });

  Future<CustomResponseType<BaseEntity<String>>> editChild({
    required EditChildRequestModel editChildRequestModel,
  });

  Future<CustomResponseType<BaseEntity<List<LookUpEntity>>>> getLookup(String lookupPath); 
}
