import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:kf_ess_mobile_app/features/requests/data/models/request/annual_leave_info_request_model.dart';
import 'package:kf_ess_mobile_app/features/requests/domain/entities/annual_leave_info_entity.dart';
import 'package:kf_ess_mobile_app/features/requests/domain/use_cases/get_annual_leave_info_usecase.dart';

import "../../../../../core/network/base_handling.dart";
import '../../../../../error/failure.dart';
import "../../../../shared/entity/base_entity.dart";

part 'annual_leave_info_state.dart';

@injectable
class AnnualLeaveInfoCubit extends Cubit<AnnualLeaveInfoState> {
  final GetAnnualLeaveInfoUseCase getAnnualLeaveInfoUseCase;
  AnnualLeaveInfoCubit({required this.getAnnualLeaveInfoUseCase})
      : super(AnnualLeaveInfoInitialState());

  Future<void> getAnnualLeaveInfo(
      {required AnnualLeaveInfoRequestModel
          annualLeaveInfoRequestModel}) async {
    emit(AnnualLeaveInfoLoadingState());

    final CustomResponseType<BaseEntity<AnnualLeaveInfoEntity>>
        eitherPackagesOrFailure =
        await getAnnualLeaveInfoUseCase(annualLeaveInfoRequestModel);

    eitherPackagesOrFailure.fold((Failure failure) {
      final FailureToMassage massage = FailureToMassage();
      emit(AnnualLeaveInfoErrorState(
        message: massage.mapFailureToMessage(failure),
      ));
    }, (BaseEntity<AnnualLeaveInfoEntity> response) {
      emit(AnnualLeaveInfoReadyState(response));
    });
  }
}
