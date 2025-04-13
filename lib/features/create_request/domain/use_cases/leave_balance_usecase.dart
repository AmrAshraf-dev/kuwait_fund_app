import 'package:injectable/injectable.dart';
import 'package:kf_ess_mobile_app/core/domain/usecase/base_usecase.dart';
import 'package:kf_ess_mobile_app/core/network/base_handling.dart';
import 'package:kf_ess_mobile_app/features/create_request/domain/entities/leave_balance_entity.dart';
import 'package:kf_ess_mobile_app/features/create_request/domain/repositories/sick_leave_repository.dart';

@injectable
class GetLeaveBalanceUseCase implements UseCaseNoParam<LeaveBalanceEntity> {
  final SickLeaveRequestRepository sickLeaveRequestRepository;

  GetLeaveBalanceUseCase(this.sickLeaveRequestRepository);

  @override
  Future<CustomResponseType<LeaveBalanceEntity>> call() async {
    return await sickLeaveRequestRepository.getLeaveBalance();
  }
}
