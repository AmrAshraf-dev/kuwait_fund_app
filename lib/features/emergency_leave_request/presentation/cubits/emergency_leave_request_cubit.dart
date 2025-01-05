import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';

import "../../../../core/network/base_handling.dart";
import '../../../../error/failure.dart';
import "../../../shared/entity/base_entity.dart";
import '../../data/models/request/emergency_leave_request_request_model.dart';
import '../../domain/entities/emergency_leave_request_entity.dart';
import '../../domain/use_cases/create_emergency_leave_request_usecase.dart';

part 'emergency_leave_request_state.dart';

@injectable
class EmergencyLeaveRequestCubit extends Cubit<EmergencyLeaveRequestState> {
  final CreateEmergencyLeaveRequestUseCase createEmergencyLeaveRequestUseCase;
  EmergencyLeaveRequestCubit({required this.createEmergencyLeaveRequestUseCase})
      : super(EmergencyLeaveRequestInitialState());

  Future<void> createEmergencyLeaveRequest(
      {required EmergencyLeaveRequestRequestModel
          emergencyLeaveRequestModel}) async {
    emit(EmergencyLeaveRequestLoadingState());

    final CustomResponseType<BaseEntity<EmergencyLeaveRequestEntity>>
        eitherPackagesOrFailure =
        await createEmergencyLeaveRequestUseCase(emergencyLeaveRequestModel);

    eitherPackagesOrFailure.fold((Failure failure) {
      final FailureToMassage massage = FailureToMassage();
      emit(EmergencyLeaveRequestErrorState(
        message: massage.mapFailureToMessage(failure),
      ));
    }, (BaseEntity<EmergencyLeaveRequestEntity> response) {
      emit(EmergencyLeaveRequestReadyState(response));
    });
  }
}
