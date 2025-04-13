import 'package:injectable/injectable.dart';
import 'package:kf_ess_mobile_app/features/create_request/data/models/request/sick_leave_request_model.dart';
import 'package:kf_ess_mobile_app/features/create_request/domain/repositories/sick_leave_repository.dart';

import "../../../../core/domain/usecase/base_usecase.dart";
import '../../../../core/network/base_handling.dart';
import '../../../shared/entity/base_entity.dart';

@injectable
class CreateSickLeaveRequestUseCase
    implements UseCase<BaseEntity<String>, SickLeaveRequestModel> {
  CreateSickLeaveRequestUseCase({required this.sickLeaveRequestRepository});

  final SickLeaveRequestRepository sickLeaveRequestRepository;

  @override
  Future<CustomResponseType<BaseEntity<String>>> call(
    SickLeaveRequestModel sickLeaveRequestModel,
  ) {
    return sickLeaveRequestRepository
        .createSickLeaveRequest(sickLeaveRequestModel);
  }
}
