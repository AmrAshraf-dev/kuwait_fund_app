


import "../../../../core/network/base_handling.dart";
import "../../../shared/entity/base_entity.dart";

import "../../data/models/request/auth_request_model.dart";
import "../entities/auth_entity.dart";



/// Data operations for the Auth collection
abstract class AuthRepository {

  /*
  A repository is a collection of data operations. It is responsible for 
  abstracting the data layer from the business logic layer. 
  */
  

  Future<CustomResponseType<BaseEntity< AuthEntity>>> getAuth({
    required AuthRequestModel authParams,
  });
}
