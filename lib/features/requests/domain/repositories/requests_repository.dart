import "package:kf_ess_mobile_app/features/requests/data/models/request/annual_leave_details_request.model.dart";
import "package:kf_ess_mobile_app/features/requests/data/models/request/annual_leave_info_request_model.dart";
import "package:kf_ess_mobile_app/features/requests/data/models/request/extend_leave_request_model.dart";
import "package:kf_ess_mobile_app/features/requests/domain/entities/annual_leave_details_entity.dart";
import "package:kf_ess_mobile_app/features/requests/domain/entities/annual_leave_info_entity.dart";
import "package:kf_ess_mobile_app/features/requests/domain/entities/extend_leave_entity.dart";
import "package:kf_ess_mobile_app/features/requests/domain/entities/request_type_entity.dart";

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

  Future<CustomResponseType<BaseEntity<List<RequestTypeEntity>>>>
      getRequestTypes();
  Future<CustomResponseType<BaseEntity<List<AnnualLeaveDetailsEntity>>>>
      getAnnualLeaveDetailsHistoryList({
    required AnnualLeaveDetailsRequestModel annualLeaveDetailsParams,
  });

  Future<CustomResponseType<BaseEntity<AnnualLeaveInfoEntity>>>
      getAnnualLeaveInfo({
    required AnnualLeaveInfoRequestModel annualLeaveInfoParams,
  });

  Future<CustomResponseType<BaseEntity<CreateExtendLeaveEntity>>>
      createExtendLeaveRequest(
          {required ExtendLeaveRequestModel extendLeaveRequestParams});
}
