import 'package:injectable/injectable.dart';

import "../../../../../core/domain/usecase/base_usecase.dart";
import '../../../../../core/network/base_handling.dart';
import '../../../../shared/entity/base_entity.dart';
import "../../data/models/request/admin_director_mission_request_model.dart";
import "../entities/director_director_mission_entity.dart";
import "../repositories/director_director_mission_repository.dart";

@injectable
class GetAdminDirectorMissionUseCase
    implements
        UseCase<BaseEntity<AdminDirectorMissionEntity>,
            AdminDirectorMissionRequestModel> {
  GetAdminDirectorMissionUseCase(
      {required this.adminDirectorMissionRepository});

  final AdminDirectorMissionRepository adminDirectorMissionRepository;

  @override
  Future<CustomResponseType<BaseEntity<AdminDirectorMissionEntity>>> call(
    AdminDirectorMissionRequestModel params,
  ) {
    return adminDirectorMissionRepository.getAdminDirectorMission(
        adminDirectorMissionParams: params);
  }
}
