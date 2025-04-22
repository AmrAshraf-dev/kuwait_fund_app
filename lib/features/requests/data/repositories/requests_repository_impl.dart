import 'package:injectable/injectable.dart';
import 'package:kf_ess_mobile_app/features/requests/data/models/request/annual_leave_details_request.model.dart';
import 'package:kf_ess_mobile_app/features/requests/data/models/request/annual_leave_info_request_model.dart';
import 'package:kf_ess_mobile_app/features/requests/data/models/request/delete_leave_request_model.dart';
import 'package:kf_ess_mobile_app/features/requests/data/models/request/extend_leave_request_model.dart';
import 'package:kf_ess_mobile_app/features/requests/data/models/response/annual_leave_details_response_model.dart';
import 'package:kf_ess_mobile_app/features/requests/data/models/response/annual_leave_info_response_model.dart';
import 'package:kf_ess_mobile_app/features/requests/data/models/response/extend_leave_response_model.dart';
import 'package:kf_ess_mobile_app/features/requests/data/models/response/request_type_response_model.dart';
import 'package:kf_ess_mobile_app/features/requests/domain/entities/delete_leave_entity.dart';

import '../../../../core/network/base_handling.dart';
import '../../../requests/data/data_sources/remote/requests_remote_data_source.dart';
import '../../../shared/entity/base_entity.dart';
import '../../domain/repositories/requests_repository.dart';
import '../models/request/requests_request_model.dart';
import '../models/response/requests_response_model.dart';

@Injectable(as: RequestsRepository)
class RequestsRepositoryImp implements RequestsRepository {
  RequestsRepositoryImp({
    required this.requestsRemoteDataSource,
  });

  final RequestsRemoteDataSource requestsRemoteDataSource;

  @override
  Future<CustomResponseType<BaseEntity<List<RequestsModel>>>>
      getRequests() async {
    return await requestsRemoteDataSource.getRequests(
      requestsRequestModel: RequestsRequestModel(),
    );
  }

  @override
  Future<CustomResponseType<BaseEntity<List<RequestTypeModel>>>>
      getRequestTypes() async {
    return await requestsRemoteDataSource.getRequestTypes();
  }

  @override
  Future<CustomResponseType<BaseEntity<List<AnnualDetailsModel>>>>
      getAnnualLeaveDetailsHistoryList(
          {required AnnualLeaveDetailsRequestModel
              annualLeaveDetailsParams}) async {
    return await requestsRemoteDataSource.getAnnualLeaveDetailsHistoryList(
        annualLeaveDetailsRequestModel: annualLeaveDetailsParams);
  }

  @override
  Future<CustomResponseType<BaseEntity<AnnualDetailsInfoModel>>>
      getAnnualLeaveInfo(
          {required AnnualLeaveInfoRequestModel annualLeaveInfoParams}) async {
    return await requestsRemoteDataSource.getAnnualLeaveInfoRemote(
        annualLeaveInfoRequestModel: annualLeaveInfoParams);
  }

  @override
  Future<CustomResponseType<BaseEntity<ExtendLeaveModel>>>
      createExtendLeaveRequest(
          {required ExtendLeaveRequestModel extendLeaveRequestParams}) async {
    return await requestsRemoteDataSource.extendLeave(
        extendLeaveRequestModel: extendLeaveRequestParams);
  }

  @override
  Future<CustomResponseType<String>>
      createDeleteLeaveRequest(
          {required DeleteLeaveRequestModel deleteLeaveRequestParams}) async {
    return await requestsRemoteDataSource.deleteLeave(
        deleteLeaveRequestModel: deleteLeaveRequestParams);
  }
}
