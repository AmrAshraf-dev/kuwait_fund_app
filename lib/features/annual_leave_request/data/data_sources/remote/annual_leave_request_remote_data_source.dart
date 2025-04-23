import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
  import 'package:kf_ess_mobile_app/features/annual_leave_request/data/models/response/leave_balance_response_model.dart';

import '../../../../../core/network/api/network_apis_constants.dart';
import '../../../../../core/network/base_handling.dart';
import '../../../../../core/network/network_helper.dart';
import '../../../../../error/failure.dart';
import '../../models/request/annual_leave_request_request_model.dart';
 
abstract class AnnualLeaveRequestRemoteDataSource {
  Future<CustomResponseType<AnnualLeaveScreenInfoResponseModel>> getAnnualLeaveBalance();

  Future<CustomResponseType<String>>
      createAnnualLeaveRequest(
          {required AnnualLeaveRequestRequestModel
              annualLeaveRequestRequestModel});

  
}

@Injectable(as: AnnualLeaveRequestRemoteDataSource)
class AnnualLeaveRequestDataSourceImpl
    implements AnnualLeaveRequestRemoteDataSource {
  AnnualLeaveRequestDataSourceImpl(this.networkHelper);
  final NetworkHelper networkHelper;

  @override
  Future<CustomResponseType<String>>
      createAnnualLeaveRequest(
          {required AnnualLeaveRequestRequestModel
              annualLeaveRequestRequestModel}) async {
    ({dynamic response, bool success}) result = await networkHelper.post(
        path: ApiConstants.createAnnualLeaveRequest,
        data: annualLeaveRequestRequestModel.toJson());

    if (result.success) {
      return right(   result.response["data"]["returnMsg"]);
    } else {
      return left(ServerFailure(message: result.response as String));
    }
  }

  @override
  Future<CustomResponseType<AnnualLeaveScreenInfoResponseModel>>
      getAnnualLeaveBalance() async {
    ({dynamic response, bool success}) result = await networkHelper.get(
      path: ApiConstants.getAnnualLeaveBalance,
    );

    if (result.success) {
      return right(AnnualLeaveScreenInfoResponseModel.fromJson(result.response));
    } else {
      return left(ServerFailure(message: result.response as String));
    }
  }

  
}
