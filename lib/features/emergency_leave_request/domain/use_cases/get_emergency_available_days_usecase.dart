import 'package:injectable/injectable.dart';
import 'package:kf_ess_mobile_app/features/emergency_leave_request/domain/repositories/emergency_leave_request_repository.dart';

import "../../../../core/domain/usecase/base_usecase.dart";
import '../../../../core/network/base_handling.dart';
import '../../../shared/entity/base_entity.dart';

@injectable
class GetEmergencyAvailableDaysUseCase
    implements UseCaseNoParam<BaseEntity<dynamic>> {
  GetEmergencyAvailableDaysUseCase({required this.createRequestRepository});

  final EmergencyLeaveRequestRepository createRequestRepository;

  @override
  Future<CustomResponseType<BaseEntity<dynamic>>> call() {
    return createRequestRepository.getEmergencyAvailableDays();
  }
}
