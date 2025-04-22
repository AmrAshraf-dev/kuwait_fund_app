import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:kf_ess_mobile_app/features/requests/data/models/request/annual_leave_details_request.model.dart';
import 'package:kf_ess_mobile_app/features/requests/data/models/request/annual_leave_info_request_model.dart';
import 'package:kf_ess_mobile_app/features/requests/data/models/request/delete_leave_request_model.dart';
import 'package:kf_ess_mobile_app/features/requests/data/models/request/extend_leave_request_model.dart';
import 'package:kf_ess_mobile_app/features/requests/data/models/response/annual_leave_details_response_model.dart';
import 'package:kf_ess_mobile_app/features/requests/data/models/response/annual_leave_info_response_model.dart';
import 'package:kf_ess_mobile_app/features/requests/data/models/response/delete_leave_request_response_model.dart';
import 'package:kf_ess_mobile_app/features/requests/data/models/response/extend_leave_response_model.dart';
import 'package:kf_ess_mobile_app/features/requests/data/models/response/request_type_response_model.dart';
import 'package:kf_ess_mobile_app/features/shared/entity/base_entity.dart';

import '../../../../../core/network/api/network_apis_constants.dart';
import '../../../../../core/network/base_handling.dart';
import '../../../../../core/network/network_helper.dart';
import '../../../../../error/failure.dart';
import '../../models/request/requests_request_model.dart';
import '../../models/response/requests_response_model.dart';

abstract class RequestsRemoteDataSource {
  Future<CustomResponseType<RequestsResponseModel>> getRequests(
     );
  Future<CustomResponseType<RequestTypeResponseModel>> getRequestTypes();

  Future<CustomResponseType<AnnualDetailsResponseModel>>
      getAnnualLeaveDetailsHistoryList(
          {required AnnualLeaveDetailsRequestModel
              annualLeaveDetailsRequestModel});

  Future<CustomResponseType<AnnualDetailsInfoResponseModel>>
      getAnnualLeaveInfoRemote(
          {required AnnualLeaveInfoRequestModel annualLeaveInfoRequestModel});

  Future<CustomResponseType<ExtendLeaveResponseModel>> extendLeave(
      {required ExtendLeaveRequestModel extendLeaveRequestModel});

  Future<CustomResponseType<String>> deleteLeave(
      {required DeleteLeaveRequestModel deleteLeaveRequestModel});
}

@Injectable(as: RequestsRemoteDataSource)
class RequestsDataSourceImpl implements RequestsRemoteDataSource {
  RequestsDataSourceImpl(this.networkHelper);
  final NetworkHelper networkHelper;

  @override
  Future<CustomResponseType<RequestsResponseModel>> getRequests(
     ) async {
    ({dynamic response, bool success}) result = await networkHelper.get(
      path: ApiConstants.getUserRequests,
    
    );

    if (result.success) {
      return right(RequestsResponseModel.fromJson(result.response));
    } else {
      return left(ServerFailure(message: result.response as String));
    }
  }

  @override
  Future<Either<Failure, RequestTypeResponseModel>> getRequestTypes() async {
    ({dynamic response, bool success}) result = await networkHelper.get(
      path: ApiConstants.getRequestTypes,
    );

    if (result.success) {
      return right(RequestTypeResponseModel.fromJson(result.response));
    } else {
      return left(ServerFailure(message: result.response as String));
    }
  }

  @override
  Future<CustomResponseType<AnnualDetailsResponseModel>>
      getAnnualLeaveDetailsHistoryList(
          {required AnnualLeaveDetailsRequestModel
              annualLeaveDetailsRequestModel}) async {
    ({dynamic response, bool success}) result = await networkHelper.get(
        path: ApiConstants.getLeaveRequestHistory,
        queryParams: <String, dynamic>{
          "startDate": annualLeaveDetailsRequestModel.startDate ?? '',
          "endDate": annualLeaveDetailsRequestModel.endDate ?? '',
        });

    if (result.success) {
      return right(AnnualDetailsResponseModel.fromJson(result.response));
    } else {
      return left(ServerFailure(message: result.response as String));
    }
  }

  @override
  Future<CustomResponseType<AnnualDetailsInfoResponseModel>>
      getAnnualLeaveInfoRemote(
          {required AnnualLeaveInfoRequestModel
              annualLeaveInfoRequestModel}) async {
    ({dynamic response, bool success}) result = await networkHelper.get(
        path: ApiConstants.getLeaveRequestInfo,
        queryParams: <String, dynamic>{
          "leaveRequestID":
              annualLeaveInfoRequestModel.leaveRequestID ?? '1000',
        });

    if (result.success) {
      return right(AnnualDetailsInfoResponseModel.fromJson(result.response));
    } else {
      return left(ServerFailure(message: result.response as String));
    }
  }

  @override
  Future<CustomResponseType<ExtendLeaveResponseModel>> extendLeave(
      {required ExtendLeaveRequestModel extendLeaveRequestModel}) async {
    ({dynamic response, bool success}) result = await networkHelper
        .post(path: ApiConstants.extendLeave, queryParams: <String, dynamic>{
      "leaveRequestId": extendLeaveRequestModel.leaveRequestId ,
      "extendDate": extendLeaveRequestModel.extendDate  ,
    });

    if (result.success && result.response["code"]!=404) {
      return right(ExtendLeaveResponseModel.fromJson(result.response));
    } else {
      return left(ServerFailure(message: result.response["data"] as String));
    }
  }

  @override
  Future<CustomResponseType<String>> deleteLeave(
      {required DeleteLeaveRequestModel deleteLeaveRequestModel}) async {
    ({dynamic response, bool success}) result = await networkHelper.post(
        path: ApiConstants.deleteLeave,
        queryParams: deleteLeaveRequestModel.toJson());

    if (result.success && result.response["code"]!=404) {
      return right(result .response["data"]);
    } else {
      return left(ServerFailure(message: result.response["data"] as String));
    }
  }
}
