import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import '../../data/models/request/director_mission_details_request_model.dart';
import '../../data/models/request/management_calender_data_request_model.dart';
import '../../domain/entities/director_entity.dart';
import '../../domain/entities/director_mission_details_entity.dart';
import '../../domain/entities/management_calender_data_entity.dart';
import '../../domain/use_cases/get_director_missions_details_usecase.dart';
import '../../domain/use_cases/get_management_calender_data_usecase.dart';

import "../../../../../core/network/base_handling.dart";
import '../../../../../error/failure.dart';
import "../../../../shared/entity/base_entity.dart";
import '../../domain/use_cases/get_directors_list_usecase.dart';

part 'director_mission_state.dart';

@injectable
class DirectorMissionCubit extends Cubit<DirectorMissionState> {
  final GetDirectorsListUseCase getDirectorsListUseCase;
    final GetManagementCalenderDataUseCase getManagementCalenderDataUseCase;
final GetDirectorMissionsDetailsUseCase getDirectorMissionsDetailsUseCase;
  

  DirectorMissionCubit({required this.getDirectorsListUseCase, required this.getManagementCalenderDataUseCase,
  
  required this.getDirectorMissionsDetailsUseCase})
      : super(DirectorMissionInitialState());

  Future<void> getDirectorsList(
      ) async {
    emit(DirectorMissionLoadingState());

    final CustomResponseType<BaseEntity<List<DirectorEntity>>>
        eitherPackagesOrFailure = await getDirectorsListUseCase();

    eitherPackagesOrFailure.fold((Failure failure) {
      final FailureToMassage massage = FailureToMassage();
      emit(DirectorMissionListErrorState(
        message: massage.mapFailureToMessage(failure),
      ));
    }, (BaseEntity<List<DirectorEntity>> response) {
      emit(DirectorsListReadyState(response));
    });
  }

  getManagementCalenderData(ManagementCalenderDataRequestModel managementCalenderDataRequestModel) 
  async {
await Future.delayed(const Duration(milliseconds: 100));
    emit(DirectorMissionLoadingState());

    final CustomResponseType<BaseEntity<List<ManagementCalenderDataEntity>>>
        eitherPackagesOrFailure = await getManagementCalenderDataUseCase(managementCalenderDataRequestModel);

    eitherPackagesOrFailure.fold((Failure failure) {
      final FailureToMassage massage = FailureToMassage();
      emit(DirectorMissionErrorState(
        message: massage.mapFailureToMessage(failure),
      ));
    }, (BaseEntity<List<ManagementCalenderDataEntity>> response) {
      emit(DirectorMissionReadyState(response));
    });
  }



getDirecatorsMissionsDetailsList(DirectorMissionDetailsRequestModel directorMissionDetailsRequestModel, {required bool showNewBottomSheet}) async  


{

    emit(DirectorMissionLoadingState());

    final CustomResponseType<BaseEntity<List<DirectorMissionDetailsEntity>>>
        eitherPackagesOrFailure = await getDirectorMissionsDetailsUseCase(directorMissionDetailsRequestModel);

    eitherPackagesOrFailure.fold((Failure failure) {
      final FailureToMassage massage = FailureToMassage();
      emit(DirectorMissionErrorState(
        message: massage.mapFailureToMessage(failure),
      ));
    }, (BaseEntity<List<DirectorMissionDetailsEntity>> response) {
      emit(DirectorMissionDetailsReadyState(response, showNewBottomSheet: showNewBottomSheet));
    });
}


  
}
