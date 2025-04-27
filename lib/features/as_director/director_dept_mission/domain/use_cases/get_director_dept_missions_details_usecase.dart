import 'package:injectable/injectable.dart';
import 'package:kf_ess_mobile_app/features/as_director/director_dept_mission/data/models/request/director_dept_mission_details_request_model.dart';
import 'package:kf_ess_mobile_app/features/as_director/director_dept_mission/domain/entities/director_dept_mission_details_entity.dart';
import 'package:kf_ess_mobile_app/features/as_director/director_home_mission/data/models/request/director_mission_details_request_model.dart';
 import 'package:kf_ess_mobile_app/features/as_director/director_home_mission/domain/repositories/director_home_repository.dart';

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
