import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:kf_ess_mobile_app/features/as_supervisor/submissions/data/models/request/approve_leave_request_model.dart';
import 'package:kf_ess_mobile_app/features/as_supervisor/submissions/data/models/request/reject_leave_request_model.dart';
import 'package:kf_ess_mobile_app/features/as_supervisor/submissions/data/models/response/approve_leave_request_response_model.dart';
import 'package:kf_ess_mobile_app/features/as_supervisor/submissions/data/models/response/reject_leave_request_response_model.dart';
import 'package:kf_ess_mobile_app/features/as_supervisor/submissions/data/models/response/submission_response_model.dart';

import '../../../../../../core/network/api/network_apis_constants.dart';
import '../../../../../../core/network/base_handling.dart';
import '../../../../../../core/network/network_helper.dart';
import '../../../../../../error/failure.dart';
import '../../models/request/submissions_request_model.dart';
import '../../models/response/old_submissions_response_model.dart';

abstract class SubmissionsRemoteDataSource {
  Future<CustomResponseType<OldSubmissionsResponseModel>> getOldSubmissions(
      {required SubmissionsRequestModel oldSubmissionsRequestModel});

  Future<CustomResponseType<SubmissionResponseModel>> getSubmission();

  Future<CustomResponseType<ApproveLeaveRequestResponseModel>>
      createApproveLeaveRequest(
          {required ApproveLeaveRequestModel approveLeaveRequestModel});

  Future<CustomResponseType<RejectLeaveRequestResponseModel>>
      createRejectLeaveRequest(
          {required RejectLeaveRequestModel rejectLeaveRequestModel});
}

@Injectable(as: SubmissionsRemoteDataSource)
class SubmissionsDataSourceImpl implements SubmissionsRemoteDataSource {
  SubmissionsDataSourceImpl(this.networkHelper);
  final NetworkHelper networkHelper;

  @override
  Future<CustomResponseType<OldSubmissionsResponseModel>> getOldSubmissions(
      {required SubmissionsRequestModel oldSubmissionsRequestModel}) async {
    ({dynamic response, bool success}) result = await networkHelper
        .get(path: ApiConstants.getSubmissions, queryParams: <String, String>{
      if (oldSubmissionsRequestModel.requestTypeID != null)
        "requestTypeID": oldSubmissionsRequestModel.requestTypeID ?? "",
      "userName": "TEST33"
    });

    if (result.success) {
      return right(OldSubmissionsResponseModel.fromJson(result.response));
    } else {
      return left(ServerFailure(message: result.response as String));
    }
  }

  @override
  Future<CustomResponseType<SubmissionResponseModel>> getSubmission() async {
    ({dynamic response, bool success}) result =
        await networkHelper.get(path: ApiConstants.getAllLeaveRequestsWaiting);

    if (result.success) {
      return right(SubmissionResponseModel.fromJson(result.response));
    } else {
      return left(ServerFailure(message: result.response as String));
    }
  }

  @override
  Future<CustomResponseType<ApproveLeaveRequestResponseModel>>
      createApproveLeaveRequest(
          {required ApproveLeaveRequestModel approveLeaveRequestModel}) async {
    ({dynamic response, bool success}) result = await networkHelper.post(
        path: ApiConstants.approveLeaveRequest,
        queryParams: approveLeaveRequestModel.toJson());

    if (result.success) {
      return right(ApproveLeaveRequestResponseModel.fromJson(result.response));
    } else {
      return left(ServerFailure(message: result.response as String));
    }
  }

  @override
  Future<CustomResponseType<RejectLeaveRequestResponseModel>>
      createRejectLeaveRequest(
          {required RejectLeaveRequestModel rejectLeaveRequestModel}) async {
    ({dynamic response, bool success}) result = await networkHelper.post(
        path: ApiConstants.rejectLeaveRequest,
        queryParams: rejectLeaveRequestModel.toJson());

    if (result.success) {
      return right(RejectLeaveRequestResponseModel.fromJson(result.response));
    } else {
      return left(ServerFailure(message: result.response as String));
    }
  }
}
