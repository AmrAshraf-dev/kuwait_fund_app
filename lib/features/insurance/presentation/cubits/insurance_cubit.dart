import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';

import "../../../../core/network/base_handling.dart";
import '../../../../error/failure.dart';
import "../../../shared/entity/base_entity.dart";
import '../../domain/use_cases/get_insurance_usecase.dart';
import '../../domain/entities/insurance_entity.dart';
import '../../data/models/request/insurance_request_model.dart';

part 'insurance_state.dart';





@injectable
class InsuranceCubit extends Cubit<InsuranceState> {
  final GetInsuranceUseCase getInsuranceUseCase;
  InsuranceCubit({required this.getInsuranceUseCase}) : super(InsuranceInitialState());

  Future<void> getInsurance(
      {required InsuranceRequestModel insuranceModel}) async {
    emit(InsuranceLoadingState());

    final CustomResponseType<BaseEntity<InsuranceEntity>> eitherPackagesOrFailure =
        await getInsuranceUseCase(insuranceModel);

    eitherPackagesOrFailure.fold((Failure failure) {
      final FailureToMassage massage = FailureToMassage();
      emit(InsuranceErrorState(
        message: massage.mapFailureToMessage(failure),
      ));
    }, (BaseEntity<InsuranceEntity> response) {
      emit(InsuranceReadyState(response));
    });
  }
}















