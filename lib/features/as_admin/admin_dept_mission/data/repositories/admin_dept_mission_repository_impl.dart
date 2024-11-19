import 'package:injectable/injectable.dart';

import '../../../../../core/network/base_handling.dart';
import '../../../../shared/entity/base_entity.dart';
import '../../domain/repositories/admin_dept_mission_repository.dart';
import '../data_sources/remote/admin_dept_mission_remote_data_source.dart';
import '../models/request/admin_dept_mission_request_model.dart';
import '../models/response/admin_dept_mission_response_model.dart';

@Injectable(as: AdminDeptMissionRepository)
class AdminDeptMissionRepositoryImp implements AdminDeptMissionRepository {
  AdminDeptMissionRepositoryImp({
    required this.adminDeptMissionRemoteDataSource,
  });

  final AdminDeptMissionRemoteDataSource adminDeptMissionRemoteDataSource;

  @override
  Future<CustomResponseType<BaseEntity<AdminDeptMissionModel>>>
      getAdminDeptMission(
          {required AdminDeptMissionRequestModel
              adminDeptMissionParams}) async {
    return await adminDeptMissionRemoteDataSource.getAdminDeptMission(
        adminDeptMissionRequestModel: adminDeptMissionParams);
  }
}
