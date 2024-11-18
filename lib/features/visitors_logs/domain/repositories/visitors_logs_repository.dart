


import "../../../../core/network/base_handling.dart";
import "../../../shared/entity/base_entity.dart";

import "../../data/models/request/visitors_logs_request_model.dart";
import "../entities/visitors_logs_entity.dart";



/// Data operations for the VisitorsLogs collection
abstract class VisitorsLogsRepository {

  /*
  A repository is a collection of data operations. It is responsible for 
  abstracting the data layer from the business logic layer. 
  */
  

  Future<CustomResponseType<BaseEntity< VisitorsLogsEntity>>> getVisitorsLogs({
    required VisitorsLogsRequestModel visitorsLogsParams,
  });
}
