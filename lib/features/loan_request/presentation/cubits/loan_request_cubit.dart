import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:kf_ess_mobile_app/features/loan_request/domain/entities/personal_loan_master_info_entity.dart';
import 'package:kf_ess_mobile_app/features/loan_request/domain/use_cases/get_personal_loan_master_info_usecase.dart';

import "../../../../core/network/base_handling.dart";
import '../../../../error/failure.dart';
import "../../../shared/entity/base_entity.dart";
import '../../domain/use_cases/get_loan_request_usecase.dart';

part 'loan_request_state.dart';

@injectable
class LoanRequestCubit extends Cubit<LoanRequestState> {
  final GetLoanReasonsUseCase getLoanReasonsUseCase;
  final GetPersonalLoanMasterInfoUseCase getPersonalLoanMasterInfoUseCase;

  LoanRequestCubit(
      {required this.getLoanReasonsUseCase,
      required this.getPersonalLoanMasterInfoUseCase})
      : super(LoanRequestInitialState()) {
    getPersonalLoanMasterInfo();
  }

  Future<void> getPersonalLoanMasterInfo() async {
    emit(LoanRequestLoadingState());

    final CustomResponseType<BaseEntity<PersonalLoanMasterInfoEntity>>
        eitherInfoOrFailure = await getPersonalLoanMasterInfoUseCase();

    eitherInfoOrFailure.fold((Failure failure) {
      final FailureToMassage massage = FailureToMassage();
      emit(LoanRequestErrorState(
        message: massage.mapFailureToMessage(failure),
      ));
    }, (BaseEntity<PersonalLoanMasterInfoEntity> response) {
      final PersonalLoanMasterInfoEntity personalLoanMasterInfoEntity =
          response.data!;
      if (num.parse(personalLoanMasterInfoEntity.maxLoanAmount ?? "0") > 0 &&
          int.parse(
                  personalLoanMasterInfoEntity.personalLoanRequestID ?? "-1") ==
              0) {
        emit(CanAddLoanRequestState(response));
      } else {
        emit(CanNotAddLoanRequestState());
      }
    });
  }
}
