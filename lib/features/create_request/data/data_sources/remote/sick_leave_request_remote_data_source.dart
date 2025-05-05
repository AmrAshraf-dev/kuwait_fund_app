import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../../core/network/api/network_apis_constants.dart';
import '../../../../../core/network/base_handling.dart';
import '../../../../../core/network/network_helper.dart';
import '../../../../../error/failure.dart';
import '../../../../annual_leave_request/data/models/response/leave_balance_response_model.dart';
import '../../models/response/leave_balance_response_model.dart';
import '../../../../shared/entity/base_entity.dart';

abstract class SickLeaveRequestRemoteDataSource {
  Future<CustomResponseType<BaseEntity<String>>> createSickLeaveRequest(
      sickLeaveRequestModel);

  // Future<CustomResponseType<LeaveBalanceModel>> getLeaveBalance();
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

    if (result.success &&result.response["code"]==200 ) {
      return right(BaseEntity<String>(data: result.response["data"]));
    } else {
      return left(ServerFailure(message: result.response));
    }
  }

  // @override
  // Future<Either<Failure, LeaveBalanceModel>> getLeaveBalance() async {
  //   ({dynamic response, bool success}) result = await networkHelper.get(
  //     path: ApiConstants.getMyLeaveBalance,
  //   );

  //   if (result.success) {
  //     return right(LeaveBalanceModel.fromJson(result.response));
  //   } else {
  //     return left(ServerFailure(message: result.response as String));
  //   }
  // }
}
