import 'package:injectable/injectable.dart';
import 'package:kf_ess_mobile_app/features/as_supervisor/submissions/data/models/request/reject_leave_request_model.dart';
import 'package:kf_ess_mobile_app/features/as_supervisor/submissions/domain/repositories/submissions_repository.dart';

import "../../../../../core/domain/usecase/base_usecase.dart";
import '../../../../../core/network/base_handling.dart';
import '../../../../shared/entity/base_entity.dart';

@injectable
class RejectLeaveRequestUseCase
    implements UseCase<BaseEntity<String>, RejectLeaveRequestModel> {
  RejectLeaveRequestUseCase({required this.rejectLeaveRequestRepository});

  final SubmissionsRepository rejectLeaveRequestRepository;

  @override
  Future<CustomResponseType<BaseEntity<String>>> call(
    RejectLeaveRequestModel rejectLeaveRequestModel,
  ) {
    return rejectLeaveRequestRepository.createRejectLeaveRequest(
        rejectLeaveRequestModel: rejectLeaveRequestModel);
  }
}
