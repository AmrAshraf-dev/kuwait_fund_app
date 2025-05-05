import 'package:injectable/injectable.dart';
import '../../data/models/request/dept_calendar_data_request_model.dart';
import '../entities/director_dept_calendar_data_entity.dart';

import "../../../../../core/domain/usecase/base_usecase.dart";
import '../../../../../core/network/base_handling.dart';
import '../../../../shared/entity/base_entity.dart';
 import "../repositories/director_dept_mission_repository.dart";

@injectable
class GetDeptCalenderDataUseCase
    implements
        UseCase<BaseEntity<List<DirectorDeptCalendarDataEntity>>, DeptCalenderDataRequestModel> {
  
  GetDeptCalenderDataUseCase(
      {required this.directorDeptMissionRepository});

  final DirectorDeptMissionRepository directorDeptMissionRepository;

  @override
  Future<CustomResponseType<BaseEntity <List<DirectorDeptCalendarDataEntity>>>> call(
  DeptCalenderDataRequestModel params,
  ) {
    return directorDeptMissionRepository.getDeptCalenderData(
      deptCalenderDataRequestModel: params,
    );
  }
  
}
