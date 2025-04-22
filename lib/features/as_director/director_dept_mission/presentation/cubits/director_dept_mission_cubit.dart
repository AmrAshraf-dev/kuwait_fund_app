import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:kf_ess_mobile_app/features/as_director/director_dept_mission/data/models/request/dept_calendar_data_request_model.dart';
import 'package:kf_ess_mobile_app/features/as_director/director_dept_mission/domain/entities/director_dept_calendar_data_entity.dart';
import 'package:kf_ess_mobile_app/features/as_director/director_dept_mission/domain/entities/director_dept_mission_details_entity.dart';
import 'package:kf_ess_mobile_app/features/as_director/director_dept_mission/domain/use_cases/get_all_depts_usecase%20copy.dart';
import 'package:kf_ess_mobile_app/features/as_director/director_home_mission/domain/entities/director_mission_details_entity.dart';

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
  DirectorDeptMissionCubit({required this.getAllDeptsUsecase,
  required this.getDeptCalenderDataUseCase})
      : super(DirectorDeptMissionInitialState());

  Future<void> getAllDepts () async {
    emit(DirectorDeptMissionLoadingState());

    final CustomResponseType<BaseEntity<List<DeptEntity>>>
        eitherPackagesOrFailure =
        await getAllDeptsUsecase();

    eitherPackagesOrFailure.fold((Failure failure) {
      final FailureToMassage massage = FailureToMassage();
      emit(DirectorDeptMissionErrorState(
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
      emit(DirectorDeptMissionErrorState(
        message: massage.mapFailureToMessage(failure),
      ));
    }, (BaseEntity<List<DirectorDeptCalendarDataEntity>> response) {
      emit(DirectorDeptMissionReadyState(response));
    });
  }


}
