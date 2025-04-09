 import "package:kf_ess_mobile_app/features/visitors_logs/data/models/response/visitors_management_calendar_model.dart";
import "package:kf_ess_mobile_app/features/visitors_logs/domain/entities/visitor_logs_entity.dart";
import "package:kf_ess_mobile_app/features/visitors_logs/domain/entities/visitor_logs_hosts_entity.dart";

import "../../../../core/network/base_handling.dart";
import "../../../shared/entity/base_entity.dart";

import "../../data/models/request/visitors_logs_request_model.dart";
 
/// Data operations for the VisitorsLogs collection
abstract class VisitorsLogsRepository {
  /*
  A repository is a collection of data operations. It is responsible for 
  abstracting the data layer from the business logic layer. 
  */

  Future<CustomResponseType<BaseEntity<List<VisitorsLogsEntity>>>> getVisitorsLogs({
    required VisitorsLogsRequestModel visitorsLogsParams,
  });
 

  Future<CustomResponseType<BaseEntity<List<VisitorsLogsHostsEntity>>>> getVisitorLogsHosts({required String date}) ;

  Future<CustomResponseType<bool>> getCanViewVisitorsLogs();
}
