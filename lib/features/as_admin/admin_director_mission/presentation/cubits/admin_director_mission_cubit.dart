import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';

import "../../../../../core/network/base_handling.dart";
import '../../../../../error/failure.dart';
import "../../../../shared/entity/base_entity.dart";
import '../../data/models/request/admin_director_mission_request_model.dart';
import '../../domain/entities/admin_director_mission_entity.dart';
import '../../domain/use_cases/get_admin_director_mission_usecase.dart';

part 'admin_director_mission_state.dart';

@injectable
class AdminDirectorMissionCubit extends Cubit<AdminDirectorMissionState> {
  final GetAdminDirectorMissionUseCase getAdminDirectorMissionUseCase;
  AdminDirectorMissionCubit({required this.getAdminDirectorMissionUseCase})
      : super(AdminDirectorMissionInitialState());

  Future<void> getAdminDirectorMission(
      {required AdminDirectorMissionRequestModel
          adminDirectorMissionModel}) async {
    emit(AdminDirectorMissionLoadingState());

    final CustomResponseType<BaseEntity<AdminDirectorMissionEntity>>
        eitherPackagesOrFailure =
        await getAdminDirectorMissionUseCase(adminDirectorMissionModel);

    eitherPackagesOrFailure.fold((Failure failure) {
      final FailureToMassage massage = FailureToMassage();
      emit(AdminDirectorMissionErrorState(
        message: massage.mapFailureToMessage(failure),
      ));
    }, (BaseEntity<AdminDirectorMissionEntity> response) {
      emit(AdminDirectorMissionReadyState(response));
    });
  }
}
