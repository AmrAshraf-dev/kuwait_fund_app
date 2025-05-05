import 'package:injectable/injectable.dart';
import '../../data/models/request/director_dept_mission_details_request_model.dart';
import '../entities/director_dept_mission_details_entity.dart';
import '../../../director_mission/data/models/request/director_mission_details_request_model.dart';
import '../../../director_mission/domain/repositories/director_home_repository.dart';

import "../../../../../core/domain/usecase/base_usecase.dart";
import '../../../../../core/network/base_handling.dart';
import '../../../../shared/entity/base_entity.dart';
 
@injectable
class GetDirectorDeptMissionsDetailsUseCase
    implements UseCase<BaseEntity<List<DirectorDeptMissionDetailsEntity>>, DirectorDeptMissionDetailsRequestModel> {
  GetDirectorDeptMissionsDetailsUseCase({required this.adminHomeRepository});

  final AdminHomeRepository adminHomeRepository;

  @override
  Future<CustomResponseType<BaseEntity<List<DirectorDeptMissionDetailsEntity>>>> call(
    DirectorDeptMissionDetailsRequestModel directorDeptMissionDetailsRequestModel
  ) {
    return adminHomeRepository.getDirectorDeptMissionsDetails(directorDeptMissionDetailsRequestModel);
  }
}
