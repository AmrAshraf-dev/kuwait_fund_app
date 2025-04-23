import "package:kf_ess_mobile_app/features/profile/data/models/request/child_request_model.dart";
import "package:kf_ess_mobile_app/features/profile/data/models/request/spouse_request_model.dart";
import "package:kf_ess_mobile_app/features/profile/data/models/response/child_response_model.dart";
import "package:kf_ess_mobile_app/features/profile/data/models/response/experiences_response_model.dart";
import "package:kf_ess_mobile_app/features/profile/data/models/response/family_response_model.dart";
import "package:kf_ess_mobile_app/features/profile/data/models/response/qualifications_response_model.dart";
import "package:kf_ess_mobile_app/features/profile/domain/entities/address_entity.dart";
import "package:kf_ess_mobile_app/features/profile/domain/entities/child_entity.dart";
import "package:kf_ess_mobile_app/features/profile/domain/entities/spouse_entity.dart";

import "../../../../core/network/base_handling.dart";
import "../../../shared/entity/base_entity.dart";
import "../entities/profile_entity.dart";

/// Data operations for the Profile collection
abstract class ProfileRepository {
  /*
  A repository is a collection of data operations. It is responsible for 
  abstracting the data layer from the business logic layer. 
  */
  Future<CustomResponseType<BaseEntity<ProfileEntity>>> getProfile(
      //  {
      // required ProfileRequestModel profileParams,
      //}
      );
  Future<CustomResponseType<BaseEntity<MyAddressEntity>>> getAddress();
  Future<CustomResponseType<BaseEntity<List<FamilyModel>>>> getFamily();
  Future<CustomResponseType<BaseEntity<List<QualificationsModel>>>>
      getQualifications();
  Future<CustomResponseType<BaseEntity<List<ExperiencesModel>>>>
      getExperiences();

  Future<CustomResponseType<BaseEntity<SpouseEntity>>> getSpouse({
    required SpouseRequestModel spouseParams,
  });
  Future<CustomResponseType<BaseEntity<ChildModel>>> getChild({
    required ChildRequestModel childParams,
  });
}
