import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:kf_ess_mobile_app/features/insurance/domain/entities/insurance_programs.dart';
import 'package:kf_ess_mobile_app/features/insurance/domain/use_cases/get_insurance_master_info_usecase.dart';
import 'package:kf_ess_mobile_app/features/insurance/domain/use_cases/unsubscribe_insurance_usecase.dart';
import 'package:kf_ess_mobile_app/features/shared/entity/base_entity.dart';

import "../../../../core/network/base_handling.dart";
import '../../../../error/failure.dart';
import '../../domain/entities/insurance_entity.dart';
import '../../domain/use_cases/get_insurance_programs_usecase.dart';

part 'insurance_state.dart';

@injectable
class InsuranceCubit extends Cubit<InsuranceState> {
  final GetInsuranceUseCase getInsuranceUseCase;
  final GetInsuranceMasterInfoUseCase getInsuranceMasterInfoUseCase;
  final UnsubscribeInsuranceUseCase unsubscribeInsuranceUseCase;

  InsuranceCubit({
    required this.getInsuranceUseCase,
    required this.getInsuranceMasterInfoUseCase,
    required this.unsubscribeInsuranceUseCase,
  }) : super(InsuranceInitialState());

  Future<void> getInsurancePrograms() async {
    emit(InsuranceLoadingState());

    final CustomResponseType<BaseEntity<List<InsuranceProgramsEntity>>>
        eitherPackagesOrFailure = await getInsuranceUseCase();

    eitherPackagesOrFailure.fold((Failure failure) {
      final FailureToMassage massage = FailureToMassage();
      emit(InsuranceErrorState(
        message: massage.mapFailureToMessage(failure),
      ));
    }, (BaseEntity<List<InsuranceProgramsEntity>> response) {
      emit(InsuranceReadyState(response));
    });
  }

  Future<void> getInsuranceMasterInfo() async {
    emit(InsuranceLoadingState());

    final CustomResponseType<BaseEntity<InsuranceEntity>>
        eitherDetailsOrFailure = await getInsuranceMasterInfoUseCase();

    eitherDetailsOrFailure.fold((Failure failure) {
      final FailureToMassage massage = FailureToMassage();
      emit(InsuranceErrorState(
        message: massage.mapFailureToMessage(failure),
      ));
    }, (BaseEntity<InsuranceEntity> response) {
      InsuranceEntity insuranceEntity = response.data!;
      if (insuranceEntity.isAllowedTosubscribe == true &&
          insuranceEntity.isMedicallySubscribed == false &&
          insuranceEntity.hasMedicalRequest == false) {
        emit(CanAddInsuranceState(insuranceEntity));
      } else if (insuranceEntity.isMedicallySubscribed == true ||
          insuranceEntity.hasMedicalRequest == true) {
        emit(ViewOnlyInsuranceState(insuranceEntity,
            showCancelButton: insuranceEntity.viewCancelButton ?? false));
      } else if (insuranceEntity.isMedicallySubscribed == false &&
          insuranceEntity.hasMedicalRequest == false &&
          insuranceEntity.isAllowedTosubscribe == false) {
        emit(CanNotAddInsuranceState(insuranceEntity));
      }
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
