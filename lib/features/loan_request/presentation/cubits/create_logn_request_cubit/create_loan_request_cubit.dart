import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:kf_ess_mobile_app/core/network/base_handling.dart';
import 'package:kf_ess_mobile_app/error/failure.dart';
import 'package:kf_ess_mobile_app/features/loan_request/data/models/request/loan_request_request_model.dart';
import 'package:kf_ess_mobile_app/features/loan_request/domain/use_cases/create_loan_request_usecase.dart';
import 'package:kf_ess_mobile_app/features/shared/entity/base_entity.dart';

part 'create_loan_request_state.dart';

@injectable
class CreateLoanRequestCubit extends Cubit<CreateLoanRequestState> {
  final CreateLoanRequestUseCase createLoanRequestUseCase;

  CreateLoanRequestCubit({
    required this.createLoanRequestUseCase,
  }) : super(CreateLoanRequestInitialState());

  void createLoanRequest(LoanRequestRequestModel loanRequestModel) async {
    emit(CreateLoanRequestLoadingState());

    final CustomResponseType<BaseEntity<String>> eitherPackagesOrFailure =
        await createLoanRequestUseCase(loanRequestModel);

    eitherPackagesOrFailure.fold((Failure failure) {
      final FailureToMassage massage = FailureToMassage();
      emit(CreateLoanRequestErrorState(
        message: massage.mapFailureToMessage(failure),
      ));
    }, (BaseEntity<String> response) {
      emit(CreateLoanRequestReadyState());
    });
  }
}
