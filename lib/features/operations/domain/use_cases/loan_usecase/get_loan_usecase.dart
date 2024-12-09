import 'package:injectable/injectable.dart';
import 'package:kf_ess_mobile_app/features/operations/domain/entities/loan/loan_entity.dart';
import 'package:kf_ess_mobile_app/features/operations/domain/repositories/operations_repository.dart';

import "../../../../../core/domain/usecase/base_usecase.dart";
import '../../../../../core/network/base_handling.dart';
import '../../../../shared/entity/base_entity.dart';

@injectable
class GetLoanUseCase implements UseCaseNoParam<BaseEntity<List<LoanEntity>>> {
  GetLoanUseCase({required this.operationsRepository});

  final OperationsRepository operationsRepository;

  @override
  Future<CustomResponseType<BaseEntity<List<LoanEntity>>>> call() {
    return operationsRepository.getLoan();
  }
}
