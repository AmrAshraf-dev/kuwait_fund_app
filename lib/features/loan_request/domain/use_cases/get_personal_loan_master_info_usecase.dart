import 'package:injectable/injectable.dart';
import '../../../../core/network/base_handling.dart';
import '../entities/personal_loan_master_info_entity.dart';
import '../repositories/loan_request_repository.dart';

import '../../../shared/entity/base_entity.dart';

@injectable
class GetPersonalLoanMasterInfoUseCase {
  final LoanRequestRepository repository;

  GetPersonalLoanMasterInfoUseCase(this.repository);

  Future<CustomResponseType<BaseEntity<PersonalLoanMasterInfoEntity>>> call() {
    return repository.getPersonalLoanMasterInfo();
  }
}
