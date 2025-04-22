import 'package:injectable/injectable.dart';

import "../../../../../core/domain/usecase/base_usecase.dart";
import '../../../../../core/network/base_handling.dart';
import '../../../../shared/entity/base_entity.dart';
 import "../entities/director_dept_mission_entity.dart";
import "../repositories/director_dept_mission_repository.dart";

@injectable
class GetAllDeptsUsecase
    implements
        UseCaseNoParam<BaseEntity<List<DeptEntity>>>
  {
  GetAllDeptsUsecase(
      {required this.directorDeptMissionRepository});

  final DirectorDeptMissionRepository directorDeptMissionRepository;

  @override
  Future<CustomResponseType<BaseEntity <List<DeptEntity>>>> call(
  
  ) {
    return directorDeptMissionRepository.getAllDepts(
      );
  }
}
