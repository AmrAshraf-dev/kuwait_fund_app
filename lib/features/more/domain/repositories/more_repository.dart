


import "../../../../core/network/base_handling.dart";
import "../../../shared/entity/base_entity.dart";

import "../../data/models/request/more_request_model.dart";
import "../entities/more_entity.dart";



/// Data operations for the More collection
abstract class MoreRepository {

  /*
  A repository is a collection of data operations. It is responsible for 
  abstracting the data layer from the business logic layer. 
  */
  

  Future<CustomResponseType<BaseEntity< MoreEntity>>> getMore({
    required MoreRequestModel moreParams,
  });
}
