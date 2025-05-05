import 'package:injectable/injectable.dart';
import '../../data/models/request/approve_leave_request_model.dart';
import '../repositories/submissions_repository.dart';

import "../../../../../core/domain/usecase/base_usecase.dart";
import '../../../../../core/network/base_handling.dart';
import '../../../../shared/entity/base_entity.dart';

@injectable
class ApproveLeaveRequestUseCase
    implements UseCase<BaseEntity<String>, ApproveLeaveRequestModel> {
  ApproveLeaveRequestUseCase({required this.approveLeaveRequestRepository});

  final SubmissionsRepository approveLeaveRequestRepository;

  @override
  Future<CustomResponseType<BaseEntity<String>>> call(
    ApproveLeaveRequestModel approveLeaveRequestModel,
  ) {
    return approveLeaveRequestRepository.createApproveLeaveRequest(
        approveLeaveRequestModel: approveLeaveRequestModel);
  }
}
