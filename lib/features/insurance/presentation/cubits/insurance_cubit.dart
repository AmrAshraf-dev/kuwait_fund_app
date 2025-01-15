import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:kf_ess_mobile_app/features/insurance/domain/use_cases/get_insurance_details_usecase.dart';
import 'package:kf_ess_mobile_app/features/insurance/domain/use_cases/unsubscribe_insurance_usecase.dart';
import 'package:kf_ess_mobile_app/features/shared/entity/base_entity.dart';

import "../../../../core/network/base_handling.dart";
import '../../../../error/failure.dart';
import '../../domain/entities/insurance_entity.dart';
import '../../domain/use_cases/get_insurance_usecase.dart';

part 'insurance_state.dart';

@injectable
class InsuranceCubit extends Cubit<InsuranceState> {
  final GetInsuranceUseCase getInsuranceUseCase;
  final GetInsuranceDetailsUseCase getInsuranceDetailsUseCase;
  final UnsubscribeInsuranceUseCase unsubscribeInsuranceUseCase;

  InsuranceCubit({
    required this.getInsuranceUseCase,
    required this.getInsuranceDetailsUseCase,
    required this.unsubscribeInsuranceUseCase,
  }) : super(InsuranceInitialState());

  Future<void> getInsurancePrograms() async {
    emit(InsuranceLoadingState());

    final CustomResponseType<BaseEntity<List<InsuranceEntity>>>
        eitherPackagesOrFailure = await getInsuranceUseCase();

    eitherPackagesOrFailure.fold((Failure failure) {
      final FailureToMassage massage = FailureToMassage();
      emit(InsuranceErrorState(
        message: massage.mapFailureToMessage(failure),
      ));
    }, (BaseEntity<List<InsuranceEntity>> response) {
      emit(InsuranceReadyState(response));
    });
  }

  Future<void> getInsuranceDetails() async {
    emit(InsuranceLoadingState());

    final CustomResponseType<BaseEntity<InsuranceEntity>>
        eitherDetailsOrFailure = await getInsuranceDetailsUseCase();

    eitherDetailsOrFailure.fold((Failure failure) {
      final FailureToMassage massage = FailureToMassage();
      emit(InsuranceErrorState(
        message: massage.mapFailureToMessage(failure),
      ));
    }, (BaseEntity<InsuranceEntity> response) {
      emit(InsuranceDetailsReadyState(response));
    });
  }

  Future<void> unsubscribeInsurance() async {
    emit(InsuranceLoadingState());

    final CustomResponseType<BaseEntity<void>> eitherUnsubscribeOrFailure =
        await unsubscribeInsuranceUseCase();

    eitherUnsubscribeOrFailure.fold((Failure failure) {
      final FailureToMassage massage = FailureToMassage();
      emit(InsuranceErrorState(
        message: massage.mapFailureToMessage(failure),
      ));
    }, (BaseEntity<void> response) {
      emit(InsuranceUnsubscribedState());
    });
  }
}
