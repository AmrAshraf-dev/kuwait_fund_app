import 'package:injectable/injectable.dart';
 import 'package:kf_ess_mobile_app/features/annual_leave_request/domain/entities/annual_leave_request_entity.dart';

import "../../../../core/domain/usecase/base_usecase.dart";
import '../../../../core/network/base_handling.dart';
import '../../../shared/entity/base_entity.dart';
import "../repositories/annual_leave_request_repository.dart";

@injectable
class GetAnnualLeaveBalanceUseCase
    implements UseCaseNoParam<BaseEntity<AnnualLeaveRequestEntity>> {
  GetAnnualLeaveBalanceUseCase({required this.annualLeaveRequestRepository});

  final AnnualLeaveRequestRepository annualLeaveRequestRepository;

  @override
  Future<CustomResponseType<BaseEntity<AnnualLeaveRequestEntity>>> call() {
    return annualLeaveRequestRepository.getAnnualLeaveBalance();
  }
}
