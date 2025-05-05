import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import '../../data/models/request/dept_calendar_data_request_model.dart';
import '../../data/models/request/director_dept_mission_details_request_model.dart';
import '../../domain/entities/director_dept_calendar_data_entity.dart';
import '../../domain/entities/director_dept_mission_details_entity.dart';
import '../../domain/use_cases/get_dept_calendar_data_usecase.dart';
import '../../domain/use_cases/get_director_dept_missions_details_usecase.dart';
 
import "../../../../../core/network/base_handling.dart";
import '../../../../../error/failure.dart';
import "../../../../shared/entity/base_entity.dart";
import '../../domain/entities/director_dept_mission_entity.dart';
import '../../domain/use_cases/get_all_depts_usecase.dart';

part 'director_dept_mission_state.dart';

@injectable
class  DirectorDeptMissionCubit extends Cubit<DirectorDeptMissionState> {
  final GetAllDeptsUsecase  getAllDeptsUsecase;
  final GetDeptCalenderDataUseCase getDeptCalenderDataUseCase;
  final GetDirectorDeptMissionsDetailsUseCase getDirectorDeptMissionsDetailsUseCase;
  DirectorDeptMissionCubit({required this.getAllDeptsUsecase,
    required this.getDirectorDeptMissionsDetailsUseCase,
  required this.getDeptCalenderDataUseCase})
      : super(DirectorDeptMissionInitialState());

  Future<void> getAllDepts () async {
    await Future.delayed(const Duration(milliseconds: 100));
    emit(DirectorDeptMissionLoadingState());

    final CustomResponseType<BaseEntity<List<DeptEntity>>>
        eitherPackagesOrFailure =
        await getAllDeptsUsecase();

    eitherPackagesOrFailure.fold((Failure failure) {
      final FailureToMassage massage = FailureToMassage();
      emit(DirectorDeptDropMenuMissionErrorState(
        message: massage.mapFailureToMessage(failure),
      ));
    }, (BaseEntity<List<DeptEntity>> response) {
      emit(DirectorDeptsListReadyState(response));
    });
  }



    getDeptCalenderData(DeptCalenderDataRequestModel deptCalenderDataRequestModel) 
  async {
await Future.delayed(const Duration(milliseconds: 100));
    emit(DirectorDeptMissionLoadingState());

    final CustomResponseType<BaseEntity<List<DirectorDeptCalendarDataEntity>>>
        eitherPackagesOrFailure = await getDeptCalenderDataUseCase(deptCalenderDataRequestModel);

    eitherPackagesOrFailure.fold((Failure failure) {
      final FailureToMassage massage = FailureToMassage();
      emit(DirectorDeptCalendarMissionErrorState(
        message: massage.mapFailureToMessage(failure),
      ));
    }, (BaseEntity<List<DirectorDeptCalendarDataEntity>> response) {
      emit(DirectorDeptMissionReadyState(response));
    });
  }



getDirecatorsDeptMissionsDetailsList(DirectorDeptMissionDetailsRequestModel directorMissionDetailsRequestModel, {required bool showNewBottomSheet}) async  


{

    emit(DirectorDeptMissionLoadingState());

    final CustomResponseType<BaseEntity<List<DirectorDeptMissionDetailsEntity>>>
        eitherPackagesOrFailure = await getDirectorDeptMissionsDetailsUseCase(directorMissionDetailsRequestModel);

    eitherPackagesOrFailure.fold((Failure failure) {
      final FailureToMassage massage = FailureToMassage();
      emit(DirectorDeptMissionErrorState(
        message: massage.mapFailureToMessage(failure),
      ));
    }, (BaseEntity<List<DirectorDeptMissionDetailsEntity>> response) {
      emit(DirectorDeptMissionDetailsReadyState(response, showNewBottomSheet: showNewBottomSheet));
    });
}



}
