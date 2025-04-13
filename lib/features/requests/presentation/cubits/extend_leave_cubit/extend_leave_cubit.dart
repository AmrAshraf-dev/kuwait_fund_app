import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:kf_ess_mobile_app/features/requests/data/models/request/extend_leave_request_model.dart';
import 'package:kf_ess_mobile_app/features/requests/domain/entities/extend_leave_entity.dart';
import 'package:kf_ess_mobile_app/features/requests/domain/use_cases/extend_leave_request_usecase.dart';

import "../../../../../core/network/base_handling.dart";
import '../../../../../error/failure.dart';
import "../../../../shared/entity/base_entity.dart";

part 'extend_leave_state.dart';

@injectable
class ExtendLeaveCubit extends Cubit<ExtendLeaveState> {
  final GetExtendLeaveUseCase getExtendLeaveUseCase;
  ExtendLeaveCubit({required this.getExtendLeaveUseCase})
      : super(ExtendLeaveInitialState());

  Future<void> getExtendLeave(
      {required ExtendLeaveRequestModel extendLeaveRequestModel}) async {
    emit(ExtendLeaveLoadingState());

    final CustomResponseType<BaseEntity<CreateExtendLeaveEntity>>
        eitherPackagesOrFailure =
        await getExtendLeaveUseCase(extendLeaveRequestModel);

    eitherPackagesOrFailure.fold((Failure failure) {
      final FailureToMassage massage = FailureToMassage();
      emit(ExtendLeaveErrorState(
        message: massage.mapFailureToMessage(failure),
      ));
    }, (BaseEntity<CreateExtendLeaveEntity> response) {
      emit(ExtendLeaveReadyState(response));
    });
  }
}
