import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';

import "../../../../../core/network/base_handling.dart";
import '../../../../../error/failure.dart';
import "../../../../shared/entity/base_entity.dart";
import '../../data/models/request/admin_dept_mission_request_model.dart';
import '../../domain/entities/director_dept_mission_entity.dart';
import '../../domain/use_cases/get_director_dept_mission_usecase.dart';

part 'admin_dept_mission_state.dart';

@injectable
class AdminDeptMissionCubit extends Cubit<AdminDeptMissionState> {
  final GetAdminDeptMissionUseCase getAdminDeptMissionUseCase;
  AdminDeptMissionCubit({required this.getAdminDeptMissionUseCase})
      : super(AdminDeptMissionInitialState());

  Future<void> getAdminDeptMission(
      {required AdminDeptMissionRequestModel adminDeptMissionModel}) async {
    emit(AdminDeptMissionLoadingState());

    final CustomResponseType<BaseEntity<AdminDeptMissionEntity>>
        eitherPackagesOrFailure =
        await getAdminDeptMissionUseCase(adminDeptMissionModel);

    eitherPackagesOrFailure.fold((Failure failure) {
      final FailureToMassage massage = FailureToMassage();
      emit(AdminDeptMissionErrorState(
        message: massage.mapFailureToMessage(failure),
      ));
    }, (BaseEntity<AdminDeptMissionEntity> response) {
      emit(AdminDeptMissionReadyState(response));
    });
  }
}
