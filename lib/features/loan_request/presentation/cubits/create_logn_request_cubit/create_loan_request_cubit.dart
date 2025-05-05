import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import '../../../../../core/network/base_handling.dart';
import '../../../../../error/failure.dart';
import '../../../data/models/request/loan_request_request_model.dart';
import '../../../domain/use_cases/create_loan_request_usecase.dart';
import '../../../../shared/entity/base_entity.dart';

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
