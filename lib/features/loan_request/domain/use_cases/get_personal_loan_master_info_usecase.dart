import 'package:injectable/injectable.dart';
import 'package:kf_ess_mobile_app/core/network/base_handling.dart';
import 'package:kf_ess_mobile_app/features/loan_request/domain/entities/personal_loan_master_info_entity.dart';
import 'package:kf_ess_mobile_app/features/loan_request/domain/repositories/loan_request_repository.dart';

import '../../../shared/entity/base_entity.dart';

@injectable
class GetPersonalLoanMasterInfoUseCase {
  final LoanRequestRepository repository;

  GetPersonalLoanMasterInfoUseCase(this.repository);

  Future<CustomResponseType<BaseEntity<PersonalLoanMasterInfoEntity>>> call() {
    return repository.getPersonalLoanMasterInfo();
  }
}
