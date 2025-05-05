import 'package:injectable/injectable.dart';
import '../../data/models/request/loan_request_request_model.dart';

import "../../../../core/domain/usecase/base_usecase.dart";
import '../../../../core/network/base_handling.dart';
import '../../../shared/entity/base_entity.dart';
import "../repositories/loan_request_repository.dart";

@injectable
class CreateLoanRequestUseCase
    implements UseCase<BaseEntity<String>, LoanRequestRequestModel> {
  CreateLoanRequestUseCase({required this.loanRequestRepository});

  final LoanRequestRepository loanRequestRepository;

  @override
  Future<CustomResponseType<BaseEntity<String>>> call(
    LoanRequestRequestModel loanRequestModel,
  ) {
    return loanRequestRepository.createLoanRequest(loanRequestModel);
  }
}
