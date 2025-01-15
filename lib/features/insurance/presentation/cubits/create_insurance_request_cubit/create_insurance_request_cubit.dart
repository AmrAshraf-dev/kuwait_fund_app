import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:kf_ess_mobile_app/core/network/base_handling.dart';
import 'package:kf_ess_mobile_app/error/failure.dart';
import 'package:kf_ess_mobile_app/features/insurance/domain/entities/insurance_entity.dart';
import 'package:kf_ess_mobile_app/features/insurance/domain/use_cases/create_insurance_request_usecase.dart';
import 'package:kf_ess_mobile_app/features/shared/entity/base_entity.dart';

part 'create_insurance_request_state.dart';

@injectable
class CreateInsuranceRequestCubit extends Cubit<CreateInsuranceRequestState> {
  final CreateInsuranceRequestUseCase createInsuranceRequestUseCase;
  CreateInsuranceRequestCubit({required this.createInsuranceRequestUseCase})
      : super(CreateInsuranceRequestInitialState());

  Future<void> createInsuranceRequest() async {
    emit(CreateInsuranceRequestLoadingState());

    final CustomResponseType<BaseEntity<List<InsuranceEntity>>>
        eitherPackagesOrFailure = await createInsuranceRequestUseCase();

    eitherPackagesOrFailure.fold((Failure failure) {
      final FailureToMassage massage = FailureToMassage();
      emit(CreateInsuranceRequestErrorState(
        message: massage.mapFailureToMessage(failure),
      ));
    }, (BaseEntity<List<InsuranceEntity>> response) {
      emit(CreateInsuranceRequestReadyState(response));
    });
  }
}
