import "package:kf_ess_mobile_app/features/profile/domain/entities/address_entity.dart";
import "package:kf_ess_mobile_app/features/profile/domain/entities/family_entity.dart";

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
  Future<CustomResponseType<BaseEntity<List<FamilyEntity>>>> getFamily();
}
