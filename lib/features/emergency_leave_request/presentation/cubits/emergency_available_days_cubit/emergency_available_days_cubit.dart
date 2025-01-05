import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:kf_ess_mobile_app/core/network/base_handling.dart';
import 'package:kf_ess_mobile_app/error/failure.dart';
import 'package:kf_ess_mobile_app/features/emergency_leave_request/domain/use_cases/get_emergency_available_days_usecase.dart';
import 'package:kf_ess_mobile_app/features/shared/entity/base_entity.dart';

part 'emergency_available_days_state.dart';

@injectable
class EmergencyAvailableDaysCubit extends Cubit<EmergencyAvailableDaysState> {
  final GetEmergencyAvailableDaysUseCase getEmergencyAvailableDaysUseCase;
  EmergencyAvailableDaysCubit({required this.getEmergencyAvailableDaysUseCase})
      : super(EmergencyAvailableDaysInitialState()) {
    getAnnualEmergencyAvailableDays();
  }

  Future<void> getAnnualEmergencyAvailableDays() async {
    emit(EmergencyAvailableDaysLoadingState());

    final CustomResponseType<BaseEntity<dynamic>> eitherPackagesOrFailure =
        await getEmergencyAvailableDaysUseCase();

    eitherPackagesOrFailure.fold((Failure failure) {
      final FailureToMassage massage = FailureToMassage();
      emit(EmergencyAvailableDaysErrorState(
        message: massage.mapFailureToMessage(failure),
      ));
    }, (BaseEntity<dynamic> response) {
      emit(EmergencyAvailableDaysReadyState(response));
    });
  }
}
