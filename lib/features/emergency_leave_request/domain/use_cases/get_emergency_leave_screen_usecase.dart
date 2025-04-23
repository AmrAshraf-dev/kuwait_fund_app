import 'package:injectable/injectable.dart';
import 'package:kf_ess_mobile_app/features/annual_leave_request/domain/entities/emergency_leave_entity.dart';
import 'package:kf_ess_mobile_app/features/emergency_leave_request/domain/repositories/emergency_leave_request_repository.dart';

import "../../../../core/domain/usecase/base_usecase.dart";
import '../../../../core/network/base_handling.dart';
import '../../../shared/entity/base_entity.dart';

@injectable
class GetEmergencyLeaveScreenUsecase
    implements UseCaseNoParam<BaseEntity<dynamic>> {
  GetEmergencyLeaveScreenUsecase({required this.createRequestRepository});

  final EmergencyLeaveRequestRepository createRequestRepository;

  @override
  Future<CustomResponseType<BaseEntity<EmergencyLeaveEntity>>> call() {
    return createRequestRepository.getEmergencyLeaveScreen();
  }
}
