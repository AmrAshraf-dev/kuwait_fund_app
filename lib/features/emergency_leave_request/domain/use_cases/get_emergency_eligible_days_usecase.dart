import 'package:injectable/injectable.dart';
import 'package:kf_ess_mobile_app/features/emergency_leave_request/domain/repositories/emergency_leave_request_repository.dart';

import "../../../../core/domain/usecase/base_usecase.dart";
import '../../../../core/network/base_handling.dart';
 
@injectable
class GetEmergencyEligibleDaysUseCase
    implements UseCaseNoParam<int> {
  GetEmergencyEligibleDaysUseCase({required this.createRequestRepository});

  final EmergencyLeaveRequestRepository createRequestRepository;

  @override
  Future<CustomResponseType<int>> call() {
    return createRequestRepository.getEmergencyEligibleDays();
  }
}
