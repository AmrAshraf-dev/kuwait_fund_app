


import "../../../../core/network/base_handling.dart";
import "../../../shared/entity/base_entity.dart";

import "../../data/models/request/account_request_model.dart";
import "../entities/account_entity.dart";



/// Data operations for the Account collection
abstract class AccountRepository {

  /*
  A repository is a collection of data operations. It is responsible for 
  abstracting the data layer from the business logic layer. 
  */
  

  Future<CustomResponseType<BaseEntity< AccountEntity>>> getAccount({
    required AccountRequestModel accountParams,
  });
}
