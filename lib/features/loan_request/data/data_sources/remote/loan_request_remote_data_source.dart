import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:kf_ess_mobile_app/features/shared/entity/base_entity.dart';

import '../../../../../core/network/api/network_apis_constants.dart';
import '../../../../../core/network/base_handling.dart';
import '../../../../../core/network/network_helper.dart';
import '../../../../../error/failure.dart';
import '../../models/response/personal_loan_reason_response_model.dart';

abstract class LoanRequestRemoteDataSource {
  Future<CustomResponseType<PersonalLoanReasonResponseModel>> getLoanReasons();

  Future<CustomResponseType<BaseEntity<String>>> createAnnualLeaveRequest(
      loanRequestModel);
}

@Injectable(as: LoanRequestRemoteDataSource)
class LoanRequestDataSourceImpl implements LoanRequestRemoteDataSource {
  LoanRequestDataSourceImpl(this.networkHelper);
  final NetworkHelper networkHelper;

  @override
  Future<CustomResponseType<PersonalLoanReasonResponseModel>>
      getLoanReasons() async {
    ({dynamic response, bool success}) result =
        await networkHelper.get(path: ApiConstants.getLoanReasons);

    if (result.success) {
      return right(PersonalLoanReasonResponseModel.fromJson(result.response));
    } else {
      return left(ServerFailure(message: result.response as String));
    }
  }

  @override
  Future<CustomResponseType<BaseEntity<String>>> createAnnualLeaveRequest(
      loanRequestModel) async {
    ({dynamic response, bool success}) result = await networkHelper.post(
        path: ApiConstants.createPersonalLoanRequest,
        data: loanRequestModel.toJson());

    if (result.success) {
      return right(BaseEntity<String>(data: result.response as String));
    } else {
      return left(ServerFailure(message: result.response as String));
    }
  }
}
