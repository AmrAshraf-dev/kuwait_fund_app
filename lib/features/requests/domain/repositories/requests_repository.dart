import "../../../../core/network/base_handling.dart";
import "../../../shared/entity/base_entity.dart";
import "../../data/models/request/requests_request_model.dart";
import "../entities/requests_entity.dart";

/// Data operations for the Requests collection
abstract class RequestsRepository {
  /*
  A repository is a collection of data operations. It is responsible for 
  abstracting the data layer from the business logic layer. 
  */

  Future<CustomResponseType<BaseEntity<List<RequestsEntity>>>> getRequests({
    required RequestsRequestModel requestsParams,
  });
}
