import 'package:injectable/injectable.dart';

import '../../../../core/network/base_handling.dart';
import '../../../shared/entity/base_entity.dart';
import '../../domain/repositories/annual_leave_request_repository.dart';
import '../data_sources/remote/annual_leave_request_remote_data_source.dart';
import '../models/request/annual_leave_request_request_model.dart';

@Injectable(as: AnnualLeaveRequestRepository)
class AnnualLeaveRequestRepositoryImp implements AnnualLeaveRequestRepository {
  AnnualLeaveRequestRepositoryImp({
    required this.annualLeaveRequestRemoteDataSource,
  });

  final AnnualLeaveRequestRemoteDataSource annualLeaveRequestRemoteDataSource;

  @override
  Future<CustomResponseType<BaseEntity<String>>> createAnnualLeaveRequest(
      {required AnnualLeaveRequestRequestModel
          annualLeaveRequestRequestModel}) async {
    return annualLeaveRequestRemoteDataSource.createAnnualLeaveRequest(
        annualLeaveRequestRequestModel: annualLeaveRequestRequestModel);
  }

  @override
  Future<CustomResponseType<BaseEntity<dynamic>>>
      getAnnualLeaveBalance() async {
    return annualLeaveRequestRemoteDataSource.getAnnualLeaveBalance();
  }
}
