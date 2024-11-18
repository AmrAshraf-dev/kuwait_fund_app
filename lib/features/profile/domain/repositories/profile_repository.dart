


import "../../../../core/network/base_handling.dart";
import "../../../shared/entity/base_entity.dart";

import "../../data/models/request/profile_request_model.dart";
import "../entities/profile_entity.dart";



/// Data operations for the Profile collection
abstract class ProfileRepository {

  /*
  A repository is a collection of data operations. It is responsible for 
  abstracting the data layer from the business logic layer. 
  */
  

  Future<CustomResponseType<BaseEntity< ProfileEntity>>> getProfile({
    required ProfileRequestModel profileParams,
  });
}
