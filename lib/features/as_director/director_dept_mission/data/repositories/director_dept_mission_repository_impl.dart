import 'package:injectable/injectable.dart';
import 'package:kf_ess_mobile_app/features/as_director/director_dept_mission/data/models/request/dept_calendar_data_request_model.dart';
import 'package:kf_ess_mobile_app/features/as_director/director_dept_mission/data/models/response/dept_calendar_data_response_model.dart';
import 'package:kf_ess_mobile_app/features/as_director/director_dept_mission/data/models/response/dept_response_model.dart';
import 'package:kf_ess_mobile_app/features/as_director/director_dept_mission/domain/entities/director_dept_calendar_data_entity.dart';

import '../../../../../core/network/base_handling.dart';
import '../../../../shared/entity/base_entity.dart';
import '../../domain/repositories/director_dept_mission_repository.dart';
import '../data_sources/remote/director_dept_mission_remote_data_source.dart';
 

@Injectable(as: DirectorDeptMissionRepository)
class DirectorDeptMissionRepositoryImp
    implements DirectorDeptMissionRepository {
  DirectorDeptMissionRepositoryImp({
    required this.directorDeptMissionRemoteDataSource,
  });

  final DirectorDeptMissionRemoteDataSource
      directorDeptMissionRemoteDataSource;

  @override
  Future<CustomResponseType<BaseEntity<List<DeptModel>>>>
      getAllDepts(
          ) async {
    return await directorDeptMissionRemoteDataSource.getAllDepts(
        );
  }

  @override
  Future<CustomResponseType<BaseEntity<List<DeptCalendarDataModel>>>> getDeptCalenderData({required DeptCalenderDataRequestModel deptCalenderDataRequestModel}) {
    return directorDeptMissionRemoteDataSource.getDeptCalenderData(
      deptCalenderDataRequestModel: deptCalenderDataRequestModel,
    );
  }
}
