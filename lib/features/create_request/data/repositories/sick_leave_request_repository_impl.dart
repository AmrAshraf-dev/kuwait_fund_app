import 'package:injectable/injectable.dart';
import '../data_sources/remote/sick_leave_request_remote_data_source.dart';
import '../models/response/leave_balance_response_model.dart';
import '../../domain/repositories/sick_leave_repository.dart';

import '../../../../core/network/base_handling.dart';
import '../../../shared/entity/base_entity.dart';

@Injectable(as: SickLeaveRequestRepository)
class SickLeaveRequestRepositoryImp implements SickLeaveRequestRepository {
  SickLeaveRequestRepositoryImp({
    required this.sickLeaveRequestRemoteDataSource,
  });

  final SickLeaveRequestRemoteDataSource sickLeaveRequestRemoteDataSource;

  @override
  Future<CustomResponseType<BaseEntity<String>>> createSickLeaveRequest(
      sickLeaveRequestModel) async {
    return await sickLeaveRequestRemoteDataSource
        .createSickLeaveRequest(sickLeaveRequestModel);
  }

  // @override
  // Future<CustomResponseType<LeaveBalanceModel>> getLeaveBalance() async {
  //   return await sickLeaveRequestRemoteDataSource.getLeaveBalance();
  // }
}
