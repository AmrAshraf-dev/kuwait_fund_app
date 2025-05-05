import 'package:injectable/injectable.dart';
import '../../../director_dept_mission/data/models/request/director_dept_mission_details_request_model.dart';
import '../../../director_dept_mission/domain/entities/director_dept_mission_details_entity.dart';
import '../models/request/director_mission_details_request_model.dart';
import '../models/request/management_calender_data_request_model.dart';
import '../models/response/director_mission_details_reponse_model.dart';
import '../models/response/management_calender_data_response_model.dart';
   
import '../../../../../core/network/base_handling.dart';
import '../../../../shared/entity/base_entity.dart';
import '../../domain/repositories/director_home_repository.dart';
import '../data_sources/remote/director_home_remote_data_source.dart';
import '../models/response/directors_response_model.dart';

@Injectable(as: AdminHomeRepository)
class AdminHomeRepositoryImp implements AdminHomeRepository {
  AdminHomeRepositoryImp({
    required this.adminHomeRemoteDataSource,
  });

  final AdminHomeRemoteDataSource adminHomeRemoteDataSource;


@override
  Future<CustomResponseType<BaseEntity<List<DirectorsModel>>>> getDirectorsList(
       ) async {
    return await adminHomeRemoteDataSource.getDirectorsList(
       );
  }

  @override
  Future<CustomResponseType<BaseEntity<List<ManagementCalenderDataModel>>>> getManagementCalenderData(ManagementCalenderDataRequestModel managementCalenderDataRequestModel) async {
    return await adminHomeRemoteDataSource.getManagementCalenderData(managementCalenderDataRequestModel);
  }

  @override
  Future<CustomResponseType<BaseEntity<List<DirectorMissionDetailsModel>>>> getDirectorMissionsDetails(DirectorMissionDetailsRequestModel directorMissionDetailsRequestModel) async {
    return await adminHomeRemoteDataSource.getDirectorMissionsDetails(directorMissionDetailsRequestModel);
  }

  @override
  Future<CustomResponseType<BaseEntity<List<DirectorDeptMissionDetailsEntity>>>> getDirectorDeptMissionsDetails(DirectorDeptMissionDetailsRequestModel directorDeptMissionDetailsRequestModel)  async {
    return await adminHomeRemoteDataSource.getDirectorDeptMissionsDetails(directorDeptMissionDetailsRequestModel);
  }
}
