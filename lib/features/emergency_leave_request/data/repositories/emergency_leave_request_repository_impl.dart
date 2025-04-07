import 'package:injectable/injectable.dart';

import '../../../../core/network/base_handling.dart';
import '../../../emergency_leave_request/data/data_sources/remote/emergency_leave_request_remote_data_source.dart';
import '../../../shared/entity/base_entity.dart';
import '../../domain/repositories/emergency_leave_request_repository.dart';
import '../models/request/emergency_leave_request_request_model.dart';
import '../models/response/emergency_leave_request_response_model.dart';

@Injectable(as: EmergencyLeaveRequestRepository)
class EmergencyLeaveRequestRepositoryImp
    implements EmergencyLeaveRequestRepository {
  EmergencyLeaveRequestRepositoryImp({
    required this.emergencyLeaveRequestRemoteDataSource,
  });

  final EmergencyLeaveRequestRemoteDataSource
      emergencyLeaveRequestRemoteDataSource;

  @override
  Future<CustomResponseType<BaseEntity<String>>>
      createEmergencyLeaveRequest(
          {required EmergencyLeaveRequestRequestModel
              emergencyLeaveRequestParams}) async {
    return await emergencyLeaveRequestRemoteDataSource
        .createEmergencyLeaveRequest(
            emergencyLeaveRequestRequestModel: emergencyLeaveRequestParams);
  }

  @override
  Future<CustomResponseType<BaseEntity<dynamic>>>
      getEmergencyAvailableDays() async {
    return await emergencyLeaveRequestRemoteDataSource
        .getEmergencyAvailableDays();
  }

  @override
  Future<CustomResponseType<BaseEntity<dynamic>>>
      getEmergencyLeaveBalance() async {
    return await emergencyLeaveRequestRemoteDataSource
        .getEmergencyLeaveBalance();
  }
}
