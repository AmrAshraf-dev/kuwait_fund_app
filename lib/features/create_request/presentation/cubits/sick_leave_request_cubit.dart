import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:kf_ess_mobile_app/core/network/base_handling.dart';
import 'package:kf_ess_mobile_app/error/failure.dart';
import 'package:kf_ess_mobile_app/features/create_request/data/models/request/sick_leave_request_model.dart';
 import 'package:kf_ess_mobile_app/features/create_request/domain/use_cases/create_sick_leave_usecase.dart';
import 'package:kf_ess_mobile_app/features/shared/entity/base_entity.dart';

part 'sick_leave_request_state.dart';

@injectable
class CreateSickLeaveRequestCubit extends Cubit<CreateSickLeaveRequestState> {
  final CreateSickLeaveRequestUseCase createSickLeaveRequestUseCase;

  CreateSickLeaveRequestCubit({
    required this.createSickLeaveRequestUseCase,
  }) : super(CreateSickLeaveRequestInitialState());

  void createSickLeaveRequest(
      SickLeaveRequestModel sickLeaveRequestModel) async {
    emit(CreateSickLeaveRequestLoadingState());

    final CustomResponseType<BaseEntity<String>> eitherPackagesOrFailure =
        await createSickLeaveRequestUseCase(sickLeaveRequestModel);

    eitherPackagesOrFailure.fold((Failure failure) {
      final FailureToMassage massage = FailureToMassage();
      emit(CreateSickLeaveRequestErrorState(
        message: massage.mapFailureToMessage(failure),
      ));
    }, (BaseEntity<String> response) {
      emit(CreateSickLeaveRequestReadyState(
          sickLeaveRequestModel: sickLeaveRequestModel));
    });
  }
}
