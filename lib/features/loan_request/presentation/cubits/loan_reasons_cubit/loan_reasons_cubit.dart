import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import '../../../../../core/network/base_handling.dart';
import '../../../../../error/failure.dart';
import '../../../domain/entities/personal_loan_reason_entity.dart';
import '../../../domain/use_cases/get_loan_request_usecase.dart';
import '../../../../shared/entity/base_entity.dart';

part 'loan_reasons_state.dart';

@injectable
class LoanReasonsCubit extends Cubit<LoanReasonsState> {
  final GetLoanReasonsUseCase getLoanReasonsUseCase;

  LoanReasonsCubit({
    required this.getLoanReasonsUseCase,
  }) : super(LoanReasonsInitialState()) {
    getLoanReasons();
  }

  Future<void> getLoanReasons() async {
    emit(LoanReasonsLoadingState());

    final CustomResponseType<BaseEntity<List<PersonalLoanReasonEntity>>>
        eitherPackagesOrFailure = await getLoanReasonsUseCase();

    eitherPackagesOrFailure.fold((Failure failure) {
      final FailureToMassage massage = FailureToMassage();
      emit(LoanReasonsErrorState(
        message: massage.mapFailureToMessage(failure),
      ));
    }, (BaseEntity<List<PersonalLoanReasonEntity>> response) {
      emit(LoanReasonsReadyState(response));
    });
  }
}
