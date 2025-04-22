import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:kf_ess_mobile_app/features/requests/data/models/request/delete_leave_request_model.dart';
import 'package:kf_ess_mobile_app/features/requests/data/models/request/extend_leave_request_model.dart';
import 'package:kf_ess_mobile_app/features/requests/domain/entities/delete_leave_entity.dart';
import 'package:kf_ess_mobile_app/features/requests/domain/entities/extend_leave_entity.dart';
import 'package:kf_ess_mobile_app/features/requests/domain/use_cases/delete_leave_request_usecase.dart';

import "../../../../../core/network/base_handling.dart";
import '../../../../../error/failure.dart';
import "../../../../shared/entity/base_entity.dart";

part 'delete_leave_state.dart';

@injectable
class DeleteLeaveCubit extends Cubit<DeleteLeaveState> {
  final GetDeleteLeaveUseCase getDeleteLeaveUseCase;
  DeleteLeaveCubit({required this.getDeleteLeaveUseCase})
      : super(DeleteLeaveInitialState());

  Future<void> getDeleteLeave(
      {required DeleteLeaveRequestModel deleteLeaveRequestModel}) async {
        await Future.delayed(const Duration(milliseconds: 100));
    emit(DeleteLeaveLoadingState());

    final CustomResponseType<String>
        eitherPackagesOrFailure =
        await getDeleteLeaveUseCase(deleteLeaveRequestModel);

    eitherPackagesOrFailure.fold((Failure failure) {
      final FailureToMassage massage = FailureToMassage();
      emit(DeleteLeaveErrorState(
        message: massage.mapFailureToMessage(failure),
      ));
    }, (String response) {

      emit(DeleteLeaveReadyState(response));
    
    });
  }
}
