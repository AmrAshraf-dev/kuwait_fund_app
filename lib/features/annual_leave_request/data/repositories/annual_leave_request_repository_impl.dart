import 'package:injectable/injectable.dart';
import '../models/response/leave_balance_response_model.dart';
import '../../domain/entities/annual_leave_request_entity.dart';
import '../../../shared/entity/base_entity.dart';
 
import '../../../../core/network/base_handling.dart';
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
  Future<CustomResponseType< String >> createAnnualLeaveRequest(
      {required AnnualLeaveRequestRequestModel
          annualLeaveRequestRequestModel}) async {
    return annualLeaveRequestRemoteDataSource.createAnnualLeaveRequest(
        annualLeaveRequestRequestModel: annualLeaveRequestRequestModel);
  }

  @override
  Future<CustomResponseType<BaseEntity<AnnualLeaveRequestEntity>>>
      getAnnualLeaveBalance() async {
    return annualLeaveRequestRemoteDataSource.getAnnualLeaveBalance();
  }

  

  
}
