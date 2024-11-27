


import "../../../../core/network/base_handling.dart";
import "../../../shared/entity/base_entity.dart";

import "../../data/models/request/stores_request_model.dart";
import "../entities/stores_entity.dart";



/// Data operations for the Stores collection
abstract class StoresRepository {

  /*
  A repository is a collection of data operations. It is responsible for 
  abstracting the data layer from the business logic layer. 
  */
  

  Future<CustomResponseType<BaseEntity< StoresEntity>>> getStores({
    required StoresRequestModel storesParams,
  });
}
