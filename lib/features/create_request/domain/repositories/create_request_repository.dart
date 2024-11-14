


import "../../../../core/network/base_handling.dart";
import "../../../shared/entity/base_entity.dart";

import "../../data/models/request/create_request_request_model.dart";
import "../entities/create_request_entity.dart";



/// Data operations for the CreateRequest collection
abstract class CreateRequestRepository {

  /*
  A repository is a collection of data operations. It is responsible for 
  abstracting the data layer from the business logic layer. 
  */
  

  Future<CustomResponseType<BaseEntity< CreateRequestEntity>>> getCreateRequest({
    required CreateRequestRequestModel createRequestParams,
  });
}
