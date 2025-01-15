import "../../../../../core/network/base_handling.dart";
import "../../../../shared/entity/base_entity.dart";
import "../../data/models/request/submissions_request_model.dart";
import "../entities/submissions_entity.dart";

/// Data operations for the Submissions collection
abstract class SubmissionsRepository {
  /*
  A repository is a collection of data operations. It is responsible for 
  abstracting the data layer from the business logic layer. 
  */

  Future<CustomResponseType<BaseEntity<List<SubmissionsEntity>>>>
      getSubmissions({
    required SubmissionsRequestModel submissionsParams,
  });
}
