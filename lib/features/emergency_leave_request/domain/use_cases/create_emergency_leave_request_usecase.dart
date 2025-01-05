import 'package:injectable/injectable.dart';

import "../../../../core/domain/usecase/base_usecase.dart";
import '../../../../core/network/base_handling.dart';
import '../../../shared/entity/base_entity.dart';
import "../../data/models/request/emergency_leave_request_request_model.dart";
import "../entities/emergency_leave_request_entity.dart";
import "../repositories/emergency_leave_request_repository.dart";

@injectable
class CreateEmergencyLeaveRequestUseCase
    implements
        UseCase<BaseEntity<EmergencyLeaveRequestEntity>,
            EmergencyLeaveRequestRequestModel> {
  CreateEmergencyLeaveRequestUseCase(
      {required this.emergencyLeaveRequestRepository});

  final EmergencyLeaveRequestRepository emergencyLeaveRequestRepository;

  @override
  Future<CustomResponseType<BaseEntity<EmergencyLeaveRequestEntity>>> call(
    EmergencyLeaveRequestRequestModel params,
  ) {
    return emergencyLeaveRequestRepository.createEmergencyLeaveRequest(
        emergencyLeaveRequestParams: params);
  }
}
