import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import '../../../../../core/network/base_handling.dart';
import '../../../../../error/failure.dart';
import '../../../domain/entities/insurance_entity.dart';
import '../../../domain/use_cases/create_insurance_request_usecase.dart';
import '../../../../shared/entity/base_entity.dart';

part 'create_insurance_request_state.dart';

@injectable
class CreateInsuranceRequestCubit extends Cubit<CreateInsuranceRequestState> {
  final CreateInsuranceRequestUseCase createInsuranceRequestUseCase;
  CreateInsuranceRequestCubit({required this.createInsuranceRequestUseCase})
      : super(CreateInsuranceRequestInitialState());

  Future<void> createInsuranceRequest(createInsuranceRequestModel) async {
    log(createInsuranceRequestModel.toString());
    emit(CreateInsuranceRequestLoadingState());

    final CustomResponseType<BaseEntity<InsuranceEntity>>
        eitherPackagesOrFailure =
        await createInsuranceRequestUseCase(createInsuranceRequestModel);

    eitherPackagesOrFailure.fold((Failure failure) {
      final FailureToMassage massage = FailureToMassage();
      emit(CreateInsuranceRequestErrorState(
        message: massage.mapFailureToMessage(failure),
      ));
    }, (BaseEntity<InsuranceEntity> response) {
      emit(CreateInsuranceRequestReadyState(response));
    });
  }
}
