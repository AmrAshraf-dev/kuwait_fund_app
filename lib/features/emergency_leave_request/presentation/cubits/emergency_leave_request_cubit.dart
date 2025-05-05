import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import '../../../annual_leave_request/domain/entities/emergency_leave_entity.dart';
import '../../domain/use_cases/get_emergency_leave_screen_usecase.dart';

import "../../../../core/network/base_handling.dart";
import '../../../../error/failure.dart';
import "../../../shared/entity/base_entity.dart";
import '../../data/models/request/emergency_leave_request_request_model.dart';
 import '../../domain/use_cases/create_emergency_leave_request_usecase.dart';

part 'emergency_leave_request_state.dart';

@injectable
class EmergencyLeaveRequestCubit extends Cubit<EmergencyLeaveScreenState> {
  final CreateEmergencyLeaveRequestUseCase createEmergencyLeaveRequestUseCase;

  final GetEmergencyLeaveScreenUsecase getEmergencyLeaveScreenUsecase;
  EmergencyLeaveRequestCubit({required this.createEmergencyLeaveRequestUseCase ,required this.getEmergencyLeaveScreenUsecase})
      : super(EmergencyLeaveRequestInitialState());

  Future<void> createEmergencyLeaveRequest(
      {required EmergencyLeaveRequestRequestModel
          emergencyLeaveRequestModel}) async {
    emit(EmergencyLeaveRequestLoadingState());

    final CustomResponseType<String>
        eitherPackagesOrFailure =
        await createEmergencyLeaveRequestUseCase(emergencyLeaveRequestModel);

    eitherPackagesOrFailure.fold((Failure failure) {
      final FailureToMassage massage = FailureToMassage();
      emit(EmergencyLeaveRequestErrorState(
        message: massage.mapFailureToMessage(failure),
      ));
    }, (String response) {
      emit(EmergencyLeaveRequestReadyState(response));
    });
  }

  getEmergencyLeaveScreen() async {
    await Future.delayed(const Duration(milliseconds: 100));
    emit(EmergencyLeaveScreenLoadingState());

    final CustomResponseType< BaseEntity< EmergencyLeaveEntity>>
        eitherPackagesOrFailure =
        await getEmergencyLeaveScreenUsecase();

    eitherPackagesOrFailure.fold((Failure failure) {
      final FailureToMassage massage = FailureToMassage();
      emit(EmergencyLeaveScreenErrorState(
        message: massage.mapFailureToMessage(failure),
      ));
    }, (BaseEntity< EmergencyLeaveEntity> response) {
      emit(EmergencyLeaveScreenReadyState(response));
    });
  }
}
