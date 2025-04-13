import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:kf_ess_mobile_app/core/network/api/network_apis_constants.dart';
import 'package:kf_ess_mobile_app/core/network/base_handling.dart';
import 'package:kf_ess_mobile_app/core/network/network_helper.dart';
import 'package:kf_ess_mobile_app/error/failure.dart';
import 'package:kf_ess_mobile_app/features/annual_leave_request/data/models/response/leave_balance_response_model.dart';
import 'package:kf_ess_mobile_app/features/create_request/data/models/response/leave_balance_response_model.dart';
import 'package:kf_ess_mobile_app/features/shared/entity/base_entity.dart';

abstract class SickLeaveRequestRemoteDataSource {
  Future<CustomResponseType<BaseEntity<String>>> createSickLeaveRequest(
      sickLeaveRequestModel);

  Future<CustomResponseType<LeaveBalanceModel>> getLeaveBalance();
}

@Injectable(as: SickLeaveRequestRemoteDataSource)
class SickLeaveRequestDataSourceImp
    implements SickLeaveRequestRemoteDataSource {
  final NetworkHelper networkHelper;
  SickLeaveRequestDataSourceImp(this.networkHelper);

  @override
  Future<CustomResponseType<BaseEntity<String>>> createSickLeaveRequest(
      sickLeaveRequestModel) async {
    ({dynamic response, bool success}) result = await networkHelper.post(
        path: ApiConstants.createSickLeaveRequest,
        data: sickLeaveRequestModel.toJson());

    if (result.success) {
      return right(BaseEntity<String>(data: result.response["data"] as String));
    } else {
      return left(ServerFailure(message: result.response as String));
    }
  }

  @override
  Future<Either<Failure, LeaveBalanceModel>> getLeaveBalance() async {
    ({dynamic response, bool success}) result = await networkHelper.get(
      path: ApiConstants.getMyLeaveBalance,
    );

    if (result.success) {
      return right(LeaveBalanceModel.fromJson(result.response));
    } else {
      return left(ServerFailure(message: result.response as String));
    }
  }
}
