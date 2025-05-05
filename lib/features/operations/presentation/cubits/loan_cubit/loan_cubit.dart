import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import '../../../../../core/network/base_handling.dart';
import '../../../../../error/failure.dart';
import '../../../domain/entities/loan/loan_entity.dart';
import '../../../domain/use_cases/loan_usecase/get_loan_usecase.dart';
import '../../../../shared/entity/base_entity.dart';

part 'loan_state.dart';

@injectable
class LoanCubit extends Cubit<LoanState> {
  final GetLoanUseCase getLoanUseCase;
  LoanCubit({required this.getLoanUseCase}) : super(LoanInitialState()) {
    getLoan();
  }

  Future<void> getLoan() async {
    await Future.delayed(const Duration(milliseconds: 100));
    emit(LoanLoadingState());

    final CustomResponseType<BaseEntity<List<LoanEntity>>>
        eitherSuccessOrFailure = await getLoanUseCase();

    eitherSuccessOrFailure.fold((Failure failure) {
      final FailureToMassage massage = FailureToMassage();
      emit(LoanErrorState(
        message: massage.mapFailureToMessage(failure),
      ));
    }, (BaseEntity<List<LoanEntity>> response) {
      emit(LoanReadyState(response));
    });
  }
}
