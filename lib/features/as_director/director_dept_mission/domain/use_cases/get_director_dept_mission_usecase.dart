import 'package:injectable/injectable.dart';

import "../../../../../core/domain/usecase/base_usecase.dart";
import '../../../../../core/network/base_handling.dart';
import '../../../../shared/entity/base_entity.dart';
import "../../data/models/request/admin_dept_mission_request_model.dart";
import "../entities/director_dept_mission_entity.dart";
import "../repositories/director_dept_mission_repository.dart";

@injectable
class GetAdminDeptMissionUseCase
    implements
        UseCase<BaseEntity<AdminDeptMissionEntity>,
            AdminDeptMissionRequestModel> {
  GetAdminDeptMissionUseCase({required this.adminDeptMissionRepository});

  final AdminDeptMissionRepository adminDeptMissionRepository;

  @override
  Future<CustomResponseType<BaseEntity<AdminDeptMissionEntity>>> call(
    AdminDeptMissionRequestModel params,
  ) {
    return adminDeptMissionRepository.getAdminDeptMission(
        adminDeptMissionParams: params);
  }
}
