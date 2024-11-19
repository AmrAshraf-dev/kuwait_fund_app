import 'package:injectable/injectable.dart';

import '../../../../../core/network/base_handling.dart';
import '../../../../shared/entity/base_entity.dart';
import '../../domain/repositories/admin_director_mission_repository.dart';
import '../data_sources/remote/admin_director_mission_remote_data_source.dart';
import '../models/request/admin_director_mission_request_model.dart';
import '../models/response/admin_director_mission_response_model.dart';

@Injectable(as: AdminDirectorMissionRepository)
class AdminDirectorMissionRepositoryImp
    implements AdminDirectorMissionRepository {
  AdminDirectorMissionRepositoryImp({
    required this.adminDirectorMissionRemoteDataSource,
  });

  final AdminDirectorMissionRemoteDataSource
      adminDirectorMissionRemoteDataSource;

  @override
  Future<CustomResponseType<BaseEntity<AdminDirectorMissionModel>>>
      getAdminDirectorMission(
          {required AdminDirectorMissionRequestModel
              adminDirectorMissionParams}) async {
    return await adminDirectorMissionRemoteDataSource.getAdminDirectorMission(
        adminDirectorMissionRequestModel: adminDirectorMissionParams);
  }
}
