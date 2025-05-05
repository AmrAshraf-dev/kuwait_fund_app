import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/network/base_handling.dart';
import '../../../../error/failure.dart';
import '../../data/models/request/sick_leave_request_model.dart';
import '../../domain/use_cases/create_sick_leave_usecase.dart';
import '../../../shared/entity/base_entity.dart';

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
