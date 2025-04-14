import 'package:injectable/injectable.dart';
import 'package:kf_ess_mobile_app/features/as_supervisor/submissions/data/models/request/approve_leave_request_model.dart';
import 'package:kf_ess_mobile_app/features/as_supervisor/submissions/data/models/request/reject_leave_request_model.dart';
import 'package:kf_ess_mobile_app/features/as_supervisor/submissions/data/models/response/submission_response_model.dart';

import '../../../../../core/network/base_handling.dart';
import '../../../../shared/entity/base_entity.dart';
import '../../domain/repositories/submissions_repository.dart';
import '../data_sources/remote/submissions_remote_data_source.dart';
import '../models/request/submissions_request_model.dart';
import '../models/response/old_submissions_response_model.dart';

@Injectable(as: SubmissionsRepository)
class SubmissionsRepositoryImp implements SubmissionsRepository {
  SubmissionsRepositoryImp({
    required this.submissionsRemoteDataSource,
  });

  final SubmissionsRemoteDataSource submissionsRemoteDataSource;

  @override
  Future<CustomResponseType<BaseEntity<List<OldSubmissionsModel>>>>
      getOldSubmissions(
          {required SubmissionsRequestModel oldSubmissionsParams}) async {
    return await submissionsRemoteDataSource.getOldSubmissions(
        oldSubmissionsRequestModel: oldSubmissionsParams);
  }

  @override
  Future<CustomResponseType<BaseEntity<List<SubmissionModel>>>>
      getSubmission() async {
    return await submissionsRemoteDataSource.getSubmission();
  }

  @override
  Future<CustomResponseType<BaseEntity<String>>> createApproveLeaveRequest(
      {required ApproveLeaveRequestModel approveLeaveRequestModel}) {
    return submissionsRemoteDataSource.createApproveLeaveRequest(
        approveLeaveRequestModel: approveLeaveRequestModel);
  }

  @override
  Future<CustomResponseType<BaseEntity<String>>> createRejectLeaveRequest({required RejectLeaveRequestModel rejectLeaveRequestModel}) {
   return submissionsRemoteDataSource.createRejectLeaveRequest(
        rejectLeaveRequestModel: rejectLeaveRequestModel);
  }
}
