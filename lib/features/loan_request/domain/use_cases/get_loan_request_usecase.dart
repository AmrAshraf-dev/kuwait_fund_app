import 'package:injectable/injectable.dart';
import "../entities/personal_loan_reason_entity.dart";

import "../../../../core/domain/usecase/base_usecase.dart";
import '../../../../core/network/base_handling.dart';
import '../../../shared/entity/base_entity.dart';
import "../repositories/loan_request_repository.dart";

@injectable
class GetLoanReasonsUseCase
    implements UseCaseNoParam<BaseEntity<List<PersonalLoanReasonEntity>>> {
  GetLoanReasonsUseCase({required this.loanRequestRepository});

  final LoanRequestRepository loanRequestRepository;

  @override
  Future<CustomResponseType<BaseEntity<List<PersonalLoanReasonEntity>>>>
      call() {
    return loanRequestRepository.getLoanReasons();
  }
}
