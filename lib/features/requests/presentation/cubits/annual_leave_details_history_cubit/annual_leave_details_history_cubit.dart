import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:kf_ess_mobile_app/features/requests/data/models/request/annual_leave_details_request.model.dart';
import 'package:kf_ess_mobile_app/features/requests/domain/entities/annual_leave_details_entity.dart';
import 'package:kf_ess_mobile_app/features/requests/domain/use_cases/get_annual_leave_details_usecase.dart';

import "../../../../../core/network/base_handling.dart";
import '../../../../../error/failure.dart';
import "../../../../shared/entity/base_entity.dart";

part 'annual_leave_details_history_state.dart';

@injectable
class AnnualLeaveDetailsHistoryCubit
    extends Cubit<AnnualLeaveDetailsHistoryState> {
  final GetAnnualLeaveDetailsHistoryUseCase getAnnualLeaveDetailsHistoryUseCase;
  AnnualLeaveDetailsHistoryCubit(
      {required this.getAnnualLeaveDetailsHistoryUseCase})
      : super(AnnualLeaveDetailsHistoryInitialState());

  Future<void> getAnnualLeaveDetailsHistory(
      {required AnnualLeaveDetailsRequestModel
          annualLeaveDetailsRequestModel}) async {
    emit(AnnualLeaveDetailsHistoryLoadingState());

    final CustomResponseType<BaseEntity<List<AnnualLeaveDetailsEntity>>>
        eitherPackagesOrFailure = await getAnnualLeaveDetailsHistoryUseCase(
            annualLeaveDetailsRequestModel);

    eitherPackagesOrFailure.fold((Failure failure) {
      final FailureToMassage massage = FailureToMassage();
      emit(AnnualLeaveDetailsHistoryErrorState(
        message: massage.mapFailureToMessage(failure),
      ));
    }, (BaseEntity<List<AnnualLeaveDetailsEntity>> response) {
      if (response.data?.isEmpty ?? true) {
        emit(AnnualLeaveDetailsHistoryEmptyState());
        return;
      } else {
        emit(AnnualLeaveDetailsHistoryReadyState(response));
      }
    });
  }
}
